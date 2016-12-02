class Client < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user }

   has_many :orders, :dependent => :destroy
   has_many :sales, dependent: :destroy
   has_many :client_emails, dependent: :destroy
   has_many :client_phones, dependent: :destroy
   accepts_nested_attributes_for :client_emails, reject_if: :all_blank, allow_destroy: true
  #  accepts_nested_attributes_for :client_phones, reject_if: :all_blank, allow_destroy: true
   accepts_nested_attributes_for :client_phones,
                                 :reject_if => lambda { |a| a[:phone].blank? }


   validates :name, presence: true
   validates :address, presence: true
   # validates :phone,:presence => true
   # validates_length_of :phone, :maximum => 14

  #  default_scope { order('clients.created_at') }

end
