class AddSongsToRsvps < ActiveRecord::Migration
  def self.up
    add_column :rsvps, :songs, :string
  end

  def self.down
    remove_column :rsvps, :songs
  end
end

