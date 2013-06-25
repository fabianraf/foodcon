class AddSortOrderToCompanyInfos < ActiveRecord::Migration
  def change
    add_column :company_infos, :sort_order, :integer
  end
end
