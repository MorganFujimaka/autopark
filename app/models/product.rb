require 'elasticsearch/model'

class Product < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  has_many :reviews, dependent: :destroy
  has_many :orders
  has_many :users, through: :orders
  belongs_to :category

  has_attached_file :image, 
    path: ":attachment/:id/:basename_:style.:extension",
    url: "/:attachment/:id/:basename_:style.:extension",
    styles: {
      thumb:   ['50x50#',    :jpg, :quality => 70],
      preview: ['200x200#',  :jpg, :quality => 70],
      large:   ['600>',      :jpg, :quality => 70],
      retina:  ['1200>',     :jpg, :quality => 30]
    },
    storage: :fog,
    fog_credentials: "#{Rails.root}/config/gce.yml",
    fog_directory: "autopark"
  
  validates :title, :description, presence: true
  validates_attachment_content_type :image, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  scope :newest_last, -> { order('created_at') }

  def set_booked
    update_attributes(available: false)
  end
end

Product.import
