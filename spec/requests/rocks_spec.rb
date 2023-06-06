require 'rails_helper'

RSpec.describe "Rocks", type: :request do
  describe "GET /index" do
    it "gets a list of cats" do
      Rock.create(
        name: 'Rocky Balboa',
        age: "10,000",
        enjoys: 'boxing and training sequences',
        image: 'placeholder'
      )
      get '/rocks'

      rock = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(rock.length).to eq 1
    end
  end
  describe "POST /create" do
    it "creates a rock" do
      rock_params = {
        rock: {
        name: 'Rocky Balboa',
        age: "10,000",
        enjoys: 'boxing and training sequences',
        image: 'placeholder'
    }
    }

      post '/rocks', params: rock_params

      expect(response).to have_http_status(200)
      expect(rock.name).to eq 'Rocky Balboa'
    end
  end
end
