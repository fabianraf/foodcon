class AddSlugFieldsToPrograms < ActiveRecord::Migration
  def change
    add_column :programs, :cached_slug, :string
    add_index :programs,  :cached_slug
  end
end
