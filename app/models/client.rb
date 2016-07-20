class Client < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user }

   has_many :orders, :dependent => :destroy
   validates :name, presence: true
   validates :address, presence: true
   validates :phone,:presence => true
   validates_length_of :phone, :maximum => 14

  #  default_scope { order('clients.created_at') }


end
