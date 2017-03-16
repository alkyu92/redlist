class CreatePublications < ActiveRecord::Migration[5.0]
  def change
    create_table :publications do |t|
      t.string :title
      t.string :event
      t.text :description

      t.integer :group_id
      t.timestamps
    end
  end
end
