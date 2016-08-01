class AddCompletedToRides < ActiveRecord::Migration
  def change
    add_column :rides, :completed, :boolean
  end
end
