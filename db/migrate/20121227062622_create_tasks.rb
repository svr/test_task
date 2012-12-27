class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name
      t.string :status
      t.datetime :deadline_at
      t.integer :priority
      t.integer :project_id, :references => :projects

      t.timestamps
    end
  end
end
