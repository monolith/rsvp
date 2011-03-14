class CreateRsvps < ActiveRecord::Migration
  def self.up
    create_table :rsvps do |t|
      t.string :name
      t.boolean :attending
      t.integer :plus
      t.string :email
      t.string :mobile
      t.string :stay
      t.string :allergies
      t.string :food
      t.timestamps
    end
  end

  def self.down
    drop_table :rsvps
  end
end

