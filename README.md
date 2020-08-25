# テーブル設計

## users テーブル

| Column                   | Type   | Options     |
| ------------------------ | ------ | ----------- |
| nickname                 | string | null: false |
| email                    | string | null: false |
| password                 | string | null: false |
| family_name              | string | null: false |
| first_name               | string | null: false |
| name_reading_family_name | string | null: false |
| name_reading_first_name  | string | null: false |
| birthday                 | date   | null: false |

### Association

- has_many :items
- has_many :management

## items テーブル

| Column      | Type    | Options                      |
| ----------- | ------- | ---------------------------- |
| image       | image   | null: false                  |
| name        | string  | null: false                  |
| description | text    | null: false                  |
| price       | integer | null: false                  |
| user_id     | integer | null: false foreign_key: true|
| category_id | integer | null: false                  |
| status_id   | integer | null: false                  |
| burden_id   | integer | null: false                  |
| area_id     | integer | null: false                  |
| days_id     | integer | null: false                  |

### Association

- belongs_to :user
- has_one :buyer

## buyer テーブル

| Column       | Type    | Options     |
| -------------| ------- | ----------- |
| postalcode   | string  | null: false |
| prefecture   | integer | null: false |
| city         | string  | null: false |
| housenumber  | string  | null: false |
| buildingname | string  |             |
| phonenumber  | string  | null: false |

## Association

- belongs_to :management

## management

| Column  | Type    | Options                       |
| --------| ------- | ----------------------------- |
| user_id | integer | null: false foreign_key: true |
| item_id | integer | null: false foreign_key: true |

## Association

- has_one :buyer