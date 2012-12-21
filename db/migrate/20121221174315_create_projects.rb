class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :name
      t.boolean :active
      t.references :campaign
      t.references :client

      t.timestamps
    end
    add_index :projects, :campaign_id
    add_index :projects, :client_id
  end
end
