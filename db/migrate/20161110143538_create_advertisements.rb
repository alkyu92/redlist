class CreateAdvertisements < ActiveRecord::Migration[5.0]
  def change
    create_table :advertisements do |t|
      t.string :name
      t.string :title
      t.string :amount
      t.text :description
      t.text :requirement
      t.string :address
      t.string :contact
      t.string :email
      t.string :bizhour
      t.string :website
      t.integer :user_id
      t.integer :category_id
      t.datetime :validity
      #t.integer :view
      t.boolean :enable_comment, default: true

      t.timestamps
    end
  end
end
