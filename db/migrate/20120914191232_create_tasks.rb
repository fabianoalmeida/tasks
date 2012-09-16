class CreateTasks < ActiveRecord::Migration
  def change
    create_table :tasks do |t|
      t.string :name, :null => false
      t.references :list
      t.references :user

      t.timestamps
    end
  end
end
