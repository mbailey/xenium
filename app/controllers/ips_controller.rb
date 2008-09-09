class IpsController < ApplicationController
  # GET /ips
  # GET /ips.xml
  def index
    # XXX extract me from this controller you swine!
    if params[:network_id]
      @ips = Network.find(params[:network_id]).ips
    else
      @ips = Ip.find(:all)
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @ips }
    end
  end

  # GET /ips/1
  # GET /ips/1.xml
  def show
    @ip = Ip.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ip }
    end
  end

  # GET /ips/new
  # GET /ips/new.xml
  def new
    @ip = Ip.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ip }
    end
  end

  # GET /ips/1/edit
  def edit
    @ip = Ip.find(params[:id])
  end

  # POST /ips
  # POST /ips.xml
  def create
    @ip = Ip.new(params[:ip])
    @ip.network = Network.find(params[:network][:id])
    respond_to do |format|
      if @ip.save
        flash[:notice] = 'Ip was successfully created.'
        format.html { redirect_to(@ip) }
        format.xml  { render :xml => @ip, :status => :created, :location => @ip }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ip.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /ips/1
  # PUT /ips/1.xml
  def update
    @ip = Ip.find(params[:id])

    respond_to do |format|
      if @ip.update_attributes(params[:ip])
        flash[:notice] = 'Ip was successfully updated.'
        format.html { redirect_to(@ip) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ip.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /ips/1
  # DELETE /ips/1.xml
  def destroy
    @ip = Ip.find(params[:id])
    @ip.destroy

    respond_to do |format|
      format.html { redirect_to(ips_url) }
      format.xml  { head :ok }
    end
  end
end
