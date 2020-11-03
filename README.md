# テーブル設計

## users テーブル

| Column          | Type    | Options     |
| ----------------| ------- | ----------- |
| nickname        | string  | null: false |
| email           | string  | null: false |
| password        | string  | null: false |
| first_name      | string  | null: false |
| last_name       | string  | null: false |
| first_name_kana | string  | null: false |
| last_name_kana  | string  | null: false |
| birthday        | date    | null: false |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| name             | string     | null: false                    |
| description      | string     | null: false                    |
| category         | string     | null: false                    |
| status           | string     | null: false                    |
| postage          | string     | null: false                    |
| region           | string     | null: false                    |
| delivery_days    | string     | null: false                    |
| price            | integer    | null: false                    |
| sales_commission | integer    | null: false                    |
| sales_profit     | integer    | null: false                    |
| user             | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |
| adress | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :item
- has_one :adress

## adresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | integer    | null: false                    |
| prefecture    | string     | null: false                    |
| city          | string     | null: false                    |
| street_number | string     | null: false                    |
| building_name | string     | null: false                    |
| phone_number  | integer    | null: false                    |
| purchase      | references | null: false, foreign_key: true |

### Association

- has_one :purchase