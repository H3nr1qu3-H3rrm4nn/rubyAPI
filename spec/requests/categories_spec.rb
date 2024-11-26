require 'rails_helper'

RSpec.describe "Categories", type: :request do
  let!(:categories) { create_list(:category, 3) }

  describe "GET /index" do
    it "returns http success" do
      get categories_path, as: :json

      expect(response).to have_http_status(:success)
      expect(response.parsed_body.size).to eq(3)
      expect(response.parsed_body.map { |category| category['id'] }).to match_array(categories.map(&:id))
    end
  end

  describe "GET /show" do
    it "returns http success" do
      get category_path(categories.first), as: :json

      expect(response).to have_http_status(:success)
      expect(response.parsed_body['id']).to eq(categories.first.id)
      expect(response.parsed_body['name']).to eq(categories.first.name)
      expect(response.parsed_body['description']).to eq(categories.first.description)
    end
  end

  describe "POST /create" do
    it "returns http success" do
      expect do
        post categories_path, params: { category: { name: 'Luiz Barsi Filho', description: 'luizbarsi@gmail.com' } }, as: :json
      end.to change(Category, :count).by(1)

      expect(response).to have_http_status(:success)
      expect(response.parsed_body['name']).to eq('Luiz Barsi Filho')
      expect(response.parsed_body['description']).to eq('luizbarsi@gmail.com')
    end
  end

  describe "DELETE /destroy" do
    it "returns http success" do
      expect do
        delete category_path(categories.first), as: :json
      end.to change(Category, :count).by(-1)

      expect(response).to have_http_status(:success)
    end
  end

  describe "PATCH /update" do
    it "returns http success" do
      category = categories.first

      put category_path(category), params: { category: { name: 'Luiz B. Filho' } }, as: :json

      expect(category.reload.name).to eq('Luiz B. Filho')
      expect(response).to have_http_status(:success)
    end
  end
end
