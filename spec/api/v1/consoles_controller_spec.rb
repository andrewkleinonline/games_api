require 'rails_helper'

describe 'Console API Request' do
 
  it "renders a JSON response for all of the consoles" do
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
end


