# アプリケーション名 okinawa_travel_notes

## アプリケーション概要
- アカウントを作成し、沖縄の写真を情報付きで投稿・編集・削除することができます
- 興味のある投稿へコメントすることができます
- ユーザーと１対１でチャットをすることができます

## URL
https://okinawa-travel-notes.herokuapp.com/
※Herokuでデプロイしているため、Herokuの仕様により本番環境にアクセス頂いた際に画像リンクが切れている可能性があります。

## テスト用アカウント
- ユーザー1<br>
メールアドレス：test01@test.com<br>
password:test01
- ユーザー2<br>
メールアドレス：test02@test.com<br>
password:test02

## 利用方法
### Post
- ユーザー1でログイン→Postするを押下→情報を入力・写真ファイルを選択→SENDで投稿
### Chat
- ユーザー1でログイン→Chatするを押下→Make New Chat Roomを押下→ユーザー2を選んで新しいチャットルームを作成→チャットルーム名を押下→メッセージを送信

## 目指した課題解決
- 沖縄が好きな人たちが集まるように沖縄に特化した写真共有アプリを作成しました
- 投稿した写真を見て気になったユーザーと1対1でチャットができるチャットルームを作成できるようにしました

## 洗い出した要件
1)ユーザー管理機能	アプリを使用するためのユーザー登録<br>
2)マイページ機能	ユーザーの投稿を一覧で確認できるページ<br>
3)投稿機能	写真と説明を投稿できる機能<br>
4)投稿一覧表示機能	投稿された写真が一覧で確認できるページ<br>
5)投稿詳細表示機能	投稿の詳細を閲覧できる機能<br>
6)投稿削除機能	投稿を削除できる機能<br>
7)投稿編集機能	投稿の編集ができる機能<br>
8)コメント投稿機能	投稿へコメントができる機能<br>
9)投稿検索機能	投稿を検索できる機能<br>
10)チャット機能	ユーザー同士がチャットできる機能<br>
11)エラーの日本語設定	エラー表示が日本語でされる機能<br>


## 実装した機能について説明
1)gem-devise-を利用し、メールアドレス・ニックネーム・パスワードを登録できるよう設定<br>
2)投稿者名をクリックするとその投稿者が投稿した内容が一覧で表示されるマイページへ遷移する<br>
3)撮影場所を選択し、写真ファイルを１枚選択、説明を記入して投稿ができる<br>
4)各自投稿したものが一覧で表示されるページ<br>
5)詳細を押すと投稿の詳細ページへ遷移する<br>
6)削除を押すと投稿を削除することができる<br>
7)編集を押すと投稿の情報を変更することができる<br>
8)詳細ページから投稿へコメントすることができる<br>
9)検索バーにワードを入力するとそのワードが含まれる投稿がヒットする<br>
10)Chatするを押すとチャットページに遷移し、チャットルームを作成したり、既存のチャットルームを使ってユーザー同士が１対１でやりとりをすることができる<br>
11)ログイン・サインアップ・投稿画面において入力エラーがある際にエラーが表示される


## 実装予定の機能
1)ユーザー管理機能においてパスワードを忘れた場合は再設定できること


## データベース設計
![image](https://user-images.githubusercontent.com/74247868/111908220-c3888480-8a9b-11eb-8ff6-afc3c2d033d3.png)


## ローカルでの動作方法
- 


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