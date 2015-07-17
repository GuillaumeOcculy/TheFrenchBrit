class AddCastingTypeToPins < ActiveRecord::Migration
  def change
    add_column :pins, :casting_type, :string
  end
end
