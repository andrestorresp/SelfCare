class ChangeDniToUsers < ActiveRecord::Migration[7.1]
  def change
    change_column :users, :dni, :string
  end
end
