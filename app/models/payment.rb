class Payment < ApplicationRecord
  belongs_to :user
  has_many :section_payments, dependent: :destroy
  has_many :sections, through: :section_payments


  validates :amount, presence: true, numericality: { greater_than: 0 }
  validates :user_id, presence: true
end
