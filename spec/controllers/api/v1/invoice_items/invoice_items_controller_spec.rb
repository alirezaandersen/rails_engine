require 'rails_helper'


RSpec.describe Api::V1::InvoiceItems::InvoiceItemsController do
  describe "GET index", type: :controller do
    it "returns all invoice items" do
      invoice_item = FactoryGirl.create(:invoice_item)
      invoice_item1 = FactoryGirl.create(:invoice_item)
      invoice_item2 = FactoryGirl.create(:invoice_item)
      get :index, format: :json

      items = JSON.parse(response.body)

      expect(response).to have_http_status(:success)
      expect(InvoiceItem.count).to eq(3)
      expect(InvoiceItem.last.unit_price).to eq(5005)
    end
  end


  describe "GET #show", type: :controller do
    it "returns one specific invoice item" do
      invoice_item = FactoryGirl.create(:invoice_item)
      get :show, id: invoice_item.id, format: :json

      item = JSON.parse(response.body)

      expect(response).to have_http_status(:success)
      expect(InvoiceItem.last.unit_price).to eq(5005)

    end
  end

  describe "Get Find", type: :controller do
    it "can find invoice item based on match query" do
      invoice_item = FactoryGirl.create(:invoice_item)
      get :find, id: invoice_item.id, format: :json

      item = JSON.parse(response.body)

      expect(response).to have_http_status(:success)
    end
  end

  describe "Get Find_all", type: :controller do
    it "can find invoice items based on any invoice items query" do
    invoice_items = FactoryGirl.create(:invoice_item)
    # binding.pry
    get :find_all, id: invoice_items.id, format: :json

      item = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #random", type: :controller do
    it "returns a random invoice item" do
      FactoryGirl.create_list(:invoice_item, 12)

      get :random, format: :json

      expect(response).to be_success
    end
  end

end
