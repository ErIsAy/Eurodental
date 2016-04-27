class Client < ActiveRecord::Base
   has_many :orders
   validates :name, presence: true

end
