class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :sections, foreign_key: :user_id, dependent: :delete_all
  has_many :Transactions, foreign_key: :user_id, dependent: :delete_all

  validates :name, presence: true, length: { maximum: 80 }
end
