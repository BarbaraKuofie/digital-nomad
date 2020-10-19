class CreateStays < ActiveRecord::Migration[6.0]
  def change
    create_table :stays do |t|
      t.integer :property_id
      t.integer :nomad_id
      t.date :checkin
      t.date :checkout

      t.timestamps
    end
  end
end
