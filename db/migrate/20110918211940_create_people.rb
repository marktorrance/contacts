class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :address1
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone1
      t.string :email

      t.timestamps
    end
  end
end
