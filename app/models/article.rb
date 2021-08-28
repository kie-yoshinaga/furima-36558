class Article < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :postage
  belongs_to :prefecture
  belongs_to :shipping_date

  validates :title, :text, presence: true

  validates :category_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :condition_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :postage_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank"} 
  validates :shipping_date_id, numericality: { other_than: 1, message: "can't be blank"} 
end
