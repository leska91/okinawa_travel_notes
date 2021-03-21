# アプリケーション名 okinawa_travel_notes

## アプリケーション概要
- アカウントを作成し、沖縄の写真を情報付きで投稿・編集・削除することができます
- 興味のある投稿へコメントすることができます
- ユーザーと１対１でチャットをすることができます

## URL
https://okinawa-travel-notes.herokuapp.com/

## テスト用アカウント




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
- has_many :room_users
- has_many :rooms, through: room_users
- has_many :messages


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
| ------ | ------ | ----------- |
| name   | string | null: false |

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
| content | string     | null: false                    |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user