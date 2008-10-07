class HostsController < ApplicationController
  # GET /hosts
  # GET /hosts.xml
  # def index
  #   @hosts = Host.find(:all)
  # 
  #   respond_to do |format|
  #     format.html # index.html.erb
  #     format.xml  { render :xml => @hosts }
  #   end
  # end

  def index
    redirect_to :controller => :hosts, :action => :show
  end
  
  # GET /hosts/1
  # GET /hosts/1.xml
  def show
    # @host = Xen::Host.find(params[:id])
    @host = Xen::Host.new

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @host }
    end
  end

  # GET /hosts/new
  # GET /hosts/new.xml
  def new
    @host = Xen::Host.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @host }
    end
  end

  # GET /hosts/1/edit
  def edit
    @host = Xen::Host.find(params[:id])
  end

  # POST /hosts
  # POST /hosts.xml
  def create
    @host = Xen::Host.new(params[:host])

    respond_to do |format|
      if @host.save
        flash[:notice] = 'Host was successfully created.'
        format.html { redirect_to(@host) }
        format.xml  { render :xml => @host, :status => :created, :location => @host }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @host.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /hosts/1
  # PUT /hosts/1.xml
  def update
    @host = Xen::Host.find(params[:id])

    respond_to do |format|
      if @host.update_attributes(params[:host])
        flash[:notice] = 'Host was successfully updated.'
        format.html { redirect_to(@host) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @host.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /hosts/1
  # DELETE /hosts/1.xml
  def destroy
    @host = Xen::Host.find(params[:id])
    @host.destroy

    respond_to do |format|
      format.html { redirect_to(hosts_url) }
      format.xml  { head :ok }
    end
  end
end
