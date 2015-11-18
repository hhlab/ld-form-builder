class AddFormToEnquete < ActiveRecord::Migration
  def change
    add_column :enquetes, :form, :text
  end
end
