# README

## users テーブル

| Column          | Type   | Options     |
| --------------  | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false, unique: true |
| encrypted_password       | string | null: false |
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
| users_id            | integer| foreign_key: true |
| ship_city           | string | null: false |
| ship_date           | date   | null: false |
| ship_charge         | integer| null: false |
| product_status      | string | null: false |


### Association

- belongs_to :users
- has_one ：buyer


## buyer テーブル

| Column         | Type    | Options     |
| ---------------| ------  | ----------- |
| users_id       | integer | foreign_key: true |
| products_id    | integer | foreign_key: true |


### Association

- belongs_to :users
- belongs_to :product
- has_one :address

## address テーブル

| Column           | Type    | Options     |
| ---------------  | ------  | ----------- |
| postal_code      | string  | null: false |
| ship_region      | string  | null: false |
| ship_address     | string  | null: false |
| ship_to_address  | integer | null: false |
| building         | string  |             |
| phone            | integer | null: false |
| buyer_id         | integer | foreign_key: true |

### Association

- belongs_to :buyer
