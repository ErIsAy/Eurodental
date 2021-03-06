class Order < ActiveRecord::Base
  include PublicActivity::Model
  tracked owner: ->(controller, model) { controller && controller.current_user }
# belongs_to :patient
  belongs_to :client
  has_many :items
  has_many :services

  # default_scope { order('orders.created_at') }
  # default_scope { order("created_at DESC") }

  accepts_nested_attributes_for :items, reject_if: :all_blank, allow_destroy: true

  accepts_nested_attributes_for :services,
                                :reject_if => lambda { |a| a[:service_total].blank? }

  attr_accessor :client_name
  attr_accessor :client_phone
  attr_accessor :client_email
  attr_accessor :current_step
  # attr_accessor :total_pending
  # attr_accessor :partial_pay
  # attr_accessor :total_price


  validates_presence_of :patient_name, :if => lambda { |o| o.current_step == "step_1"}
  validates_presence_of :client_id, :if => lambda { |o| o.current_step == "step_1"}

  # validate :date_order_is_valid_future_date

  # def date_order_is_valid_future_date
  #   errors.add(:order_date, 'Por Favor introducir una fecha correcta') unless date.future?
  # end

  # def patient_name
  #   patient.name if patient
  # end

  # def total_calc
  #    order.total_price - order.partial_pay
  # end


  def client_name
    client.name if client
    #Client.name if order
  end
  #
  # def client_phone
  #   client.phone if client
  # end

  def client_address
    client.address if client
  end

  # def client_email
  #   client.email if client
  # end

  def current_step
    @current_step || steps.first
  end


  def steps
    # %w{step_1 step_2 step_3}
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

  #fix the date format for search accurately YYYY/MM/DD
  ransacker :created_at do |parent|
      Arel::Nodes::SqlLiteral.new('date(orders.created_at)')
  end

end
