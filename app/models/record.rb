class Record < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  validates :area_id, numericality: { other_than: 1 }
  validates :text,:image, presence: true
  belongs_to :area
  belongs_to :user
  has_many :comments
  has_one_attached :image


  #検索機能
  def self.search(search)
    if search != ""
      Record.where('text LIKE(?)', "%#{search}%")
    else
      Record.all
    end
  end

end
