class AddUrlToEnquete < ActiveRecord::Migration
  def change
    add_column :enquetes, :url, :text
  end
end
