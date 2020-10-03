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
| date_of_birth_year   | integer | null: false |
| date_of_birth_month  | integer | null: false |
| date_of_birth_day    | integer | null: false |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| item_name     | string     | null: false                    |
| item_detail   | text       | null: false                    |
| item_image    | text       | null: false                    |
| item_category | integer    | null: false                    |
| user_id       | references | null: false, foreign_key: true |
| item_price    | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_one :orders

## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| users   | references | null: false, foreign_key: true |
| items   | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :orders
- has_one :addresses

## addresses テーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| post_number    | integer |             |
| prefecture     | integer | null: false |
| municipalities | string  | null: false |
| address        | string  | null: false |
| building       | string  | null: false |
| tel            | integer | null: false |

### Association

- belongs_to :orders
