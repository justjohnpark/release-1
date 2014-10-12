class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :title
      t.text :description
      t.string :category
      t.string :location
      t.boolean :remote
      t.integer :time_estimation
      t.references :creator, index: true

      # add_index :projects, :creator_id

      t.timestamps
    end
  end
end
