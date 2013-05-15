class RenameCiudadAndProvinciaOnContactUs < ActiveRecord::Migration
  def up
    rename_column :contact_us, :ciudad, :city
    rename_column :contact_us, :provincia, :province
  end

  def down
    rename_column :contact_us, :city,  :ciudad
    rename_column :contact_us, :province, :provincia
  end
end
