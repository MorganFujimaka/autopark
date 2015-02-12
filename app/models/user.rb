class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook]

  has_many :reviews
  has_many :orders
  has_many :products, through: :orders

  before_create :generate_authentication_token!

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

  private

  def generate_authentication_token!
    begin
      self.auth_token = Devise.friendly_token
    end while self.class.exists?(auth_token: auth_token)
  end
end
