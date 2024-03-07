class CreateDoctors < ActiveRecord::Migration[7.1]
  def change
    create_table :doctors do |t|
      t.string :specialty
      t.integer :sap
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
