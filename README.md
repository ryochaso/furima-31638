# テーブル設計

## usersテーブル

|Column               |Type       |Options                   |
|---------------------|-----------|--------------------------|
| nickname            | string    | null: false              |
| email               | string    | null: false              |
| encrypted_password  | string    | null: false              |
| first_name          | string    | null: false              |
| family_name         | stirng    | null: false              |
| kana_first          | stirng    | null: false              |
| kana_family         | stirng    | null: false              |
| birthday            | data      | null: false              |


### Association
-has_many: items
-has_many: orders

## itemsテーブル

|Column           |Type         |Options                         |
|-----------------|-------------|--------------------------------|
| name            | string      | null: false                    |
| explanation     | text        | null: false                    |
| category_id     | integer     | null: false                    |
| condition_id    | integer     | null: false                    |
| postage_id      | integer     | null: false                    |
| prefecture_id   | integer     | null: false                    |
| arrival_date_id | integer     | null: false                    |
| price           | integer     | null: false                    |
| user            | references | null: false, foreign_key: true  |

### Association
-belongs_to: user
-has_one: order

## ordersテーブル

|Column |Type        |Options                         |
|-------|------------|--------------------------------|
| user  | references | null: false, foreign_key: true |
| item  | references | null: false, foreign_key: true |

### Association
-belongs_to: user
-belongs_to: item
-has_one: address

## addressesテーブル

|Column          |Type        |Options                        |
|----------------|------------|-------------------------------|
| postal_code    | string     | null: false,                  |
| prefecuture_id | integer    | null: false,                  |
| city           | string     | null: false,                  |
| house_number   | string     | null: false,                  |
| buillding      | string     | foreign_key:                  |
| phone_number   | string     | null: false,                  |
| order          | references | null: false, foreign_key: true|

### Association
-belongs_to: order

