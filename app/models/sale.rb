class Sale < ActiveRecord::Base
  belongs_to :client
  validates :patient_name, :presence => true
  validates :client_id, :presence => true
  attr_accessor :client_email
end
