class CreateSettings < ActiveRecord::Migration
  def change
    create_table :settings do |t|
      t.string  :title
      t.string  :sub_title
      t.text    :description
      t.string  :footer_title
      t.string  :studio_title
      t.text    :studio_description
      t.timestamps null: false
    end

    Setting.create
  end
end
