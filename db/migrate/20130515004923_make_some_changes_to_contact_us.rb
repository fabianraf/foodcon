class MakeSomeChangesToContactUs < ActiveRecord::Migration
  def up
    rename_column :contact_us, :nationality, :ciudad
    add_column :contact_us, :country, :string
    add_column :contact_us, :provincia, :string
  end

  def down
    rename_column :contact_us, :ciudad, :nationality
    remove_column :contact_us, :country, :string
    remove_column :contact_us, :provincia, :string
  end
end
