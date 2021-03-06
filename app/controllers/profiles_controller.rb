# responsible for creating or showing current user's profile
class ProfilesController < ApplicationController
  before_action :authenticate_user!

  def show
    @profile = current_user.profile
  end

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    if @profile.save
      flash[:notice] = 'Profil utworzony.'
      redirect_to root_url
    else
      flash[:error] = 'Błąd. Spróbuj ponownie.'
      render :new
    end
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      flash[:notice] = 'Profil zaktualizowany.'
      redirect_to profile_path(@profile)
    else
      flash[:error] = 'Błąd. Spróbuj ponownie.'
      render :edit
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :street_name, :house_no,
                                    :apartment_no, :zip_code, :city_name, :phone_no)
  end
end
