class CreateDiagnoses < ActiveRecord::Migration[7.1]
  def change
    create_table :diagnoses do |t|
      t.boolean :diabetes
      t.boolean :hypertension
      t.boolean :tuberculosis
      t.boolean :cancer
      t.text :other_diseases
      t.text :other_details
      t.references :patient, null: false, foreign_key: true

      t.timestamps
    end
  end
end
