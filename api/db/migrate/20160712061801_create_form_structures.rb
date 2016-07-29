class CreateFormStructures < ActiveRecord::Migration[5.0]
  def change
    create_table :form_structures do |t|
      t.string :structure_json, :null => false

      t.timestamps
    end
  end
end
