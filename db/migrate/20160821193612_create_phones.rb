class CreatePhones < ActiveRecord::Migration[5.0]
  def change
    create_table :phones do |t|
      t.belongs_to :customer

      t.string :value

      t.timestamps
    end
  end
end
