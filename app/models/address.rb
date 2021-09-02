class Address < ApplicationRecord
  

  #validates :postal_code, numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' }
  #validates :prefecture_id, numericality: { other_than: 1, message: "can't be blank"} 
  #validates :city, presence: true
  #validates :house_number, presence: true
  #validates :building_name
  #validates :phone_number, numericality: { with: /\A[0-9]+\z/, message: 'Half-width number' }
  
  belongs_to :order_history
end