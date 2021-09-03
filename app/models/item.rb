class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  validates :image, presence: true
  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :postage_id, numericality: { other_than: 1, message: "can't be blank"}
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :shipping_date_id, numericality: { other_than: 1, message: "can't be blank"}

  validates :price, numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' }
  validates :price,numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }


  belongs_to :user
  belongs_to_active_hash :postage
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_date
  
  has_one :order_history
  has_one_attached :image

end