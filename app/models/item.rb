class Item < ActiveRecord::Base
  belongs_to :category
  has_many :orders
  validates :name, presence: true
  validates :price, presence: true
  validates :category_id, presence: true
  validates_uniqueness_of :name



end
