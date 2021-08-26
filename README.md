# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...


## users テーブル
| Column             | Type   | Options                                      |
| ------------------ | ------ | -----------                                  |
| nickname           | string | null: false, foreign_key: true               |
| email              | string | null: false, unique: true, foreign_key: true |
| encrypted_password | string | null: false, foreign_key: true               |
| last_name          | string | null: false, foreign_key: true               |
| first_name         | string | null: false, foreign_key: true               |
| last_name_reading  | string | null: false, foreign_key: true               |
| first_name_reading | string | null: false, foreign_key: true               |
| birthday           | date   | null: false, foreign_key: true               |

### Association

- has_many :items
- has_one :order_history



## items テーブル
| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| title              | string     | null: false |
| catch_copy         | text       | null: false |
| category_id        | integer    | null: false | 
| condition_id       | integer    | null: false |
| postage_id         | integer    | null: false |
| prefecture_id      | integer    | null: false |
| shipping_date_id   | integer    | null: false |
| price              | integer    | null: false |

### Association

- belongs_to :user
- has_one : order_history


## order_history テーブル

| Column             | Type       |Options                         |
| ------------------ | ---------- | ---------------------          |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |
| address            | references | null: false, foreign_key: true |

### Association
- belongs_to : items
- belongs_to : user
- has_one : address

## address テーブル

| Column             | Type       | Options               |
| ------------------ | ---------- | --------------------- |
| postal_code        | string     | null: false           |
| prefecture_id      | integer    | null: false           |
| city               | string     | null: false           |
| house_number       | string     | null: false           |
| building_name      | string     |
| phone_number       | string     | null: false           |

### Association
- belongs_to : order_history
