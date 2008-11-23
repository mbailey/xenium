class ConfigFilesController < ApplicationController
  before_filter :load_host_details
  before_filter :load_xen_tools_conf
  

  # GET /slices/1/config_file
  # GET /slices/1/config_file.xml
  def show
    @slice = Xen::Slice.find(params[:slice_id])
    @config_file = @slice.config_file

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @slice.config_file }
    end
  end

  # GET /slices/1/edit
  def edit
    @slice = Xen::Slice.find(params[:slice_id])
    @config_file = @slice.config_file
  end

  # PUT /slices/1
  # PUT /slices/1.xml
  def update
    @slice = Xen::Slice.find(params[:slice_id])
    @config_file = @slice.config_file
    @config_file.memory = params[:memory]
    
    vifs = params[:vif].values.select{|vif| vif['enabled'] }
    @config_file.vifs = vifs.collect{|val| Xen::Vif.new(val)}   


    respond_to do |format|
      if @config_file.save
        flash[:notice] = 'Slice config was successfully updated.'
        format.html { redirect_to(slice_config_file_path @slice.name) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @config_file.errors, :status => :unprocessable_entity }
      end
    end
  end
  
end
