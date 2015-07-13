class CreatePins < ActiveRecord::Migration
  def change
    create_table :pins do |t|
      t.string :title
      t.text :description
      t.string :link
      t.string :media_type
      t.string :video_provider
      t.string :video_reference
      t.integer :priority
      t.belongs_to :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
