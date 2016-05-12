class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :qtype

      t.timestamps null: false
    end
  end
end
