class SectionPayment < ApplicationRecord
  belongs_to :section
  belongs_to :payment
end
