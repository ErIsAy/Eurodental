class InvoiceNumber < ActiveRecord::Base
  belongs_to :sale

  def increment!
      transaction do
        lock!
        number = next_number
        self.next_number = number + 1
        save!
        number
      end
    end

end
