class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :cstr_dtls do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.date :date_of_birth

      t.timestamps
    end
  end
end
