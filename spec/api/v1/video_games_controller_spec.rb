require 'rails_helper'

describe 'Video game API request' do
  it "renders a JSON response for all of the video games" do
    VideoGame.destroy_all
    vg = VideoGame.create(title: 'Final Fantasy', release_date: Date.strptime('2013-11-15', '%Y-%m-%d'), developer: 'SquareEnix', publisher: 'Sony')
    vg1= VideoGame.create(title: 'Star Fox', release_date: Date.strptime('1999-10-15', '%Y-%m-%d'), developer: 'Nintendo', publisher: 'Nintendo')
    get '/api/v1/video_games'

    response_body = JSON.parse(response.body)
    expect(response).to be_success
    expect(response_body.length).to eq(2)
  end

  it "renders a JSON response for the specified video game" do
    vg = VideoGame.create(title: 'Final Fantasy', release_date: Date.strptime('2013-11-15', '%Y-%m-%d'), developer: 'SquareEnix', publisher: 'Sony')
    get "/api/v1/video_games/#{vg.id}"

    response_body = JSON.parse(response.body)
    expect(response).to be_success
    expect(response_body["title"]).to eq(vg.title)
    expect(response_body.keys).to include("consoles")
  end


   describe 'video game creation:' do
      context "when valid" do
        it "creates a new instance of a video game" do
          post '/api/v1/video_games', {video_game: {title: 'Final Fantasy', release_date: Date.strptime('2013-11-15', '%Y-%m-%d'), developer: 'SquareEnix', publisher: 'Sony'}}
          vg = VideoGame.last

          vg_json = JSON.parse(response.body)
          expect(response).to be_success
          expect(vg.title).to eq('Final Fantasy')
        end
      end


      context "when invalid" do
        it 'returns an error satus and message' do
          post '/api/v1/video_games', {video_game: {release_date: Date.strptime('2013-11-15', '%Y-%m-%d'), developer: 'SquareEnix', publisher: 'Sony'}}
            response_body = JSON.parse(response.body)

            expect(response.status).to eq(500)
            expect(response_body).to eq("title" => ["can't be blank"])
        end
      end
    end


    describe 'video game editing:' do
      context "when valid" do
        it 'returns an updated database instance' do
          VideoGame.create(title: 'Final Fantasy', release_date: Date.strptime('2013-11-15', '%Y-%m-%d'), developer: 'SquareEnix', publisher: 'Sony')
          patch "/api/v1/video_games/#{VideoGame.last.id}", {video_game: {title: 'Star Fox'}}

          vg = VideoGame.last
          vg_json = JSON.parse(response.body)
          expect(response).to be_success
          expect(vg.title).to eq('Star Fox')
          expect(vg.developer).to eq('SquareEnix')
        end
      end

      context "when invalid" do
        it 'returns an error message and response' do
          VideoGame.create(title: 'Final Fantasy', release_date: Date.strptime('2013-11-15', '%Y-%m-%d'), developer: 'SquareEnix', publisher: 'Sony')
          patch "/api/v1/video_games/#{VideoGame.last.id}", {video_game: {title: nil}}
          vg = VideoGame.last

          vg_json = JSON.parse(response.body)
          expect(response.status).to eq(500)
          expect(vg_json).to eq("title" => ["can't be blank"])
        end
      end
    end

    describe 'destroy video game' do
      it 'destroys a video game record' do
        VideoGame.create(title: 'Final Fantasy', release_date: Date.strptime('2013-11-15', '%Y-%m-%d'), developer: 'SquareEnix', publisher: 'Sony')
        count = VideoGame.count
        delete "/api/v1/video_games/#{VideoGame.last.id}"

        expect(response).to be_success
        expect(VideoGame.count).to eq(count-1)
      end
    end

end
