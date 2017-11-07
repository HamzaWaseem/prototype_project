class AddColumnToFroms < ActiveRecord::Migration[5.0]
  def change
    add_column :forms, :is_applicable_to_other_areas, :boolean
    add_column :forms, :impact, :string
  end
end
