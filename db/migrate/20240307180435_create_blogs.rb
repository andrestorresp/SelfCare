class CreateBlogs < ActiveRecord::Migration[7.1]
  def change
    create_table :blogs do |t|
      t.text :comment
      t.string :title
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end