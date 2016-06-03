require 'rails_helper'


RSpec.describe Api::V1::Transactions::TransactionsController do
  describe "GET index", type: :controller do
    it "returns all invoice items" do
      transaction = FactoryGirl.create(:transaction)
      transaction1 = FactoryGirl.create(:transaction)
      transaction2 = FactoryGirl.create(:transaction)
      transaction2.update(result:"approved")
      get :index, format: :json

      items = JSON.parse(response.body)

      expect(response).to have_http_status(:success)
      expect(Transaction.count).to eq(3)
      expect(Transaction.last.result).to eq("approved")
      expect(Transaction.first.result).to eq("pending")
    end
  end

  describe "GET #show", type: :controller do
    it "returns one specific invoice item" do
      transaction = FactoryGirl.create(:transaction)
      get :show, id: transaction.id, format: :json

      item = JSON.parse(response.body)

      expect(response).to have_http_status(:success)
      expect(Transaction.last.result).to eq("pending")

    end
  end

  describe "Get Find", type: :controller do
    it "can find invoice item based on match query" do
      transaction = FactoryGirl.create(:transaction)
      get :find, id: transaction.id, format: :json

      item = JSON.parse(response.body)

      expect(response).to have_http_status(:success)
    end
  end

  describe "Get find_all", type: :controller do
    it "can find invoice items based on any invoice items query" do
    transactions = FactoryGirl.create(:transaction)
    get :find_all, id: transactions.id, format: :json

      item = JSON.parse(response.body)
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #random", type: :controller do
    it "returns a random invoice item" do
      FactoryGirl.create_list(:transaction, 12)

      get :random, format: :json

      expect(response).to be_success
    end
  end

end
