class CreateFollows < ActiveRecord::Migration[8.0]
  def change
    create_table :follows do |t|
      t.references :follower, foreign_key: { to_table: :profiles }
      t.references :followed, foreign_key: { to_table: :profiles }
      t.timestamps
    end
  end
end
