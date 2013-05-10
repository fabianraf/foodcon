class AddShortDescriptionToPrograms < ActiveRecord::Migration
  def change
    add_column :programs, :short_description, :string
  end
end
