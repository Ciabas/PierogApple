module Admin
  # responsible for showing users' profiles in admin panel
  class ProfilesController < Admin::AdminController
    def index
      @profiles = Profile.all
      @users = User.all
    end

    def show
      @profile = Profile.find(params[:id])
    end

    def destroy
      @profile = Profile.find(params[:id])
      @profile.destroy
      flash[:notice] = 'Konto usunięte'
      redirect_to admin_profiles_path
    end
  end
end
