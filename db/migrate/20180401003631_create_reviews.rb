class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.text :content
      t.string :rating
      t.datetime :review_date
      
      t.belongs_to :review, index: true, foreign_key: true #need for heroku?
      t.belongs_to :cuisine, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
