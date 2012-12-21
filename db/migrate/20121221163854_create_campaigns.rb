class CreateCampaigns < ActiveRecord::Migration
  def change
    create_table :campaigns do |t|
      t.string :name,   :null => false
      t.decimal :cost,  :precision => 10, :scale => 2
      t.date :start_date
      t.date :end_date
      t.references :client

      t.timestamps
    end
    add_index :campaigns, :client_id
    add_index :campaigns, :name, :unique => true
  end
end
