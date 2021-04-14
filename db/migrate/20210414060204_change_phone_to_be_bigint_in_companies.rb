class ChangePhoneToBeBigintInCompanies < ActiveRecord::Migration[6.1]
  def change
    change_column :companies, :phone_number, :bigint
  end
end
