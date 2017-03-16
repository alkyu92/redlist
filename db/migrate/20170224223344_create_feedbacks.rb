class CreateFeedbacks < ActiveRecord::Migration[5.0]
  def change
    create_table :feedbacks do |t|
      t.text :inquiry
      t.string :email

      t.timestamps
    end
  end
end
