require 'rails_helper'

RSpec.describe Api::V1::Customers::CustomersFavoriteMerchantController do

describe "GET #favorite_merchant", type: :controller do
  it "returns the merchant's favorite customer" do
    merchant = FactoryGirl.create(:merchant, name: "Edwin")
    customer = FactoryGirl.create(:customer)
    invoice = FactoryGirl.create(:invoice, merchant_id: merchant.id, customer_id: customer.id)
    transaction = FactoryGirl.create(:transaction, invoice_id: invoice.id, result: 'success')

    get :index, id: customer.id, format: :json

    expect(response).to be_success
  end
end
end
