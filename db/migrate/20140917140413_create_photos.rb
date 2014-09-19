class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.references :article, index: true
      t.string :name
      t.timestamps
    end
  end
end
