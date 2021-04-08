class AddFieldsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :is_recruiter, :boolean
    add_column :users, :phone_number, :string
    add_column :users, :education, :string
    add_column :users, :address, :string
    add_column :users, :highest_degree, :string
  end
end
