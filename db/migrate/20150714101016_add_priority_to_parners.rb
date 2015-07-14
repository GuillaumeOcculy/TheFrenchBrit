class AddPriorityToParners < ActiveRecord::Migration
  def change
    add_column :partners, :priority, :integer
  end
end
