require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    subject { get(users_path) }
    context 'ユーザーが存在するとき' do
      before { create_list(:user, 3) }
      it 'リクエストが成功する' do
        subject
        expect(response).to have_http_status(:ok)
      end

      it 'nameが表示されている' do
        subject
        expect(response.body).to include(*User.pluck(:name))
      end
    end
  end

  describe 'GET #new' do
    it 'リクエストが成功する' do
      get(new_user_path)
      expect(response).to have_http_status(:ok)
    end
  end

  describe 'GET /create' do
    it 'returns http success' do
      get '/users/create'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET #show' do
    subject { get(user_path(user.id)) }
    context 'ユーザーが存在するとき' do
      let(:user) { create(:user) }
      it 'リクエストが成功する' do
        subject
        expect(response).to have_http_status(:ok)
      end
      it 'nameが表示されている' do
        subject
        expect(response.body).to include(user.name)
      end
      it 'ageが表示されている' do
        subject
        expect(response.body).to include(user.age.to_s)
      end
      it 'emailが表示されている' do
        subject
        expect(response.body).to include(user.email)
      end
    end
  end

  describe 'GET /edit' do
    it 'returns http success' do
      get '/users/edit'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /update' do
    it 'returns http success' do
      get '/users/update'
      expect(response).to have_http_status(:success)
    end
  end

  describe 'GET /destroy' do
    it 'returns http success' do
      get '/users/destroy'
      expect(response).to have_http_status(:success)
    end
  end
end
