class Network < ActiveRecord::Base
  require 'IpAddress'
  has_many :ips
  
  def all_ips
    first_usable.to_ip..last_usable.to_ip
  end
  
  def used_ips
    ips.collect{ |ip| ip.address}
  end
  
  def next_unused_ip
    all_ips.detect{ |ip| ! Array(used_ips).include?(ip.to_s) }
  end
  # n.ips << Ip.new(:address=>n.next_unused_ip.string)
  
  def remaining_ips
    IpAddress.mask_size(netmask) - ips.count - 2
  end
end
