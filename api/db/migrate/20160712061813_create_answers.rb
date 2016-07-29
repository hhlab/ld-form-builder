class CreateAnswers < ActiveRecord::Migration[5.0]
  def change
    create_table :answers do |t|
      t.string :answer_json, :null => false
      t.integer :form_structure_id, :null => false

      t.timestamps
    end
  end
end
