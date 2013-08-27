class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :storytitle
      t.text :storytext
      t.timestamps
    end
  end
end
