require 'rails_helper'

RSpec.describe 'Signup', type: :request do
  describe 'POST /create' do
    context 'with valid parameters' do
      let!(:user_data) { FactoryBot.create(:user) }

      before(:each) do
        post '/auth', params:
                          { user: {
                            email: user_data.email,
                            password: user_data.password
                          } }
      end

      it 'returns the email' do
        expect(json['email']).to eq(user_data.email)
      end

      it 'returns a created status' do
        expect(response).to have_http_status(200)
      end
    end

    context 'with invalid parameters' do
      before(:each) do
        post '/auth', params:
                          { user: {
                            email: '',
                            password: ''
                          } }
      end

      it 'returns a unprocessable entity status' do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
