# テーブル設計

## users テーブル

| Column               | Type    | Options     |
| -------------------- | ------- | ----------- |
| nick_name            | string  | null: false |
| email                | string  | null: false |
| password             | string  | null: false |
| family_name          | string  | null: false |
| family_name_reading  | string  | null: false |
| first_name           | string  | null: false |
| first_name_reading   | string  | null: false |
| birthday             | date    | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| name               | string     | null: false                    |
| detail             | text       | null: false                    |
| status_id          | integer    | null: false                    |
| delivery_charge_id | integer    | null: false                    |
| shipment_source_id | integer    | null: false                    |
| days_to_ship_id    | integer    | null: false                    |
| item_category_id   | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |
| item_price         | integer    | null: false                    |

### Association

- belongs_to :user
- has_one :order

## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :order
- has_one :address

## addresses テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| post_number    | string     | null: false                    |
| prefecture_id  | integer    | null: false                    |
| municipalities | string     | null: false                    |
| address        | string     | null: false                    |
| building       | string     |                                |
| tel            | string     | null: false                    |
| order          | references | null: false, foreign_key: true |

### Association

- belongs_to :order
