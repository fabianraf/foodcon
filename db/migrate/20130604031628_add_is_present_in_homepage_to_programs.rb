class AddIsPresentInHomepageToPrograms < ActiveRecord::Migration
  def change
    add_column :programs, :is_present_in_homepage, :boolean
  end
end
