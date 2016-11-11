class Mcolor < ActiveRecord::Base
  # belongs_to :store
  has_many :stores
  validates :name, presence: true
end
