class AddMetaTagsToProgramsAndInfos < ActiveRecord::Migration
  def change
    add_column :programs, :meta_tags, :text
    add_column :company_infos, :meta_tags, :text
  end
end
