class Product < ActiveRecord::Base
  has_many :reviews
  belongs_to :category

  validates :title, :description, presence: true

  scope :newest_last, -> { order('created_at') }
end
