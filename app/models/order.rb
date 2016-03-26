class Order < ActiveRecord::Base
#  belongs_to :patient
  belongs_to :client

  attr_accessor :client_name
  attr_accessor :current_step

  #validates_presence_of :patient_id
  # validate :date_order_is_valid_future_date

  # def date_order_is_valid_future_date
  #   errors.add(:order_date, 'Por Favor introducir una fecha correcta') unless date.future?
  # end

  # def patient_name
  #   patient.name if patient
  # end

  def client_name
    client.name if client
    #Client.name if order
  end

  def current_step
    @current_step || steps.first
  end


  def steps
    %w{step_1 step_2}
  end

  def next_step
    self.current_step = steps[steps.index(current_step)+1]
  end

  def previous_step
    self.current_step = steps[steps.index(current_step)-1]
  end

  def first_step?
    current_step == steps.first
  end

  def last_step?
    current_step == steps.last
  end




end
