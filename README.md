## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| encrypted_password | integer | null: false |
| lastname_em        | string  | null: false |
| firstname_em       | string  | null: false |
| lastname_katakana  | string  | null: false |
| firstname_katakana | string  | null: false |
| birth_date         | date    | null: false |

### Association

  has_many :items
  has_many :comments
  has_one :purchases


## items テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| title            | string     | null: false                    |
| explanation      | text       | null: false                    |
| category         | string     | null: false                    |
| condition        | string     | null: false                    |
| delivery_fee     | string     | null: false                    |
| shipping_place   | string     | null: false                    |
| lead_time        | integer    | null: false                    |
| price            | integer    | null: false                    |
| user_id          | references | null: false, foreign_key: true |

### Association

  belongs_to :user
  has_many :comments
  has_many :purchases


## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| comment   | text       | null: false                    |
| item_id   | references | null: false, foreign_key: true |
| user_id   | references | null: false, foreign_key: true |

### Association
  belongs_to :item
  belongs_to :user


## purchases テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postal_code      | integer    | null: false                    |
| prefectures      | string     | null: false                    |
| municipalities   | string     | null: false                    |
| house_number     | integer    | null: false                    |
| building_name    | string     |                                |
| telephone_number | integer    | null: false                    |
| item_id          | references | null: false, foreign_key: true |
| user_id          | references | null: false, foreign_key: true |

### Association
  belongs_to :item
  belongs_to :user