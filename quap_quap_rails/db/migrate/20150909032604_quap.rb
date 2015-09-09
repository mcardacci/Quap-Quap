class Quap < ActiveRecord::Migration
  def change
  	create_table :quaps do |t|
  		t.belongs_to :answer, null: false
  		t.belongs_to :question, null: false
  		t.belongs_to :picture, null: false
  		t.belongs_to :user, null: false
  		t.string     :status, default: nil
  	end
  end
end
