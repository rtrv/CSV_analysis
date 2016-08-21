class CreateStreetTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :street_types do |t|
      t.string :short_name
      t.string :full_name

      t.timestamps
    end
  end
end
