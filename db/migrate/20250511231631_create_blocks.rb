class CreateBlocks < ActiveRecord::Migration[8.0]
  def change
    create_table :blocks do |t|
      t.references :blocker, foreign_key: { to_table: :users }
      t.references :blocked, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
