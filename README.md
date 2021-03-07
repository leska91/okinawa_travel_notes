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
