class AddNameReadingFamilyNameToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name_reading_family_name, :string
  end
end
