class SectionPayment < ApplicationRecord
  belongs_to :section
  belongs_to :payments, class_name: 'Payment', foreign_key: 'payments_id'
end
