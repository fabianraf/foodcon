class CreatePrograms < ActiveRecord::Migration
  def change
    create_table :programs do |t|
      t.string :name
      t.text :description
      t.string :price
      t.datetime :start_date
      t.datetime :end_date
      t.timestamps
    end
  end
end
