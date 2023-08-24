class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :sections, foreign_key: :user_id, dependent: :destroy
  has_many :payments, foreign_key: :user_id, dependent: :destroy

  validates :name, presence: true, length: { maximum: 80 }
end
