class ChangingToText < ActiveRecord::Migration
  def change
    change_table :students do |t|
      t.change :twitter, :text
    end
  end
end
