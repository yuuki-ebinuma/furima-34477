# README

## user テーブル

| Column          | Type   | Options     |
| --------------  | ------ | ----------- |
| nickname        | string | null: false |
| email           | string | null: false, unique: true |
| password        | string | null: false |
| last_name       | string | null: false |
| first_name      | string | null: false |
| last_name_kana  | string | null: false |
| first_name_kana | string | null: false |
| birthday        | date   | null: false |


### Association

- has_many :product
- has_many :buyer

## products テーブル

| Column              | Type   | Options     |
| --------------------| ------ | ----------- |
| product_name        | text   | null: false |
| product_description | text   | null: false |
| category            | string | null: false |
| category_status     | string | null: false |
| user_id             | integer| foreign_key: true |
| image               | text   | null: false |

### Association

- belongs_to :user
- has_one ：buyer


## buyer テーブル

| Column         | Type    | Options     |
| ---------------| ------  | ----------- |
| user_id        | integer | foreign_key: true |
| products_id    | integer | foreign_key: true |
| ship_base      | string  | null: false |
| ship_date      | date    | null: false |
| ship_source    | string  | null: false |
| amount_sold    | integer | null: false |

### Association

- belongs_to :user
- belongs_to :product
- has_one :address

## address テーブル

| Column           | Type    | Options     |
| ---------------  | ------  | ----------- |
| postal_code      | integer | null: false |
| ship_region      | string  | null: false |
| ship_address     | string  | null: false |
| ship_to_address  | integer | null: false |
| building         | string  | null: false |


### Association

- belongs_to :buyer
