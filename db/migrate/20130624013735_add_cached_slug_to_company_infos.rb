class AddCachedSlugToCompanyInfos < ActiveRecord::Migration
  def change
    add_column :company_infos, :cached_slug, :string
  end
end
