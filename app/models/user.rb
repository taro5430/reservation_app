class User < ApplicationRecord
  has_secure_password
  
  validates :name, presence: true
  validates :email, presence: true, uniqueness: true
  validate :password_length

  mount_uploader :image, ImageUploader

  def password_length
    if password.present? && password.length < 6 
      errors.add(:password, "は6文字以上で入力してください")
    end
  end

  has_many :rooms
  has_many :reservations

end
