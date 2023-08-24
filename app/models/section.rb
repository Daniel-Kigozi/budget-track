class Section < ApplicationRecord
  belongs_to :user
  has_many :section_payments, dependent: :destroy
  has_many :payments, through: :section_payments

  has_one_attached :icon
  validates :name, presence: true
  validates :icon, presence: true
end
