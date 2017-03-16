class CreateStories < ActiveRecord::Migration[5.0]
  def change
    create_table :stories do |t|
      t.string :title
      t.text :story
      t.attachment :pic
      t.boolean :anonymous, null: false, default: false

      t.integer :user_id

      t.timestamps
    end
  end
end
