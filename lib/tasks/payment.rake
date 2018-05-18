namespace :payment do
  
  desc "Update Paydate for payments in nil"
  task update_paydate: :environment do
    Payment.where(paydate: nil).each do |p|
      p.paydate = p.created_at
      p.save
    end
  end

end
