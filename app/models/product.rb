class Product < ActiveRecord::Base
  belongs_to :supplier
  has_many :images
  
  has_many :categorized_products
  has_many :categories, through: :categorized_products
  belongs_to :order
  
  has_many :carted_products
  has_many :orders, through: :carted_products

  accepts_nested_attributes_for :images

  validates :name, presence: true
  validates :price, presence: true
  validates :description, presence: true

  validates :user_id, presence: true
  # validates :product_id, presence: true

  # def self.get_discounted #class method because has 'self'
  #   Product.where("price <?", 50)
  # end

  def sale_message
    if price < 50
      "Discount Item!"
    else 
      "On Sale"
    end
  end

  def tax
    tax = price * 0.09
  end

  def total
    tax + price
  end

end
