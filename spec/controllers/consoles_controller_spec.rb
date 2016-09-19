require 'rails_helper'

RSpec.describe ConsolesController, type: :controller do
  description '#show page:' do
    it "renders a .json response when visited" do
      console = Console.create(name: 'PS4', manufacturer: 'Sony', release_date: Date.strptime('2013-11-15', '%Y-%m-%d') )
      get '/api/v1/consoles/1'
      
    end
  end
end
