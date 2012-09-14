class CreateLists < ActiveRecord::Migration
  def change
    create_table :lists do |t|
      t.string :name, :null => false
      t.boolean :limited, :null => false, :default => false
      t.references :user

      t.timestamps
    end
  end
end
