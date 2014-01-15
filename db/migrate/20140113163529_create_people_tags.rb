class CreatePeopleTags < ActiveRecord::Migration
  def change
    create_table :people_tags do |t|
      t.belongs_to :person
      t.belongs_to :tag
    end
  end
end
