class AddProductIdToImageRemoveImageIdFromProducts < ActiveRecord::Migration
  def change
    remove_column :products, :image_id, :integer
    add_column :images, :product_id, :integer
  end
end
