require 'rails_helper'
describe RecordsController, type: :request do

  before do
    @record = FactoryBot.create(:record)
    sleep 0.1
  end

  describe 'GET #index' do
    it 'indexアクションにリクエストすると正常にレスポンスが返ってくる' do 
      get root_path
      expect(response.status).to eq 200
    end
    it 'indexアクションにリクエストするとレスポンスに投稿済みの投稿のテキストが存在する' do 
      get root_path
      expect(response.body).to include(@record.text)
    end
    it 'indexアクションにリクエストするとレスポンスに投稿済みの投稿の画像URLが存在する' do 
      get root_path
      expect(response.body).to include('http://www.example.com/rails/active_storage/')
    end
    it 'indexアクションにリクエストするとレスポンスに投稿検索フォームが存在する' do 
      get root_path
      expect(response.body).to include('投稿を検索する')
    end
  end
  
  describe 'GET #show' do
    it 'showアクションにリクエストすると正常にレスポンスが返ってくる' do 
      get record_path(@record)
      expect(response.status).to eq 200
    end
    it 'showアクションにリクエストするとレスポンスに投稿済みの投稿のテキストが存在する' do 
      get record_path(@record)
      expect(response.body).to include(@record.text)
    end
    it 'showアクションにリクエストするとレスポンスに投稿済みの投稿の画像URLが存在する' do 
      get record_path(@record)
      expect(response.body).to include('http://www.example.com/rails/active_storage/')
    end
    it 'showアクションにリクエストするとレスポンスにコメント一覧表示部分が存在する' do 
      get record_path(@record)
      expect(response.body).to include('コメント一覧')
    end
  end 
end
