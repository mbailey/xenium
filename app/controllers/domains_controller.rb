class DomainsController < ApplicationController
  # GET /domains
  # GET /domains.xml
  
# rescue_from badError => :do_this
  
  def index
    if params[:running] == 'true'
      selector = :running
    else
      selector = :all
    end
    @domains = Domain.find(selector)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @domains }
    end
  end

  # GET /domains/1
  # GET /domains/1.xml
  def show
    @domain = Domain.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @domain }
    end
  end

  # GET /domains/new
  # GET /domains/new.xml
  def new
    @domain = Domain.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @domain }
    end
  end

  # GET /domains/1/edit
  def edit
    @domain = Domain.find(params[:id])
  end

  # POST /domains
  # POST /domains.xml
  def create
    @domain = Domain.new(params[:domain])

    respond_to do |format|
      if @domain.save
        flash[:notice] = 'Domain was successfully created.'
        format.html { redirect_to(@domain) }
        format.xml  { render :xml => @domain, :status => :created, :location => @domain }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @domain.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /domains/1
  # PUT /domains/1.xml
  def update
    @domain = Domain.find(params[:id])

    respond_to do |format|
      if @domain.update_attributes(params[:domain])
        flash[:notice] = 'Domain was successfully updated.'
        format.html { redirect_to(@domain) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @domain.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /domains/1
  # DELETE /domains/1.xml
  def destroy
    @domain = Domain.find(params[:id])
    @domain.shutdown

    respond_to do |format|
      format.html { redirect_to(domains_url) }
      format.xml  { head :ok }
    end
  end
  
  def start
    @domain = Domain.find(params[:id])

    respond_to do |format|
      if @domain.start
        flash[:notice] = 'Domain was started.'
        format.html { redirect_to(@domain.name) }
        format.xml  { head :ok }
      else
        format.html { render :text => "domain failed to start" }
        format.xml  { render :xml => @domain.errors, :status => :unprocessable_entity }
        format.js  { render :text => "domain failed to start" }
      end
    end
  end
  
  def stop
    @domain = Domain.find(params[:id])
    
    respond_to do |format|
      if @domain.stop
        flash[:notice] = 'Domain was stopped.'
        format.html { redirect_to(@domain.name) }
        format.xml  { head :ok }
      else
        format.html { render :text => "domain failed to stop" }
        format.xml  { render :xml => @domain.errors, :status => :unprocessable_entity }
        format.js  { render :text => "domain failed to stop" }
      end
    end
  end
  
end
