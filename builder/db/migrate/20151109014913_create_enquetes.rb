class CreateEnquetes < ActiveRecord::Migration
  def change
    create_table :enquetes do |t|
      t.string :title

      t.timestamps null: false
    end
  end
end
