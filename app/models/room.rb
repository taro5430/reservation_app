class Room < ApplicationRecord
  validates :name, :introduction, :price, :address, :image, presence: true
  
  belongs_to :user
  has_many :reservations, dependent: :destroy

  mount_uploader :image, ImageUploader

  #validate :date_before_start
  #validate :date_before_finish

  require "date"

  

  def self.search(address)
    Room.where(["address LIKE ?", "#{address}%"]) 
  end

  def self.search(keyword)
    Room.where(["address LIKE ? or name LIKE ? or introduction LIKE ?", "#{keyword}%","%#{keyword}%","%#{keyword}%"]) 
  end

end
