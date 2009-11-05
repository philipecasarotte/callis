class CreateEvents < ActiveRecord::Migration
  def self.up
    create_table :events do |t|
      t.string :name
      t.string :permalink
      t.text :body
      t.date :happens_on

      t.timestamps
    end
  end

  def self.down
    drop_table :events
  end
end
