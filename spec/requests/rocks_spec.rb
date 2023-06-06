require 'rails_helper'

RSpec.describe "Rocks", type: :request do
  describe "GET /index" do
    it "gets a list of rocks" do
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
      expect(response.status).to have_http_status(200)
      json = JSON.parse(response.body)
      expect(json['']).to include 'cant be blank'
      
    end

    # validates that a rock will not be created if missing an attribute
    it 'will not create a rock that is missing a name' do
      # attributes
      rock_params = {
        rock: {
          name:nil, 
          age:6, 
          hobby:'eating lasagna', 
          image:'https://freesvg.org/img/OnlyWine-186.png'
        }
      }
      # request
      post '/rocks', params: rock_params
      # assertion on the response
      # status
      p 'create response', response.status
      expect(response.status).to eq(422)
      # payload
      rock_json = JSON.parse(response.body)
      expect(rock_json['name']).to include "can't be blank"
    end

    it 'will not create a rock that is missing an age' do
      # attributes
      rock_params = {
        rock: {
          name: 'Rocky Balboa',
          age: nil,
          enjoys: 'boxing and training sequences',
          image: 'placeholder'
        }
      }
      # request
      post '/rocks', params: rock_params
      # assertion on the response
      # status
      p "create response", response.status
      expect(response.status).to eq(422)
      # payload
      rock_json = JSON.parse(response.body)
      # p "json hash", rock_json
      expect(rock_json['age']).to include "can't be blank"
    end
    
    it 'will not create a rock that is missing an enjoys' do
      # attributes
      rock_params = {
        rock: {
          name: 'Rocky Balboa',
          age: '10,000',
          enjoys: nil,
          image: 'placeholder',
        }
      }
      # request
      post '/rocks', params: rock_params
      # assertion on the response
      # status
      p "create response", response.status
      expect(response.status).to eq(422)
      # payload
      rock_json = JSON.parse(response.body)
      # p "json hash", rock_json
      expect(rock_json['enjoys']).to include "can't be blank"
    end

    it 'will not create a rock that is missing an image' do
      # attributes
      rock_params = {
        rock: {
          name: 'Rocky Balboa',
          age: '10,000',
          enjoys: 'boxing and training sequences',
          image: nil,
        }
      }
      # request
      post '/rocks', params: rock_params
      # assertion on the response
      # status
      p "create response", response.status
      expect(response.status).to eq(422)
      # payload
      rock_json = JSON.parse(response.body)
      # p "json hash", rock_json
      expect(rock_json['image']).to include "can't be blank"
    end

  end
end
