class Record < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  belongs_to :user
  has_many :comments
  has_one_attached :image

  validates :area_id, numericality: { other_than: 1 }

end
