class Item < ApplicationRecord

  validates :title, presence: true
  validates :catch_copy, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :postage_id, presence: true
  validates :prefecture_id, presence: true
  validates :shipping_date_id, presence: true
  validates :price, presence: true
  

  belongs_to :user
  has_one :order_history

  has_one_attached :image

end