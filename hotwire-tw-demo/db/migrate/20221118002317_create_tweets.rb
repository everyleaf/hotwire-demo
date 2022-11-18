class CreateTweets < ActiveRecord::Migration[7.0]
  def change
    create_table :tweets do |t|
      t.string :name, null: false
      t.text :body, null: false
      t.integer :icon, null: false, defaut: 0

      t.timestamps
    end
  end
end
