class Item < ActiveRecord::Base
  belongs_to :category
  validates :name, presence: true
  validates :price, presence: true
  validates :category_id, presence: true

end
