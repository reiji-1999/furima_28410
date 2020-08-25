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
| date                     | string | null: false |

### Association

- has_many :items

## items テーブル

| Column      | Type    | Options     |
| ----------- | ------- | ----------- |
| image       | image   | null: false |
| name        | string  | null: false |
| description | text    | null: false |
| price       | integer | null: false |
| user_id     | integer | null: false |

### Association

- belongs_to :users
- has_one :buyer

## buyer テーブル

| Column       | Type    | Options     |
| -------------| ------- | ----------- |
| postalcode   | string  | null: false |
| prefecture   | integer | null: false |
| city         | string  | null: false |
| housenumber  | string  | null: false |
| buildingname | string  | null: false |
| phonenumber  | string  | null: false |

## Association

- has_one :items
- has_one :management

## management

| Column       | Type    | Options     |
| -------------| ------- | ----------- |
| user_id      | integer | null: false |
| item_id      | integer | null: false |

## Association

- has_one :buyer