class AddNameReadingFirstNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name_reading_first_name, :string
  end
end
