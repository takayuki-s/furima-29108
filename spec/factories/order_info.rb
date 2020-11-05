FactoryBot.define do
  factory :order_info do
    post_number { '123-4567' }
    prefecture_id { 2 }
    municipalities { 'テスト市' }
    address { 'テスト町テスト' }
    building { 'テストハイツ１０２' }
    tel { '09012345678' }
    token { 'tok_abcdefghijk00000000000000000' }
  end
end
