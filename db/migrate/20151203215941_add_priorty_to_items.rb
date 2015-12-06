class AddPriortyToItems < ActiveRecord::Migration
  def change
  	add_column :items, :priority, :integer, default: 10
  end
end
