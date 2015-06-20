class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :place
      t.string :type
      t.string :date

      t.timestamps null: false
    end
  end
end
