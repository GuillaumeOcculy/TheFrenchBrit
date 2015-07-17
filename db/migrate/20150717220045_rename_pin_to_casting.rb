class RenamePinToCasting < ActiveRecord::Migration
  def change
    rename_table :pins, :castings
  end
end
