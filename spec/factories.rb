FactoryGirl.define do
  factory :customer do
    first_name "Ali"
    last_name  "Andersen"
  end

  factory :merchant do
    name "Petsmart"
    created_at "Tue, 27 Mar 2012 14:53:59 UTC +00:00"
    updated_at "Tue, 27 Mar 2012 14:53:59 UTC +00:00"
  end

  factory :item do
    name        "Leash"
    description "Great to walk your dog with"
    unit_price  5004
    association :merchant
  end

  factory :invoice do
    association :merchant
    association :customer
    status "completed"
  end

  factory :invoice_item do
    association :item
    association :invoice
    quantity 2
    unit_price 5005
  end

  factory :transaction do
    association :invoice
    credit_card_number "1234567890654321"
    result "pending"
  end
end
