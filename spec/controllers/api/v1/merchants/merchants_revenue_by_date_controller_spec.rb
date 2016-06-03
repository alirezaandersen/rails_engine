require 'rails_helper'

RSpec.describe Api::V1::Merchants::MerchantsRevenueDateController  do
describe "GET #most_revenue_date", type: :controller do
   it "returns the merchant(s) with the most revenue" do
     merchant = FactoryGirl.create(:merchant, name: "Edwin")
     customer = FactoryGirl.create(:customer)
     invoice = FactoryGirl.create(:invoice, merchant_id: merchant.id, customer_id: customer.id)
     transaction = FactoryGirl.create(:transaction, invoice_id: invoice.id, result: 'success')
     invoice_item = FactoryGirl.create(:invoice_item, invoice_id: invoice.id)

     get :index, id: merchant.id, format: :json

     expect(response).to be_success
   end
 end
end
