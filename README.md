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
| birth_date     | date         | null: false                 |

### Association

- has_many : items
- has_many : purchases

## Item テーブル

| Column         | Type        | Options                      |
| -------------- | ----------- | ---------------------------- |
| item_name      | string      | null: false                  |
| item_detail    | text        | null: false                  |
| category_id    | integer     | null: false                  |
| condition_id   | integer     | null: false                  |
| postage_id     | integer     | null: false                  |
| prefecture_id  | integer     | null: false                  |
| days_to_ship_id| integer     | null: false                  |
| price          | integer     | null: false                  |
| listing_date   | date        | null: false                  |
| user           | references  | null: false foreign_key: true|

### Association

- belongs_to : user
- has_one : purchase

## purchase テーブル
| Column         | Type        | Options                      |
| -------------- | ----------- | ---------------------------- |
| item           | references  | null: false foreign_key: true|
| user           | references  | null: false foreign_key: true|

### Association

- belongs_to : user
- belongs_to : item
- has_one : address

## Address テーブル

| Column         | Type        | Options                      |
| -------------- | ----------- | ---------------------------- |
| postal_code    | string      | null: false                  |
| prefectures_id | integer     | null: false                  |
| city           | string      | null: false                  |
| house_number   | string      | null: false                  |
| apartment      | string      |                              |
| phone_number   | string      | null: false                  |
| purchase       | references  | null: false foreign_key: true|

### Association

- belongs_to : purchase