class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null:false
      t.string :desc
      t.integer :user_id

      t.timestamps null: false
    end
  end
end
