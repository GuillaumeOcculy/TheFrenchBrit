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

    Setting.create(title: 'title', sub_title: 'sub_title', description: 'description', footer_title: 'footer_title', studio_title: 'studio_title', studio_description: 'studio_description')
  end
end
