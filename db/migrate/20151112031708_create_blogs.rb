class CreateBlogs < ActiveRecord::Migration
  def change
    create_table :blogs do |t|
      t.string :title
      t.text :body
      t.integer :view_count, default: 0

      t.timestamps null: false
    end
  end
end
