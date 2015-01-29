class AddPriceAvailableToProducts < ActiveRecord::Migration
  def up
    add_column :products, :price, :float
    add_column :products, :available, :boolean, default: true
  end

  def down
    remove_column :products, :price
    remove_column :products, :available
  end
end
