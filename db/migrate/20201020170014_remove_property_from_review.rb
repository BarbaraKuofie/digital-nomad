class RemovePropertyFromReview < ActiveRecord::Migration[6.0]
  def change
    remove_column :reviews, :property_id
  end
end
