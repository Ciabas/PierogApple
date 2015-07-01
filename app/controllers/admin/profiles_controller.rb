class Admin::ProfilesController < Admin::AdminController
  
  def index
    @profiles = Profile.all
  end

  def show
    @profile = Profile.find(params[:id])
  end

  def destroy
    @profile = Profile.find(params[:id])
    @profile.destroy
    redirect_to admin_profiles_path
  end

end
