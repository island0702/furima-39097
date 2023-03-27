##usersテーブル

| Column                                 | Type   | Options                   |
| -------------------------------------- | ------ | ------------------------- |
| nickname                               | string | null: false               |
| encrypted_password                     | string | null: false               |
| double_byte_first_name                 | string | null: false               |
| double_byte_last_name                  | string | null: false               |
| double_byte_first_name_kana            | string | null: false               |
| double_byte_last_name_kana             | string | null: false               |
| date_of_birth                          | date   | null: false               |
| email                                  | string | null: false, unique: true |

##Association
has_many items
has_many buys



##itemsテーブル

| Column                    | Type          | Options                            |
| ------------------------- | ------------- | ---------------------------------- |
| user                      | references    | null: false, foreign_key: true     |
| category_id               | integer       | null: false                        |
| condition_id              | integer       | null: false                        |
| shipping_cost_id          | integer       | null: false                        |
| area_of_origin_id         | integer       | null: false                        |
| estimated_sipping_date_id | integer       | null: false                        |
| selling_price             | integer       | null: false                        |
| name                      | string        | null: false                        |
| detail                    | text          | null: false                        |

##Association
has_one buy
belongs_to user


##buysテーブル

| Column                 | Type          | Options                            |
| ---------------------- | ------------- | ---------------------------------- |
| user                   | references    | null: false, foreign_key: true     |
| item                   | references    | null: false, foreign_key: true     |

##Association
belongs_to item
belongs_to user
has_one address

##addressesテーブル

| Column                 | Type          | Options                            |
| ---------------------- | ------------- | ---------------------------------- |
| buy                    | references    | null: false, foreign_key: true     |
| municipality           | string        | null: false                        |
| area_of_origin_id      | integer       | null: false                        |
| address                | string        | null: false                        |
| post_code              | string        | null: false                        |
| telephone_number       | string        | null: false                        |
| building_name          | string        |                                    |

##Association
belongs_to buy

