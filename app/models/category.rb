class Category < ActiveRecord::Base
  has_many :items, dependent: :destroy
  validates_uniqueness_of :name

  validates :name, presence: true
end
