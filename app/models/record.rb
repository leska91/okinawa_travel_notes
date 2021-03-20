class Record < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :area_id, numericality: { other_than: 1, message: 'を選択してください' }
  validates :text, presence: true
  validates :image, presence: { message: 'を選択してください' }
  belongs_to :area
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_one_attached :image


  #検索機能
  def self.search(search)
    if search != ""
      Record.where('text LIKE(?)', "%#{search}%")
    else
      Record.includes(:user).order("created_at DESC")
    end
  end

end
