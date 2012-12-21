class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.references :plan
      t.references :client

      t.timestamps
    end
    add_index :subscriptions, :plan_id
    add_index :subscriptions, :client_id
  end
end
