class CreatePeople < ActiveRecord::Migration[5.0]
  def change
    create_table :people do |t|
      t.string :name
      t.integer :occupation_id
      t.string :level
      t.text :intro
      t.string :email
      t.attachment :profile_pic

      t.integer :group_id
      t.timestamps
    end
  end
end
