class CreateCommitments < ActiveRecord::Migration
  def change
    create_table :commitments do |t|
      t.integer :user_id
      t.integer :project_id
      t.index [:user_id, :project_id], unique: true

      t.timestamps
    end
  end
end
