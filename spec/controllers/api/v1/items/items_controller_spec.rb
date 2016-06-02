require 'rails_helper'


RSpec.describe Api::V1::Items::ItemsController do
  describe "GET index", type: :controller do
    it "returns all items" do
      item = FactoryGirl.create(:item)
      item1 = FactoryGirl.create(:item)
      item2 = FactoryGirl.create(:item)
      get :index, format: :json

      items = JSON.parse(response.body)

      expect(response).to have_http_status(:success)
      expect(Item.count).to eq(3)
      expect(Item.last.unit_price).to eq(5004)
    end
  end


  describe "GET #show", type: :controller do
    it "returns one specific item" do
      items = FactoryGirl.create(:item)
      get :show, id: items.id, format: :json

      item = JSON.parse(response.body)

      expect(response).to have_http_status(:success)
      expect(Item.last.unit_price).to eq(5004)

    end
  end

  describe "Get Find", type: :controller do
    it "can find item based on match query" do
      items = FactoryGirl.create(:item)
      get :find, id: items.id, format: :json

      item = JSON.parse(response.body)

      expect(response).to have_http_status(:success)
    end
  end

  describe "Get Find_all", type: :controller do
    it "can find items based on any items query" do
    items = FactoryGirl.create(:item)

    get :find_all, id: items.id, format: :json

      item = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #random", type: :controller do
    it "returns a random item" do
      FactoryGirl.create_list(:item, 12)

      get :random, format: :json

      expect(response).to be_success
    end
  end

end
