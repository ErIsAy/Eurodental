class InvoiceNumber < ActiveRecord::Base
  belongs_to :sale
  before_create :set_invoice_number

  def increment!
    self.next_number
      # transaction do
      #   lock!
      #   number = next_number
      #   next_number = number + 1
      #   save!
      #   number
      #   byebug
      # end
    end



    def set_invoice_number
      last_invoice_number = InvoiceNumber.maximum(:next_number)
      self.next_number = last_invoice_number.to_i + 1
      # byebug
    end


end
