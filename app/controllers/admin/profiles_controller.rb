class Admin::ProfilesController < AdminController
  
  def index
    @profiles = Profile.all
  end

  def show
    @profile = Profile.find(params[:id])
  end

end
