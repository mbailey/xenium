class SlicesController < ApplicationController
  # GET /slices
  # GET /slices.xml
  
# rescue_from badError => :do_this
  
  def index
    if params[:running] == 'true'
      selector = :running
    else
      selector = :all
    end
    @slices = Slice.find(selector)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @slices }
    end
  end

  # GET /slices/1
  # GET /slices/1.xml
  def show
    @slice = Slice.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @slice }
    end
  end

  # GET /slices/new
  # GET /slices/new.xml
  def new
    @slice = {} # Slice.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @slice }
    end
  end

  # GET /slices/1/edit
  def edit
    @slice = Slice.find(params[:id])
  end

  # POST /slices
  # POST /slices.xml
  def create
    render :text => params.inspect
    # @slice = Slice.new(params[:slice])

    # respond_to do |format|
    #   if @slice.save
    #     flash[:notice] = 'Slice was successfully created.'
    #     format.html { redirect_to(@slice) }
    #     format.xml  { render :xml => @slice, :status => :created, :location => @slice }
    #   else
    #     format.html { render :action => "new" }
    #     format.xml  { render :xml => @slice.errors, :status => :unprocessable_entity }
    #   end
    # end
  end

  # PUT /slices/1
  # PUT /slices/1.xml
  def update
    @slice = Slice.find(params[:id])

    respond_to do |format|
      if @slice.update_attributes(params[:slice])
        flash[:notice] = 'Slice was successfully updated.'
        format.html { redirect_to(@slice) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @slice.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /slices/1
  # DELETE /slices/1.xml
  def destroy
    @slice = Slice.find(params[:id])
    @slice.shutdown

    respond_to do |format|
      format.html { redirect_to(slices_url) }
      format.xml  { head :ok }
    end
  end
  
  def start
    @slice = Slice.find(params[:id])

    respond_to do |format|
      if @slice.start
        flash[:notice] = 'Slice was started.'
        format.js   { render :inline => "<%= slice_control_buttons(@slice) %>" }
        format.html { redirect_to(@slice.name) }
        format.xml  { head :ok }
      else
        format.html { render :text => "slice failed to start" }
        format.xml  { render :xml => @slice.errors, :status => :unprocessable_entity }
        format.js  { render :text => "slice failed to start" }
      end
    end
  end
  
  def shutdown
    @slice = Slice.find(params[:id])
    
    respond_to do |format|
      if @slice.shutdown
        flash[:notice] = 'Slice was shut down.'
        format.html { redirect_to(@slice.name) }
        format.js   { render :inline => "<%= slice_control_buttons(@slice) %>" }
        format.xml  { head :ok }
      else
        format.html { render :text => "slice failed to shut down" }
        format.xml  { render :xml => @slice.errors, :status => :unprocessable_entity }
        format.js  { render :text => "slice failed to shut down" }
      end
    end
  end
  
end
