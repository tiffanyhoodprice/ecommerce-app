class User < ActiveRecord::Base
  has_many :carted_products
  has_many :products, through: :carted_products
  has_many :orders
  belongs_to :role

  validates :email, uniqueness: true
  validates :email, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def admin?
    role.name == "admin" #if the user is a shopper, it will return false.
  end

  def shopper?
    role.name == "shopper"
  end

end
