class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.integer :property_id
      t.integer :nomad_id
      t.text :description
      t.integer :rating

      t.timestamps
    end
  end
end
