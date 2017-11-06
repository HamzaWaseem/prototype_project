class AddUserIdToForms < ActiveRecord::Migration[5.0]
  def change
    add_column :forms, :user_id, :integer
  end
end
