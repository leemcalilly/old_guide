class CreateLessons < ActiveRecord::Migration
  def change
    create_table :lessons do |t|
      t.string :title
      t.date :date
      t.text :description
      t.text :featured_photo
      t.string :level
      t.string :genre
      t.string :topic
      t.string :video
      t.text :article
      t.text :resources
      t.string :visibility

      t.timestamps
    end
  end
end
