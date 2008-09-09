class Ip < ActiveRecord::Base
  belongs_to :network, :dependent => :destroy
  validates_uniqueness_of :address
end
