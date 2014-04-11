class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :task
      t.column :status, :integer, default: 0
    end
  end
end
