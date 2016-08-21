class CreateAddresses < ActiveRecord::Migration[5.0]
  def change
    create_table :addresses do |t|
      t.belongs_to :postcode
      t.belongs_to :street
      t.belongs_to :customer

      t.string :house

      t.timestamps
    end
  end
end
