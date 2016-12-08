class Sale < ActiveRecord::Base
  belongs_to :client
  has_one :invoice_number
  has_many :stores, dependent: :destroy
  has_many :payments, dependent: :destroy
  validates :patient_name, :presence => true
  validates :client_id, :presence => true
  # validates :order_date, :presence => true
  attr_accessor :client_email

  accepts_nested_attributes_for :stores, allow_destroy: true
  accepts_nested_attributes_for :payments, allow_destroy: true

end
