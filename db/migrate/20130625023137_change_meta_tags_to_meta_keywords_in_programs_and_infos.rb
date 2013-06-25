class ChangeMetaTagsToMetaKeywordsInProgramsAndInfos < ActiveRecord::Migration
  def up
    rename_column :programs, :meta_tags, :meta_keywords
    rename_column :company_infos, :meta_tags, :meta_keywords
  end

  def down
    rename_column :programs, :meta_keywords, :meta_tags
    rename_column :company_infos, :meta_keywords, :meta_tags
  end
end
