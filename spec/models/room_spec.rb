require 'rails_helper'

RSpec.describe Room, type: :model do
  describe 'RoomCreate' do
    before do
      @room = FactoryBot.build(:room)
    end

    it 'nameに情報が入力されていれば保存できる' do
      expect(@room).to be_valid
    end

    it 'nameが空の場合は保存できない' do
      @room.name = ''
      @room.valid?
      expect(@room.errors.full_messages).to include("Name can't be blank")
    end
  end
end
