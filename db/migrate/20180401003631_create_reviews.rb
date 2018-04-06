class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.text :content
      t.string :rating
      t.datetime :review_date

      t.timestamps null: false
    end
  end
end
