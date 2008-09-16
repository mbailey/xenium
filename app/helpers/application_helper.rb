# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def domain_control_buttons(domain)
    result = []
    if domain.state == :running 
      result << 'start'
      result << link_to_remote('shutdown', :url => shutdown_domain_path(domain.name), :method => :post, :confirm => 'Are you sure?', :update => "domain_controls_#{domain.name}")
    elsif domain.state == :stopped
      result << link_to_remote('start', :url => start_domain_path(domain.name),  :method => :post, :update => "domain_controls_#{domain.name}")
      result << 'shutdown'
    end
    "#{domain.state.to_s} [#{result.join ' | '}]"
  end
    
end

