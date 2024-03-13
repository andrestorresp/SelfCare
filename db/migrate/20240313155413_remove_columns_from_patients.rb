class RemoveColumnsFromPatients < ActiveRecord::Migration[7.1]
  def change
    remove_column :patients, :alergy, :string
    remove_column :patients, :observation, :text
  end
end
