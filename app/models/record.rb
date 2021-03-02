class Record < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_many :comments
  has_one_attached :image

  belongs_to :area
  validates :area_id, numericality: { other_than: 1 }

  def self.search(search)
    if search != ""
      Record.where('text LIKE(?)', "%#{search}%")
    else
      Record.all
    end
  end

end
