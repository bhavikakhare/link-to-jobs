class UpdateReviews < ActiveRecord::Migration[6.1]
  def change
    change_column :reviews, :rating_5, :decimal
    add_column :reviews, :anonymous, :boolean
  end
end
