class CreateStreets < ActiveRecord::Migration[5.0]
  def change
    create_table :streets do |t|
      t.belongs_to :city
      t.belongs_to :street_type

      t.string :name

      t.timestamps
    end
  end
end
