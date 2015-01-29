class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  has_many :reviews

  validates :email, uniqueness: true

  def self.from_omniauth(auth)
    if self.where(email: auth.info.email).exists?
      user = self.where(email: auth.info.email).first
      user.provider = auth.provider
      user.uid = auth.uid
      
      user
    else
      return_user = self.create do |user|
        user.provider = auth.provider
        user.uid = auth.uid
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
      end
    end
  end
end
