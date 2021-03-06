class User< ActiveRecord::Base
  has_many :articles, dependent: :destroy
  before_save{ self.email=email.downcase}
  validates :username, presence:true,uniqueness: true,length:{minimum: 3,maximum: 25}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
   validates :email, uniqueness: true,presence:true,length:{maximum: 50},format: { with: VALID_EMAIL_REGEX }
  has_secure_password
  
   mount_uploader :avatar, AvatarUploader

end