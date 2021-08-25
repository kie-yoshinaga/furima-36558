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
| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| name               | string | null: false |
| name_reading       | string | null: false |
| birthday           | string | null: false |

## items テーブル
| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| title              | string     | null: false |
| catch_copy         | text       | null: false |
| image              |
| user               | references | null: false |foreign_key: true |
| address            | references | null: false |

## comments テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| text               | text       | null: false                    |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |

## orders テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| price              | references | null: false  foreign_key: true |
| user               | references | null: false, foreign_key: true |
| item               | references | null: false, foreign_key: true |
| number             | string     | null: false                    |
| cvc                | string     | null: false                    |
| exp_month          | string     | null: false                    |
| address            | references | null: false  foreign_key: true |
