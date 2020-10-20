class AddStaytoReview < ActiveRecord::Migration[6.0]
  def change 
    add_column :reviews, :stay_id, :integer 
  end
end
