FactoryBot.define do
  factory :item do
    name { Faker::Lorem.sentence }
    detail { Faker::Lorem.sentence }
    status_id { '2' }
    delivery_charge_id { '2' }
    shipment_source_id { '2' }
    days_to_ship_id { '2' }
    category_id { '2' }
    price { '500' }
    association :user
  end
end
