class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :picture_url, null: false
      t.timestamps
    end
  end
end
