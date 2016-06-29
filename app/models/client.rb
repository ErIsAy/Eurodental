class Client < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user }

   has_many :orders
   validates :name, presence: true

end
