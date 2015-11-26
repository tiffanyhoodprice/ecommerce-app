class Order < ActiveRecord::Base
  belongs_to :user
  belongs_to :product

  validates :user, :product, presence: true
  validates :quantity, presence: true
  validates_numericality_of :quantity, greater_than: 0
  
end
