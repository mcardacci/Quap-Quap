class CreatePictures < ActiveRecord::Migration
  def change
    create_table :pictures do |t|
      t.string :path, null: false
      t.timestamps
    end
  end
end
