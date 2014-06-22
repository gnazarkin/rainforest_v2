class RemoveFieldNameFromTable < ActiveRecord::Migration
  def change
    remove_column :products, :descrition, :text
  end
end
