# テーブル設計

## User テーブル

| Column         | Type        | Options                      |
| -------------- | ----------- | ---------------------------- |
| nickname       | string      | null: false                  |
| email          | string      | null: false                  |
| password       | string      | null: false                  |
| first_name     | string      | null: false                  |
| last_name      | string      | null: false                  |
| first_name_kana| string      | null: false                  |
| last_name_kana | string      | null: false                  |
| birth_date     | string      | null: false                  |
| item_id        | references  | null: false foreign_key: true|
| purchase_id    | references  | null: false foreign_key: true|

### Association

- has_many : items
- has_many : purchases

## Item テーブル

| Column         | Type        | Options                      |
| -------------- | ----------- | ---------------------------- |
| image          | text        | null: false                  |
| item_name      | string      | null: false                  |
| item_detail    | text        | null: false                  |
| category_id    | references  | null: false                  |
| condition_id   | references  | null: false                  |
| postage_id     | references  | null: false                  |
| prefecture_id  | references  | null: false                  |
| days_to_ship_id| references  | null: false                  |
| price          | integer     | null: false                  |
| listing_date   | date        | null: false                  |
| purchase_id    | references  | null: false foreign_key: true|
| user_id        | references  | null: false foreign_key: true|

### Association

- belongs_to : user
- has_one : purchase

## purchase テーブル
| Column         | Type        | Options                      |
| -------------- | ----------- | ---------------------------- |
| item_id        | references  | null: false foreign_key: true|
| user_id        | references  | null: false foreign_key: true|
| address_id     | references  | null: false foreign_key: true|
| purchase_date  | date        | null: false                  |

### Association

- belongs_to : user
- belongs_to : item
- has_one : address

## Address テーブル

| Column         | Type        | Options                      |
| -------------- | ----------- | ---------------------------- |
| postal_code    | integer     | null: false                  |
| prefectures_id | references  | null: false                  |
| city           | string      | null: false                  |
| house_number   | string      | null: false                  |
| apartment      | string      |                              |
| phone_number   | integer     | null: false                  |
| purchase_id    | references  | null: false foreign_key: true|

### Association

- belongs_to : purchase