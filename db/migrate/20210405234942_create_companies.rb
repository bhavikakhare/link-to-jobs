class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table :companies do |t|
      t.string :name
      t.integer :year_established
      t.string :size
      t.string :email
      t.integer :phone_number
      t.decimal :avg_rating
      t.integer :count_ratings
      t.bigint :sum_ratings
      t.string :address
      t.text :description

      t.timestamps
    end
  end
end
