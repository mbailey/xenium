class Xen::Slice # We get this from the ruby-xen gem

  XEN_CMD_RUNNER = '/usr/local/bin/ruby jobs/xen_cmd.rb' # XXX don't hard code path
  
  # XXX Perhaps DRY this up by extracting commonality
  def shutdown
    Bj.submit "#{XEN_CMD_RUNNER} shutdown_instance #{name} true", :tag => "#{name}.shutdown_instance"
  end
  
  def create
    Bj.submit "#{XEN_CMD_RUNNER} create_image --hostname=#{name}", :tag => "#{name}.create_image"
  end
  
  def create_backup(version=nil)
    version ||= Time.now.strftime('%Y%m%d')
    Bj.submit "#{XEN_CMD_RUNNER} create_backup #{name} #{version} :blocking", :tag => "#{name}.create_backup"
  end
  
  def shutting_down?
    # XXX What happens if bj fails and we get a whole lot of pending requests?
    # XXX Perhaps run a sweeper under cron to clean them up.
    # XXX Perhaps get most recent shutdown command and return true if it is running or pending
    Bj.table.job.find(:first, :conditions => "tag = '#{name}.shutdown_instance' and state in ('running', 'pending')")
  end
  
  def pending_creation?
    # XXX Same issues as :shutting_down?
    Bj.table.job.find(:first, :conditions => "tag = '#{name}.create' and state in ('running', 'pending')")
  end
  
  # not working yet
  def backup_pending?
    Bj.table.job.find(:first, :conditions => "tag = '#{name}.create_backup' and state in ('pending')")
  end
  
  alias _state state
  def state
    if _state == :running
      return shutting_down? ? :shutting_down : :running
    else
      return pending_creation? ? :pending_creation : :stopped
    end
  end
  
  alias _backups backups
  def backups
    list = _backups
    list << Xen::Backup.new(name, :version => "pending") if backup_pending?
    list
  end
  
  def running?
    state == :running
  end
  
end