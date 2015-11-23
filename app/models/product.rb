class Product < ActiveRecord::Base
  belongs_to :supplier
  belongs_to :user
  has_many :images
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
