class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  
  validates :title, presence: true
  validates :category_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :postage_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :shipping_date_id, numericality: { other_than: 1, message: "can't be blank"} 

  validates :price, numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' }
  validates :price,numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }
  
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :shipping_date
  
end