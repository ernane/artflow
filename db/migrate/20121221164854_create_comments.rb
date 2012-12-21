class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body, :null => false
      t.references :creation
      t.integer :user_id
      t.string :user_type

      t.timestamps
    end
    add_index :comments, :creation_id
    add_index :comments, [:user_id, :user_type]
  end
end
