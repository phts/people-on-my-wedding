class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :password
    end
  end
end
