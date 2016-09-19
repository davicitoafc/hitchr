class DropReviewsTable < ActiveRecord::Migration
  def up
    drop_table :reviews
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
