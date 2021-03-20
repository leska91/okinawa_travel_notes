require 'rails_helper'

RSpec.describe Record, type: :model do
  before do
    @record = FactoryBot.build(:record)
    sleep 0.1
  end

  describe '投稿の保存' do
    context '投稿できる場合' do
      it '情報を正しく入力すると投稿できる' do
        expect(@record).to be_valid
      end
    end
    context '投稿できない場合' do
      it 'area_idが1の場合は投稿できない' do
        @record.area_id = 1
        @record.valid?
        expect(@record.errors.full_messages).to include("Area を選択してください")
      end     
      it '画像が選択されてなければ投稿できない' do
        @record.image = nil
        @record.valid?
        expect(@record.errors.full_messages).to include("Image を選択してください")
      end
      it '説明が空の場合は投稿できない' do
        @record.text = ''
        @record.valid?
        expect(@record.errors.full_messages).to include("Text can't be blank")
      end
      it 'ユーザーが紐づいてなければ投稿できない' do
        @record.user = nil
        @record.valid?
        expect(@record.errors.full_messages).to include("User must exist")
      end
    end
  end
end
