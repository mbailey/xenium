class Slice < Xen::Slice
  
  XEN_CMD_RUNNER = '/usr/local/bin/ruby jobs/xen_cmd.rb' # XXX don't hard code path
  
  def shutdown
    Bj.submit "#{XEN_CMD_RUNNER} shutdown #{name} true", :tag => "#{name}.shutdown"
  end
  
  def shutting_down?
    # XXX What happens if bj fails and we get a whole lot of pending requests?
    # XXX Perhaps run a sweeper under cron to clean them up.
    # XXX Perhaps get most recent shutdown command and return true if it is running or pending
    Bj.table.job.find(:first, :conditions => "tag = '#{name}.shutdown' and state in ('running', 'pending')")
  end
  
  def pending_creation?
    # XXX Same issues as :shutting_down?
    Bj.table.job.find(:first, :conditions => "tag = '#{name}.create' and state in ('running', 'pending')")
  end
  
  alias _state state
  def state
    if _state == :running
      return shutting_down? ? :shutting_down : :running
    else
      return pending_creation? ? :pending_creation : :stopped
    end
  end
  
  def running?
    state == :running
  end
  
end