class Sale < ActiveRecord::Base
  belongs_to :client
  has_many :stores, dependent: :destroy
  validates :patient_name, :presence => true
  validates :client_id, :presence => true
  attr_accessor :client_email

  accepts_nested_attributes_for :stores, allow_destroy: true

end
