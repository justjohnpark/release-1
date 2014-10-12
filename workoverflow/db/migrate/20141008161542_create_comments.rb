class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.references :user, index: true
      t.references :project, index: true

      # add_index :comments, :user_id
      # add_index :comments, :project_id

      t.timestamps
    end
  end
end
