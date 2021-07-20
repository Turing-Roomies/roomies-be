require 'rails_helper'

describe 'Sessions API' do
  describe 'Happy Path' do
    it "returns user data in the correct structure" do
      user_params = {
                      email: 'testemail@test.com',
                      password: 'test',
                    }

      headers = {"CONTENT_TYPE" => "application/json"}

      defualt_location = Location.create!(city: "n/a", state: "n/a")

      User.create!(
                    email: 'testemail@test.com',
                    password: 'test',
                    location: defualt_location
                  )

      VCR.use_cassette('user_login') do
        post '/api/v1/sessions', headers: headers, params: user_params.to_json
      end

      user = JSON.parse(response.body, symbolize_names: true)

      expect(user).to have_key(:data)
      expect(user[:data]).to have_key(:id)
      expect(user[:data]).to have_key(:type)
      expect(user[:data]).to have_key(:attributes)
      expect(user[:data][:attributes]).to have_key(:email)
      expect(user[:data][:attributes]).to have_key(:name)
      expect(user[:data][:attributes]).to have_key(:gender)
      expect(user[:data][:attributes]).to have_key(:age)
      expect(user[:data][:attributes]).to have_key(:location)
      expect(user[:data][:attributes][:location]).to have_key(:city)
      expect(user[:data][:attributes][:location]).to have_key(:state)
      expect(user[:data][:attributes][:email]).to eq(user_params[:email])
    end
  end
end
