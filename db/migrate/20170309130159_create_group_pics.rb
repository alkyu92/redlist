class CreateGroupPics < ActiveRecord::Migration[5.0]
  def change
    create_table :group_pics do |t|
      t.integer :group_id
      t.attachment :pic

      t.timestamps
    end
  end
end
