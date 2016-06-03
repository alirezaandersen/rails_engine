require 'rails_helper'

RSpec.describe Api::V1::Merchants::MerchantCustomersWithPendingInvoicesController do

  def parsed_response
  JSON.parse(response.body)
  end
  it 'responds with collection of customers with pending invoices' do
    # GET /api/v1/merchants/:id/customers_with_pending_invoices returns a collection of customers which have pending (unpaid) invoices
    merchant = FactoryGirl.create(:merchant)
    customer1 = FactoryGirl.create(:customer)
    customer2 = FactoryGirl.create(:customer)
    invoice1 = FactoryGirl.create(:invoice)
    invoice2 = FactoryGirl.create(:invoice)
    invoice_item1 = FactoryGirl.create(:invoice_item)
    invoice_item2 = FactoryGirl.create(:invoice_item)
    invoice_item4 = FactoryGirl.create(:invoice_item)
    transaction1 = FactoryGirl.create(:transaction, result: "success")
    transaction4 = FactoryGirl.create(:transaction, result: "failed")
    invoice1.invoice_items << invoice_item1
    invoice1.invoice_items << invoice_item2
    invoice1.transactions << transaction1
    invoice2.invoice_items << invoice_item4
    invoice2.transactions << transaction4
    merchant.invoices << invoice1
    merchant.invoices << invoice2
    customer1.invoices << invoice1
    customer2.invoices << invoice2

    # items = JSON.parse(response.body)
      get :index, id: merchant.id, format: :json

    expect(parsed_response.count).to eq(1)
  end
end
