class CreateEmployees < ActiveRecord::Migration[5.2]
  def change
    create_table :employees do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :eid
      t.integer :department_id
      t.integer :company_id

      t.timestamps
    end
    add_index :employees, :email, unique: true
    add_index :employees, :eid, unique: true
  end
end
