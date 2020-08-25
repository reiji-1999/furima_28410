# テーブル設計

## users テーブル

| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
| nickname     | string | null: false |
| email        | string | null: false |
| password     | string | null: false |
| name         | string | null: false |
| name_reading | string | null: false |
| birthday     | string | null: false |

### Association

- has_many :items

## items テーブル

| Column      | Type    | Options     |
| ----------- | ------- | ----------- |
| image       | image   | null: false |
| name        | string  | null: false |
| description | text    | null: false |
| category    | string  | null: false |
| status      | string  | null: false |
| burden      | string  | null: false |
| area        | string  | null: false |
| days        | string  | null: false |
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
| user_id      | integer | null: false |
| item_id      | integer | null: false |

## Association

- has_one :items