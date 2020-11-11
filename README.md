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
-has_manny: items
-has_manny: orders

## itemsテーブル

|Column        |Type         |Options                         |
|--------------|-------------|--------------------------------|
| product      | string      | null: false                    |
| explanation  | text        | null: false                    |
| category     | string      | null: false                    |
| condition    | string      | null: false                    |
| postage      | integer     | null: false                    |
| prefecture   | string      | null: false                    |
| arrival_date | string      | null: false                    |
| price        | integer     | null: false                    |
| user         | referennces | null: false, foreign_key: true |

### Association
-belongs_to: user
-has_one: order

## ordersテーブル

|Column |Type         |Options                         |
|-------|-------------|--------------------------------|
| user  | referennces | null: false, foreign_key: true |
| item  | referennces | null: false, foreign_key: true |

### Association
-belongs_to: user
-has_one: item
-has_one: address

## addressesテーブル

|Column        |Type       |Options      |
|--------------|-----------|-------------|
| postal_code  | integer   | null: false |
| prefecuture  | string    | null: false |
| city         | string    | null: false |
| house_number | string    | null: false |
| buillding    | string    |             |
| phone_number | string    | null: false |

### Association
-has_one: oder
