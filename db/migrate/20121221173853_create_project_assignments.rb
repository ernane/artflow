class CreateProjectAssignments < ActiveRecord::Migration
  def change
    create_table :project_assignments do |t|
      t.references :designer
      t.references :project

      t.timestamps
    end
    add_index :project_assignments, :designer_id
    add_index :project_assignments, :project_id
  end
end
