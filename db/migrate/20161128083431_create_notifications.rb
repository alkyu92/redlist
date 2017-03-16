class CreateNotifications < ActiveRecord::Migration[5.0]
  def change
    create_table :notifications do |t|
      t.integer :user_id
      t.integer :notified_by_id
      t.integer :advertisement_id
      t.datetime :validity
      t.string  :comment_type
      t.string  :info
      t.text    :body
      t.boolean :read, default: false

      t.timestamps
    end
  end
end
