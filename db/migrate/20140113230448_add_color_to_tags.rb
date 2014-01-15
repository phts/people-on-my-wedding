class AddColorToTags < ActiveRecord::Migration
  def change
    add_column :tags, :color, :integer
  end
end
