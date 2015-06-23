class FixReference < ActiveRecord::Migration
  def change
  	change_table :table_name do |t|
      t.rename :old_column1, :new_column1
      t.rename :old_column2, :new_column2
    end
  end
end
