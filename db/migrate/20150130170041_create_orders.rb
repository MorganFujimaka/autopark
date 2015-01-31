class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.date :start_date
      t.date :end_date
      t.references :product
      t.references :user

      t.timestamps
    end
  end
end
