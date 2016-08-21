class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.belongs_to :customer
      t.belongs_to :vendor
      t.belongs_to :product

      t.integer :value

      t.timestamps
    end
  end
end
