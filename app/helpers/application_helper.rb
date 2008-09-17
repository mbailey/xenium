# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def slice_control_buttons(slice)
    result = []
    if slice.state == :running 
      result << 'start'
      result << link_to_remote('shutdown', :url => shutdown_slice_path(slice.name), :method => :post, :confirm => 'Are you sure?', :update => "slice_controls_#{slice.name}")
    elsif slice.state == :stopped
      result << link_to_remote('start', :url => start_slice_path(slice.name),  :method => :post, :update => "slice_controls_#{slice.name}")
      result << 'shutdown'
    end
    "#{slice.state.to_s} [#{result.join ' | '}]"
  end
    
end

