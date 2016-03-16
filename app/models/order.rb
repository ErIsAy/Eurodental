class Order < ActiveRecord::Base
  belongs_to :patient
  belongs_to :client

  attr_accessor :patient_name

  validates_presence_of :patient_id
  # validate :date_order_is_valid_future_date

  # def date_order_is_valid_future_date
  #   errors.add(:order_date, 'Por Favor introducir una fecha correcta') unless date.future?
  # end

  def patient_name
    patient.name if patient
  end

  def client_name
    client.name if client
  end

end
