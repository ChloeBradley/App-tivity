class ChangeColumnEvents < ActiveRecord::Migration
  def change
     remove_column :events, :place, :string
     remove_column :events, :date, :string
     remove_column :events, :type, :string
   end
end
