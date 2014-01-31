class AddTypeOfLayoutToPrograms < ActiveRecord::Migration
  def change
    add_column :programs, :type_of_layout, :integer
  end
end
