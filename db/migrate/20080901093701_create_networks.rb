class CreateNetworks < ActiveRecord::Migration
  def self.up
    create_table :networks do |t|
      t.string :name
      t.string :network_address
      t.string :first_usable    # we could generate this using whatmask
      t.string :last_usable     # we could generate this using whatmask
      t.string :gateway
      t.string :netmask
      t.string :broadcast

      t.timestamps
    end
  end

  def self.down
    drop_table :networks
  end
end
