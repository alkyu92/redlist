class CreateResearches < ActiveRecord::Migration[5.0]
  def change
    create_table :researches do |t|
      t.string :major
      t.string :specialization
      t.text :description

      t.integer :group_id
      t.timestamps
    end
  end
end
