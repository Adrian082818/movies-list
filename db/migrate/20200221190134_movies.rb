class Movies < ActiveRecord::Migration
  def change
    create_table :movies do |t| 
      t.string :title 
      t.string :director
      t.string :genre
      t.integer :user_id
    end 
  end
end
