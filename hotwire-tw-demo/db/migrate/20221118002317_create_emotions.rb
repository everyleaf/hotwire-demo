class CreateEmotions < ActiveRecord::Migration[7.0]
  def change
    create_table :emotions do |t|
      t.string :name, null: false
      t.text :body, null: false
      t.integer :icon, null: false, default: 0
      t.integer :like_count, null: false, default: 0

      t.timestamps
    end
  end
end
