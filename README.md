# テーブル設計

## users テーブル

| Column        | Type   | Options     |
| ------------- | ------ | ----------- |
| nickname      | string | null: false |
| email         | string | null: false |
| password      | string | null: false |

### Association

- has_many :items

## items テーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| itemimage       | image   | null: false |
| itemname        | string  | null: false |
| itemdescription | text    | null: false |
| itemdetails     | text    | null: felse |
| itemprice       | integer | null: false |

### Association

- belongs_to :users
- has_one :buyer

## buyer テーブル

| Column       | Type    | Options     |
| -------------| ------- | ----------- |
| postalcode   | string  | null: false |
| prefecture   |
| city         | string  | null: false |
| housenumber  | integer | null: false |
| buildingname | string  | null: false |
| phonenumber  | integer | null: false |

## Association

- has_one :items