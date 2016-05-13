class Supplier < ActiveRecord::Base
  has_many :supplier_emails, dependent: :destroy
  has_many :supplier_phones, dependent: :destroy

  accepts_nested_attributes_for :supplier_emails, reject_if: :all_blank, allow_destroy: true
  accepts_nested_attributes_for :supplier_phones, reject_if: :all_blank, allow_destroy: true
  validates :name, :description, presence: true


end
