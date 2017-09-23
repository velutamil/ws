class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.string :address1
      t.string :address2
      t.string :city
      t.string :state
      t.string :country
      t.string :pincode

      t.timestamps
    end
  end
end
