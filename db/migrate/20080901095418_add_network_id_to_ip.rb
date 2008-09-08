class AddNetworkIdToIp < ActiveRecord::Migration
  def self.up
    add_column :ips, :network_id, :integer
  end

  def self.down
    remove_column :ips, :network_id
  end
end
