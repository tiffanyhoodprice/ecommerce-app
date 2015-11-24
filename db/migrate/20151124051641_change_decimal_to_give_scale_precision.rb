class ChangeDecimalToGiveScalePrecision < ActiveRecord::Migration
  def change
  
    change_column :orders, :subtotal, :decimal, precision: 10, scale: 2
    change_column :orders, :tax, :decimal, precision: 10, scale: 2
    change_column :orders, :total, :decimal, precision: 10, scale: 2

  end
end
