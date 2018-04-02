class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.text :content
      t.string :rating
      t.datetime :review_date

      t.references :user, foreign_key: true #instead of t.integer :user_id
      t.references :restaurant, foreign_key: true #create unique index for foreign key

      t.timestamps null: false
    end
  end
end
