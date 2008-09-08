class CreateIps < ActiveRecord::Migration
  def self.up
    create_table :ips do |t|
      t.integer :network_id
      t.string :address
      t.integer :interface

      t.timestamps
    end
  end

  def self.down
    drop_table :ips
  end
end
