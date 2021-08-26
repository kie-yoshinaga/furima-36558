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
| Column             | Type   | Options                   |
| ------------------ | ------ | -----------               |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_reading  | string | null: false               |
| first_name_reading | string | null: false               |
| birthday           | date   | null: false               |

### Association

- has_many :items


## items テーブル
| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| title              | string     | null: false |
| catch_copy         | text       | null: false |
| category           | string     | null: false | 
| condition          | string     | null: false |
| postage            | string     | null: false |
| region             | string     | null: false |
| shipping_date      | string     | null: false |
| price              | string     | null: false |

### Association

- belongs_to :user
- has_one : order


## order_history テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ---------------------          |
| price              | references | null: false  foreign_key: true |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |
| address            | references | null: false, foreign_key: true |

### Association
- belongs_to : items
- has_one : address

## address テーブル

| Column             | Type       | Options               |
| ------------------ | ---------- | --------------------- |
| postal_code        | string     | null: false           |
| prefecture         | integer    | null: false           |
| city               | string     | null: false           |
| house_number       | string     | null: false           |
| building_name      | string     |
| phone_number       | string     | null: false           |

### Association
- belongs_to : order_history