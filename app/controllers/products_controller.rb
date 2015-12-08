class ProductsController < ApplicationController
before_action :authenticate_admin!, except: [:index, :show, :search]
# before_action :authenticate_admin!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @categories = Category.all
    if params[:view] == "discounted"
      @product_list = Product.where("price < ?", 50)
    elsif
      params[:view] == "order_by_price"
      @product_list = Product.order(:price)
    elsif
      params[:view] == "order_by_price_desc"
      @product_list = Product.order(price: :desc)
    elsif 
      params[:category]
      @product_list = Category.find_by(name: params[:category]).products    
    else 
      @product_list = Product.all
    end
  end
  # def index
  #  @product_list = Product.all


  # end

  def new
    # if current_user && current_user.admin?
    @product = Product.new
    @product.images.build
    # else
    # redirect_to "/"
    # end
  end

  def create  
    @product = Product.new(product_params)
    @product.attributes = {user_id: current_user.id}
    if @product.save
      flash[:success] = "Shoe Created"
      redirect_to "/products/#{@product.id}"
    else
      # flash[:danger] = "Did Not Save. ERROR!"
      render :new
    end

  #   item = params[:name]
  #   size = params[:size]
  #   price = params[:price]
  #   description = params[:description]
  #   image = params[:image]
  #   supplier = params[:supplier]
  #   shoe = Product.new(name: item, size: size, price: price, supplier: supplier.name, description: description, user_id: current_user.id)
  #   if shoe.save
  #     flash[:success] = "Shoe Created"
  #     redirect_to "/products/#{shoe.id}"
  #   else
  #     flash[:danger] = "Did Not Save. ERROR!"
  #     render :new
  #   end
  end

  def show
    @carted_product = CartedProduct.new
    id = params[:id]
    if params[:id] == "random"
      @product = Product.all.sample
    else
      @product = Product.find_by(id: id)
    end
  end

  def edit
    id = params[:id]
    @product = Product.find_by(id: id)
  end

  def update
    @product = Product.find_by(id: params[:id])
    @product.update(product_params)
    flash[:success] = "#{product.name} has been updated."
    redirect_to "/products/#{product.id}"

    # id = params[:id]
    # product = Product.find_by(id: id)

    # item = params[:product_name]
    # size = params[:size]
    # price = params[:price]
    # description = params[:description]
    # supplier = params[:supplier]
    # image = params[:image]
    # product.update(name: item, size: size, price: price, supplier: supplier, description: description, user_id: current_user.id)
    # flash[:success] = "#{product.name} has been updated." #Flash is special to Rails. This is a hash. Assigning value 'shoe updated' to 'key of success'
    # redirect_to "/products/#{product.id}"
  end

  def destroy
    id = params[:id]
    product = Product.find_by(id: id)

    # item = params[:name]
    # size = params[:size]
    # price = params[:price]
    # description = params[:description]
    # image = params[:image]
    product.destroy
    flash[:danger] = "#{product.name} has been deleted."
    redirect_to "/products"
  end

  def search
    search_term = params[:search]
    @product_list = Product.where("name LIKE ? OR description LIKE ?", "%#{search_term}%", "%#{search_term}%")
    render :index
  end


private

  def product_params
    params.require(:product).permit(:id, :name, :price, :size, :description, :supplier_id, images_attributes: [:image_url])
  end

end
