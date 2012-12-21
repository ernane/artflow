class CreateCreations < ActiveRecord::Migration
  def change
    create_table :creations do |t|
      t.references :estimate
      t.references :client
      t.references :project
      t.references :designer
      t.string :name
      t.string :stage
      t.integer :revision
      t.text :description
      t.integer :hours
      t.string :status
      t.string :color_space
      t.integer :bleed

      t.timestamps
    end
    add_index :creations, :estimate_id
    add_index :creations, :client_id
    add_index :creations, :project_id
    add_index :creations, :designer_id
  end
end
