require 'elasticsearch/model'

class Product < ActiveRecord::Base
  include Elasticsearch::Model
  include Elasticsearch::Model::Callbacks

  has_many :reviews, dependent: :destroy
  belongs_to :category

  has_attached_file :image, 
    path: ":rails_root/public/:attachment/:id/:basename_:style.:extension",
    url: "/:attachment/:id/:basename_:style.:extension",
    styles: {
      thumb:   ['100x100#',  :jpg, :quality => 70],
      preview: ['200x200#',  :jpg, :quality => 70],
      large:   ['600>',      :jpg, :quality => 70],
      retina:  ['1200>',     :jpg, :quality => 30]
    }

  validates :title, :description, presence: true
  validates_attachment_content_type :image, content_type: ["image/jpg", "image/jpeg", "image/png", "image/gif"]

  scope :newest_last, -> { order('created_at') }
end

Product.import
