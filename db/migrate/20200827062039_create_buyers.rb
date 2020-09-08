class CreateBuyers < ActiveRecord::Migration[6.0]
  def change
    create_table :buyers do |t|
      t.string     :postalcode,    null: false
      t.integer    :area_id,       null: false
      t.string     :city,          null: false
      t.string     :housenumber,   null: false
      t.string     :buildingname 
      t.string     :phonenumber,   null: false
      t.integer    :management_id, null: false    , foreign_key: true
      t.timestamps
    end
  end
end
