class CartedProduct < ActiveRecord::Base
  belongs_to :product
  belongs_to :order
  belongs_to :user

  validates :quantity, presence: true, numericality: true
  validates_numericality_of :quantity, greater_than: 0

    
end
