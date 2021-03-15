require 'rails_helper'

RSpec.describe 'メッセージ投稿機能', type: :system do
  before do
    # 中間テーブルを作成して、usersテーブルとroomsテーブルのレコードを作成する
    @room_user = FactoryBot.create(:room_user)
  end

  context '投稿に失敗したとき' do
    it '送る値が空の為、メッセージの送信に失敗すること' do
      # サインインする
      sign_in(@room_user.user)

      # チャット作成画面へ遷移する
      click_on('Chatする')
      
      # 作成されたチャットルームへ遷移する
      click_on(@room_user.room.name)
      
      # DBに保存されていないことを確認する
      # メッセージを送信するために、findメソッドを使用して、送信ボタンの「input[name="commit"]」要素を取得して、クリックします。しかし、何も入力を行っていないので、データベースのmessageモデルのカウントが増えていないことを確認しています。
      expect {
        find('input[name="commit"]').click
      }.not_to change { Message.count }
      
      # 元のページに戻ってくることを確認する
      expect(current_path).to eq(room_messages_path(@room_user.room))
    end
  end
  
  context '投稿に成功したとき' do
    it 'テキストの投稿に成功すると、投稿一覧に遷移して、投稿した内容が表示されている' do
      # サインインする
      sign_in(@room_user.user)

      # チャット作成画面へ遷移する
      click_on('Chatする')
      
      # 作成されたチャットルームへ遷移する
      click_on(@room_user.room.name)
      
      # 値をテキストフォームに入力する
      # 文字列testを変数postに代入
      post = 'test'
      fill_in 'message_content', with: post
      
      # 送信した値がDBに保存されていることを確認する=送信ボタンをクリックしたときに、messageモデルのレコードが1つ増えているかを確認
      expect {
        find('input[name="commit"]').click
      }.to change { Message.count }.by(1)
      
      # 投稿一覧画面に遷移していることを確認する
      expect(current_path).to eq(room_messages_path(@room_user.room))
      
      # 送信した値がブラウザに表示されていることを確認する=画面の中に変数postに格納されている文字列があるかどうかを確認
      expect(page).to have_content(post)
    end
  end
end
