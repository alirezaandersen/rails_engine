require 'rails_helper'


RSpec.describe Api::V1::Invoices::InvoicesController do
  describe "GET index", type: :controller do
    it "returns all items" do
      invoice = FactoryGirl.create(:invoice)
      invoice1 = FactoryGirl.create(:invoice)
      invoice2 = FactoryGirl.create(:invoice)
      invoice2.update(status:"pending")
      get :index, format: :json

      items = JSON.parse(response.body)

      expect(response).to have_http_status(:success)
      expect(Invoice.count).to eq(3)
      expect(Invoice.first.status).to eq("completed")
      expect(Invoice.last.status).to eq("pending")
    end
  end


  describe "GET #show", type: :controller do
    it "returns one specific invoice item" do
      invoice = FactoryGirl.create(:invoice)
      get :show, id: invoice.id, format: :json

      item = JSON.parse(response.body)

      expect(response).to have_http_status(:success)
      expect(Invoice.first.status).to eq("completed")

    end
  end

  describe "Get Find", type: :controller do
    it "can find invoice item based on match query" do
      invoice = FactoryGirl.create(:invoice)
      get :find, id: invoice.id, format: :json

      item = JSON.parse(response.body)

      expect(response).to have_http_status(:success)
        expect(Invoice.first.status).to eq("completed")
    end
  end

  describe "Get Find_all", type: :controller do
    it "can find invoice items based on any invoice items query" do
    invoices = FactoryGirl.create(:invoice)

    get :find_all, id: invoices.id, format: :json

      item = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #random", type: :controller do
    it "returns a random invoice item" do
      FactoryGirl.create_list(:invoice, 12)

      get :random, format: :json

      expect(response).to be_success
    end
  end

end
