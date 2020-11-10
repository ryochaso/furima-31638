# テーブル設計

## usersテーブル

|Column     |Type       |Options                   |
|-----------|-----------|--------------------------|
| nickname  | string    | null: false, unique: true|
| email     | string    | null: false              |
| passward  | string    | null: false              |
| name      | string    | null: false              |
| kana_name | stirng    | null: false              |
| birthday  | pull_down | 変更するかも               |


### Association
-has_manny: items
-has_manny: orders

## itemsテーブル

|Column        |Type         |Options                         |
|--------------|-------------|--------------------------------|
| image        | iamge       | active storageで実装            |
| product      | string      | null: false                    |
| explanation  | text        | null: false                    |
| category     | pull_down   | 変更するかも                     |
| condition    | pull_down   | 変更するかも                     |
| postage      | pull_down   | 変更するかも                     |
| prefecture   | pull_down   | 変更するかも                     |
| arrival_date | pull_down   | 変更するかも                     |
| place        | pull_down   | 変更するかも                     |
| user         | referennces | null: false, foreign_key: true |

### Association
-belongs_to: user
-has_one: order

##　ordersテーブル

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
| prefecuture  | pull_down | 変更するかも  |
| city         | string    | null: false |
| house_number | string    | null: false |
| buillding    | string    |             |
| phone_number | integer   | null: false |

### Association
-has_one: oder
