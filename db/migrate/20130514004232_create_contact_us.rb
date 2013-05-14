class CreateContactUs < ActiveRecord::Migration
  def change
    create_table :contact_us do |t|
      t.string "full_name"
      t.string "nationality"
      t.string "email"
      t.integer "program_id"
      t.text "body"
      t.timestamps
    end
  end
end
