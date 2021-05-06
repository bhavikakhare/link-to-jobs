class CreateReviews < ActiveRecord::Migration[6.1]
  def change
    create_table :reviews do |t|
      t.integer :rating_5
      t.string :review_text

      t.timestamps
    end
  end
end
