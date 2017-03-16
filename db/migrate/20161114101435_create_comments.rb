class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.text :body
      t.string :info, default: ""
      t.integer :commentable_id
      t.string :commentable_type
      t.integer :user_id
      t.integer :advertisement_id

      t.timestamps
    end
  end
end
