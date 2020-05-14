# README

# Contents

## Team

fleamarket_sample_74f
Team develogging
Menber：４ persons

## App

Flea Market app

## Delivery

3 weeks

## Tecknology

- Ruby
  - 2.5.1p57 (2018-03-29 revision 63029)
- Rails
- Javascript
- HTML/HAML
- CSS/SCSS
- Git
  - 2.26.0
- MySQL
- AWS

# DB 設計

## users Table

| Column   | Type   | Options                   |
| -------- | ------ | ------------------------- |
| nickName | string | null: false               |
| email    | string | null: false, unique: true |
| password | string | null: false               |

### Association

- has_one :identification
- has_many :goods
- has_one :deliveryAddresses
- has_many :creditCards

## identifications Table

| Column         | Type    | Options           |
| -------------- | ------- | ----------------- |
| user_id        | integer | foreign_key: true |
| familyName     | string  | null: false       |
| firstName      | string  | null: false       |
| familyNameKana | string  | null: false       |
| firstNameKana  | string  | null: false       |
| birthDay       | date    | null: false       |

### Association

- belongs_to :user

## creditCards Table

| Column         | Type    | Options                        |
| -------------- | ------- | ------------------------------ |
| user_id        | integer | null: false, foreign_key: true |
| customer_id    | integer | null: false                    |
| card_id        | integer | null: false                    |

### Association

- belongs_to :user

## deliveryAddresses Table

| Column         | Type    | Options                        |
| -------------- | ------- | ------------------------------ |
| user_id        | integer | null: false, foreign_key: true |
| familyName     | string  | null: false                    |
| firstName      | string  | null: false                    |
| familyNameKana | string  | null: false                    |
| firstNameKana  | string  | null: false                    |
| postCode       | integer | null: false                    |
| prefecture_id  | integer | null: false                    |
| city           | string  | null: false                    |
| address        | string  | null: false                    |
| buildingName   | string  |                                |
| telNumber      | integer |                                |

### Association

- belongs_to :user

## goods Table

| Column         | Type    | Options                        |
| -------------- | ------- | ------------------------------ |
| user_id        | integer | null: false, foreign_key: true |
| goodsName      | string  | null: false                    |
| explanation    | text    | null: false                    |
| category_id    | integer | null: false, foreign_key: true |
| brand          | string  |                                |
| goodsCondition | string  | null: false                    |
| deliveryFee    | string  | null: false                    |
| prefecture_id  | integer | null: false                    |
| deliveryDay    | string  | null: false                    |
| price          | integer | null: false                    |

### Association

- belongs_to :user
- belongs_to :category
- has_many :pictures

## pictures Table

| Column     | Type    | Options                       |
| ---------- | ------- | ----------------------------- |
| good_id    | integer | null: false,foreign_key: true |
| goodsImage | string  | null: false                   |

### Association

- belongs_to :good

## categories Table

| Column       | Type   | Options |
| ------------ | ------ | ------- |
| categoryName | string |         |
| ancestry     | string |         |

### Association

- has_many :goods

---
