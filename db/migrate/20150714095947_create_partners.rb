class CreatePartners < ActiveRecord::Migration
  def change
    create_table :partners do |t|
      t.string :name
      t.string :link
      t.text :description

      t.timestamps null: false
    end
  end
end
