class AddAttributesToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :age, :integer
    add_column :users, :dni, :integer
    add_column :users, :sap, :integer
    add_column :users, :number_phone, :string
    add_column :users, :specialty, :string
  end
end
