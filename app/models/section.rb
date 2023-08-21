class Section < ApplicationRecord
  belongs_to :user, foreign_key: 'user_id'
  has_and_belongs_to_many :Transactions
  has_one_attached :icon

  def total_section_amount
    Transactions.where(user_id:).sum(:amount)
  end

  validates :name, presence: true, length: { maximum: 60 }, uniqueness: true
  validates :icon, presence: true
  validates :user_id, presence: true
end
