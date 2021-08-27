class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :item
  has_many :order_history

  validates :nickname, presence: true, length: { maximum: 6 }
  validates :email, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_reading, presence: true
  validates :first_name_reading, presence: true
  validates :birthday, presence: true
  validates :password, presence: true

  with_options presence: true do
    validates :last_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "Full-width characters"}
    validates :first_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "Full-width characters"}

    validates :last_name_reading, format: {with: /\A[ァ-ヶー]+\z/, message: "can't be blank"}
    validates :first_name_reading, format: {with: /\A[ァ-ヶー]+\z/, message: "can't be blank"}
  
    validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "Include both letters and numbers"}
  
  end
end