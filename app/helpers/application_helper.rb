# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def slice_control_buttons(slice)
    result = []
    if slice.state == :running 
      result << 'start'
      result << link_to_remote('shutdown', :url => shutdown_slice_path(slice.name), :method => :put, :confirm => 'Are you sure?', :update => "slice_controls_#{slice.name}")
    elsif slice.state == :stopped
      result << link_to_remote('start', :url => start_slice_path(slice.name),  :method => :put, :update => "slice_controls_#{slice.name}")
      result << 'shutdown'
    end
    "#{slice.state.to_s} [#{result.join ' | '}]"
  end
  
  def slice_toggle_autostart(slice)
    result = []
    if slice.config_file.auto? 
      result << link_to_remote('yes', :url => toggle_autostart_slice_path(slice.name), :method => :put, :update => "slice_toggle_autostart_#{slice.name}")
    else
      result << link_to_remote('no', :url => toggle_autostart_slice_path(slice.name),  :method => :put, :update => "slice_toggle_autostart_#{slice.name}")
    end
  end
  
  def format_bytes(megabytes)
    megabytes = Integer(megabytes)
    if megabytes > 1024
      sprintf "%2.1f Gb", megabytes/1024.0
    else
      "#{megabytes} Mb"
    end
  end
      
    
end

