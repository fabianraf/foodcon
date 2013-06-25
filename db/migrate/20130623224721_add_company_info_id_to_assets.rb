class AddCompanyInfoIdToAssets < ActiveRecord::Migration
  def change
    add_column :assets, :company_info_id, :integer
  end
end
