##usersテーブル

| Column                 | Type          | Options                            |
| ---------------------- | ------------- | ---------------------------------- |
| nick_name              | string        | null: false, unique: true          |
| email                  | string        | null: false                        |
| password               | string        | null: false                        |
| confirm_password       | string        | null: false                        |
| double_byte_name       | string        | null: false                        |
| double_byte_name_kana  | string        | null: false                        |
| date_of_birth          | string        | null: false                        |



##itemテーブル

| Column                 | Type          | Options                            |
| ---------------------- | ------------- | ---------------------------------- |
| user                   | references    | null: false, foreign_key: true     |
| category               | references    | null: false                        |
| Item_condition         | string        | null: false                        |
| shipping_cost          | string        | null: false                        |
| area_of_origin         | string        | null: false                        |
| estimated_shipping_date| string        | null: false                        |



##buyテーブル

| Column                 | Type          | Options                            |
| ---------------------- | ------------- | ---------------------------------- |
| user                   | references    | null: false                        |
| address                | references    | null: false                        |



##addressesテーブル

| Column                 | Type          | Options                            |
| ---------------------- | ------------- | ---------------------------------- |
| municipality           | string        | null: false                        |
| prototype              | string        | null: false                        |
| address                | string        | null: false                        |
| post_code              | string        | null: false                        |
| telephone_number       | string        | null: false                        |
| building_name          | string        | null: false                        |

##Association
belongs_to users
has_many 