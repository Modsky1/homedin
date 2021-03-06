class House < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :emails
  has_many :ratings
  has_many :textmessages

  validates :price, numericality: true
  mount_uploader :image, ImageUploader
end
