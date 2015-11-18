class AddIdToQuestion < ActiveRecord::Migration
  def change
    add_column :questions, :enquete_id, :integer
  end
end
