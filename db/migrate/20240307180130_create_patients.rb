class CreatePatients < ActiveRecord::Migration[7.1]
  def change
    create_table :patients do |t|
      t.string :alergy
      t.text :observation
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
