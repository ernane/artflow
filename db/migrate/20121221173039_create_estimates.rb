class CreateEstimates < ActiveRecord::Migration
  def change
    create_table :estimates do |t|
      t.integer :hours
      t.decimal :rate, :precision => 10, :scale => 2

      t.timestamps
    end
  end
end
