class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :item
  has_many :order_history

  validates :nickname, presence: true
  validates :last_name, presence: true
  validates :first_name, presence: true
  validates :last_name_reading, presence: true
  validates :first_name_reading, presence: true
  validates :birthday, presence: true
  

  with_options presence: true do
    validates :last_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "全角で入力してください"}
    validates :first_name, format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/, message: "全角で入力してください"}

    validates :last_name_reading, format: {with: /\A[ァ-ヶー]+\z/, message: "が空欄です"}
    validates :first_name_reading, format: {with: /\A[ァ-ヶー]+\z/, message: "が空欄です"}
  
    validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "半角英数字を含めてください"}
  
  end

  has_many :comments, dependent: :destroy

end