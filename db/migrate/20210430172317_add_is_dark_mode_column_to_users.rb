class AddIsDarkModeColumnToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :is_dark_mode, :boolean, default: false
  end
end
