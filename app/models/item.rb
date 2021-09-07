class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :image, presence: true
  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :category_id, numericality: { other_than: 1, message: "が空欄です"} 
  validates :condition_id, numericality: { other_than: 1, message: "が空欄です"} 
  validates :postage_id, numericality: { other_than: 1, message: "が空欄です"}
  validates :prefecture_id, numericality: { other_than: 1, message: "が空欄です"} 
  validates :shipping_date_id, numericality: { other_than: 1, message: "が空欄です"}

  validates :price, numericality: { with:  /\A[a-z0-9]+\z/i, message: '半角数字を入力してください' }
  validates :price,numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: '設定金額を超えています' }

 
  belongs_to :user
  belongs_to_active_hash :postage
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_date
  
  has_one :order_history
  has_one_attached :image

  has_many :comments, dependent: :destroy

end