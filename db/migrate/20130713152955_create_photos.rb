class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.text :image

      t.timestamps
    end
  end
end
