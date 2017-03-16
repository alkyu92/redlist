class CreateGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :department
      t.text :description
      t.string :address
      t.string :phone
      t.string :email

      t.integer :user_id
      t.timestamps
    end
  end
end
