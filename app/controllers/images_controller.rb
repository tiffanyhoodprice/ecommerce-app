class ImagesController < ApplicationController

def create
  image = params[:image]
  image = Image.create(image: image_url)
end

def update
  image = params[:image]
  product.update(image: image_url)
end

end
