class AddUpdateUserToForms < ActiveRecord::Migration[5.0]
  def change
  add_column :forms, :completed_by, :integer
  add_column :forms, :updated_by, :integer
  add_column :forms, :is_complete, :boolean
  end
end
