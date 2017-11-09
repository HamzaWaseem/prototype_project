class CreateForms < ActiveRecord::Migration[5.0]
  def change
    create_table :forms do |t|
      t.string :department
      t.string :category
      t.string :date_started
      t.string :date_completed
      t.text :summary_of_problem
      t.string :impact
      t.string :applicable_to_other_areas
      t.string :solution_applied
      t.string :category_level
      t.integer :user_id

      t.timestamps
    end
  end
end
