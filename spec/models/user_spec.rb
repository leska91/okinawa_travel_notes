require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
    sleep 0.1
  end

  describe '新規登録/ユーザー情報' do
    context '新規登録できるとき' do
      it '情報を正しく入力すると登録できる' do
        expect(@user).to be_valid
      end
      it 'nicknameが漢字で登録できる' do
        @user.nickname = '内田'
        expect(@user).to be_valid
      end
      it 'nicknameがカタカナで登録できる' do
        @user.nickname = 'ウチダ'
        expect(@user).to be_valid
      end
      it 'nicknameがひらがなで登録できる' do
        @user.nickname = 'うちだ'
        expect(@user).to be_valid
      end
      it 'nicknameが英数字で登録できる' do
        @user.nickname = 'uchida1'
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在すれば登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'メールアドレスに＠が含まれない場合は登録できない' do
        @user.email = 'mayutest'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'ma000'
        @user.password_confirmation = 'ma000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordが半角英字のみでは登録できない' do
        @user.password = 'aaaaaaa'
        @user.password_confirmation = 'aaaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は英数字混合にしてください')
      end
      it 'passwordが半角数字のみでは登録できない' do
        @user.password = '0000000'
        @user.password_confirmation = '0000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password は英数字混合にしてください')
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        @user.password = 'ma3456'
        @user.password_confirmation = 'ma3457'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
    end
  end
end
