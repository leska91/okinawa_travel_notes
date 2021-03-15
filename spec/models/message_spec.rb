require 'rails_helper'

RSpec.describe Message, type: :model do
  before do
    @message = FactoryBot.build(:message)
    sleep 0.1
  end
  
  describe 'メッセージ投稿' do
    it 'メッセージを入力すると投稿できる' do
      expect(@message).to be_valid
    end

    it 'contentが空の場合は投稿できないこと' do
      @message.content = ''
      @message.valid?
      expect(@message.errors.full_messages).to include("Content can't be blank")
    end
    it 'roomが紐付いていないと保存できないこと' do
      @message.room = nil
      @message.valid?
      expect(@message.errors.full_messages).to include("Room must exist")
    end
    it 'userが紐付いていないと保存できないこと' do
      @message.user = nil
      @message.valid?
      expect(@message.errors.full_messages).to include("User must exist")
    end
  end
end
