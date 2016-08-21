class CreatePostcodes < ActiveRecord::Migration[5.0]
  def change
    create_table :postcodes do |t|
      t.belongs_to :city
      t.string :value

      t.timestamps
    end
  end
end
