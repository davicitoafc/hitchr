class AddCompletedToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :completed, :boolean
  end
end
