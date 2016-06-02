require 'rails_helper'


RSpec.describe Api::V1::Merchants::MerchantsController do
  describe "GET index", type: :controller do
    it "returns all customers" do
      customer1 = FactoryGirl.create(:merchant)
      customer2 = FactoryGirl.create(:merchant)
      customer2.update(name:"Petco")
      get :index, format: :json

      items = JSON.parse(response.body)

      expect(response).to have_http_status(:success)
      expect(Merchant.count).to eq(2)
      expect(Merchant.last.name).to eq("Petco")
      expect(Merchant.first.name).to eq("Petsmart")
    end
  end

  describe "Get Show", type: :controller do
    it "returns all specific merchant"do
      merchant = FactoryGirl.create(:merchant)
      get :show, id: merchant.id, format: :json

      item = JSON.parse(response.body)

      expect(response).to have_http_status(:success)
      expect(Merchant.first.name).to eq("Petsmart")
    end
  end

  describe "Get Find", type: :controller do
    it "can find merchant based on match query" do
      merchant = FactoryGirl.create(:merchant)
      get :find, id: merchant.id, format: :json

      item = JSON.parse(response.body)

      expect(response).to have_http_status(:success)
      expect(Merchant.first.name).to eq("Petsmart")
    end
  end

  describe "Get Find_all", type: :controller do
    it "can find merchant based on any merchant query" do
    merchant = FactoryGirl.create(:merchant)
    # binding.pry
    get :find_all, id: merchant.id, format: :json

      item = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
      expect(Merchant.first.name).to eq("Petsmart")
    end
  end

  describe "GET #random", type: :controller do
    it "returns a random merchant" do
      FactoryGirl.create_list(:merchant, 12)

      get :random, format: :json

      expect(response).to be_success
    end
  end

end
