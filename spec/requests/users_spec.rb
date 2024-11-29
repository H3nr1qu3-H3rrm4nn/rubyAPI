require 'rails_helper'

RSpec.describe "Users", type: :request do
  let!(:users) { create_list(:user, 3) }

  describe "GET /index" do
    it "returns http success" do
      get users_path, as: :json
      expect(response).to have_http_status(:success)
      expect(response.parsed_body.size).to eq(3)
      expect(response.parsed_body.map { |user| user['id'] }).to match_array(users.map(&:id))
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get user_path(users.first), as: :json

      expect(response).to have_http_status(:success)
      expect(response.parsed_body['id']).to eq(users.first.id)
      expect(response.parsed_body['name']).to eq(users.first.name)
      expect(response.parsed_body['email']).to eq(users.first.email)
    end
  end

  describe "POST /create" do
    it "returns http success" do
      expect do
        post users_path, params: { user: { name: 'Luiz Barsi Filho', email: 'luizbarsi@gmail.com' } }, as: :json
      end.to change(User, :count).by(1)

      expect(response).to have_http_status(:success)
      expect(response.parsed_body['name']).to eq('Luiz Barsi Filho')
      expect(response.parsed_body['email']).to eq('luizbarsi@gmail.com')
    end
  end

  describe "DELETE /destroy" do
    it "returns http success" do
      expect do
        delete user_path(users.first), as: :json
      end.to change(User, :count).by(-1)

      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH /update" do
    it "returns http success" do
      user = users.first

      put user_path(user), params: { user: { name: 'Luiz B. Filho' } }, as: :json

      expect(user.reload.name).to eq('Luiz B. Filho')
      expect(response).to have_http_status(:success)
    end
  end

end
