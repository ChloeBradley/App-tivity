class ChangeEventsAttributes < ActiveRecord::Migration
  def change
    def up
     add_column :latitude, :float
    end

    def down
       remove_column :type, :string
    end

    def up
     add_column :longitude, :float
    end

    def down
     remove_column :date, :string
    end

    def up
     add_column :title, :string
    end

    def down
     remove_column :place, :string
    end
  end
end
