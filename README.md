# テーブル設計

## users テーブル
| Column             | Type                 | Options                  |
| ------------------ | -------------------- | ------------------------ |
| nickname           | string               | null: false              |
| email              | string               | null: false, unique:true |
| encrypted_password | string               | null: false              |

### Association

- has_many :records
- has_many :comments


## records テーブル
| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| area_id    | integer    | null: false                    |
| text       | text       | null: false                    |
| user       | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :comments


## comments テーブル
| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| record     | references | null: false, foreign_key: true |
| user       | references | null: false, foreign_key: true |
| text       | text       | null: false                    |

### Association

- belongs_to :user
- belongs_to :record


<!-- チャット機能 -->
## rooms テーブル

| Column | Type   | Options     |

### Association

- has_many :room_users
- has_many :users, through: room_users
- has_many :messages

## room_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user