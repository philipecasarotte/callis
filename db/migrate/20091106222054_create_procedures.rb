class CreateProcedures < ActiveRecord::Migration
  def self.up
    create_table :procedures do |t|
      t.string :name
      t.text :explanation
      t.text :steps
      t.text :warning
      t.text :place
      t.integer :user_id
      t.integer :department_id
      t.string :department_division
      t.string :periodicity
      t.string :permalink
      t.integer :position

      t.timestamps
    end
  end

  def self.down
    drop_table :procedures
  end
end
