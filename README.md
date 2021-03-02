# README

## users テーブル

| Column          | Type   | Options     |
| --------------  | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false, unique: true |
| encrypted_password|string| null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birthday        | date   | null: false |


### Association

- has_many :products
- has_many :buyers

## products テーブル

| Column              | Type   | Options     |
| --------------------| ------ | ----------- |
| product_name        | string | null: false |
| product_description | text   | null: false |
| category_id         | integer| null: false |
| user_id             | integer| foreign_key: true |
| ship_city_id        | integer| null: false |
| ship_date_id        | integer| null: false |
| ship_charge_id      | integer| null: false |
| product_status_id   | integer| null: false |
| amount_sold         | integer| null: false |



### Association

- belongs_to :user
- has_one ：buyer


## buyers テーブル

| Column         | Type    | Options     |
| ---------------| ------  | ----------- |
| user_id       | integer | foreign_key: true |
| product_id    | integer | foreign_key: true |


### Association

- belongs_to :user
- belongs_to :product
- has_one :address

## addresses テーブル

| Column           | Type    | Options     |
| ---------------  | ------  | ----------- |
| postal_code      | string  | null: false |
| ship_region      | string  | null: false |
| ship_address     | string  | null: false |
| ship_city_id     | integer | null: false |
| building         | string  |             |
| phone            | string  | null: false |
| buyer_id         | integer | foreign_key: true |

### Association

- belongs_to :buyer
