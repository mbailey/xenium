# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def slice_control_buttons(slice)
    result = []
    if slice.state == :running 
      result = '<span class="active">running</span>'
      result << link_to_remote('shutdown', :url => shutdown_slice_path(slice.name), :method => :put, :confirm => 'Are you sure?', :update => "slice_controls_#{slice.name}")
    elsif slice.state == :stopped
      result = '<span class="inactive">stopped</span>'
      result << link_to_remote('start', :url => start_slice_path(slice.name),  :method => :put, :update => "slice_controls_#{slice.name}")
    end
  end
  
  def slice_toggle_autostart(slice)
    result = []
    if slice.config_file.auto?
      result << link_to_remote(image_tag('star_selected.gif', :width=>20, :height=>20), :url => toggle_autostart_slice_path(slice.name), :method => :put, :update => "slice_toggle_autostart_#{slice.name}")
    else
      result << link_to_remote(image_tag('star_unselected.gif', :width=>20, :height=>20), :url => toggle_autostart_slice_path(slice.name),  :method => :put, :update => "slice_toggle_autostart_#{slice.name}")
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

