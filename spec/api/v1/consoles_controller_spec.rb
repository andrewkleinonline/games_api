require 'rails_helper'

describe 'Console API Request' do

  it "renders a JSON response for all of the consoles" do
    Console.destroy_all
    console = Console.create(name: 'PS4', manufacturer: 'Sony', release_date: Date.strptime('2013-11-15', '%Y-%m-%d') )
    console1= Console.create(name: 'N64', manufacturer: 'Nintendo', release_date: Date.strptime('2008-11-15', '%Y-%m-%d'))
    get '/api/v1/consoles'

    response_body = JSON.parse(response.body)
    expect(response).to be_success
    expect(response_body.length).to eq(2)
  end

  it "renders a JSON response for the specified console" do
    console = Console.create(name: 'PS4', manufacturer: 'Sony', release_date: Date.strptime('2013-11-15', '%Y-%m-%d') )
    get "/api/v1/consoles/#{console.id}"

    response_body = JSON.parse(response.body)
    expect(response).to be_success
    expect(response_body["name"]).to eq(console.name)
    expect(response_body.keys).to include("video_games")
  end


   describe 'console creation:' do
      context "when valid" do
        it "creates a new instance of a console" do
          post '/api/v1/consoles', {console:{name: 'N64', manufacturer: 'Nintendo', release_date:'2008-11-15'}}
          console = Console.last

          console_json = JSON.parse(response.body)
          expect(response).to be_success
          expect(console.name).to eq('N64')

        end
      end


      context "when invalid" do
        it 'returns an error satus and message' do
          post '/api/v1/consoles', {console:{name: 'N64', manufacturer: 'Nintendo'}}
            response_body = JSON.parse(response.body)

            expect(response.status).to eq(500)
            expect(response_body).to eq("release_date" => ["can't be blank"])
        end
      end
    end


    describe 'console editing:' do
      context "when valid" do
        it 'returns an updated database instance' do
          Console.create(name: 'N64', manufacturer: 'Nintendo', release_date: Date.strptime('2008-11-15', '%Y-%m-%d'))
          patch "/api/v1/consoles/#{Console.last.id}", {console:{name: 'Amiga'}}

          console = Console.last
          console_json = JSON.parse(response.body)
          expect(response).to be_success
          expect(console.name).to eq('Amiga')
          expect(console.manufacturer).to eq('Nintendo')
        end
      end

      context "when invalid" do
        it 'returns an error message and response' do
          Console.create(name: 'N64', manufacturer: 'Nintendo', release_date: Date.strptime('2008-11-15', '%Y-%m-%d'))
          patch "/api/v1/consoles/#{Console.last.id}", {console:{name: nil}}
          console = Console.last

          console_json = JSON.parse(response.body)
          expect(response.status).to eq(500)
          expect(console_json).to eq("name" => ["can't be blank"])
        end
      end
    end

    describe 'destroy console' do
      it 'destroys a console record' do
        Console.create(name: 'N64', manufacturer: 'Nintendo', release_date: Date.strptime('2008-11-15', '%Y-%m-%d'))
        count = Console.count
        delete "/api/v1/consoles/#{Console.last.id}"

        expect(response).to be_success
        expect(Console.count).to eq(count-1)
      end
    end
end
