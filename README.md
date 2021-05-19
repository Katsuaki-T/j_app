# Table Design

## users table

| Column             | Type    | Options                |
| ------------------ | ------- | ---------------------- |
| name               | string  | null:false             |
| email              | string  | null:false,unique:true |
| encrypted_password | string  | null: false            |
| birth_country      | string  | null: false            |
| prefecture_id      | integer | null: false            |
| identity           | string  | 任意                    |


### Association

- has_many :topics


## topics table

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| sentence_id        | integer    | null: false                   |
| description        | text       | null: false                   |
| user               | references | foreign_key:true              |

### Association

- belongs_to :user
- has_many :comments


## comments テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| comment              | text       | null: false                    |
| topic                | references | foreign_key:true               |

### Association

- belongs_to :topic