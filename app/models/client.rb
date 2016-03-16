class Client < ActiveRecord::Base
  validates :name, presence: true, length: {maximum: 45}
end
