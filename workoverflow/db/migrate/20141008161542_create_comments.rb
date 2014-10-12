class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.integer :user_id
      t.integer :project_id

      add_index :comments, :user_id
      add_index :comments, :project_id

      t.timestamps
    end
  end
end
