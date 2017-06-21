class CreateCourses < ActiveRecord::Migration[5.0]
  def change
    create_table :courses do |t|
      t.string :title
      t.string :place
      t.text :description

      t.integer :group_id
      t.timestamps
    end
  end
end
