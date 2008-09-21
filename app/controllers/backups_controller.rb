class BackupsController < ApplicationController
  
  def index
    @backups = Backup.find(params[:slice])

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @backups }
    end
  end
  
end
