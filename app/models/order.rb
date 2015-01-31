class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  validates :start_date, :end_date, presence: true
end
