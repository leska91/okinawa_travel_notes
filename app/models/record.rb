class Record < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
  has_one_attached :image

  validates :area_id, numericality: { other_than: 1 }
  
end
