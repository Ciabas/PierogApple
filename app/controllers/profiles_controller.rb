class ProfilesController < ApplicationController

  def show
    @profile = Profile.find(params[:id])
  end

  def new
    @profile = Profile.new
  end

  def create
    @user = current_user
    @profile = Profile.new(profile_params, user_id: @user)
    if @profile.save
      redirect_to users_path
    else
      render :new
    end
  end

  def edit
    @profile = Profile.find(params[:id])
  end

  def update
    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      redirect_to profiles_path
    else
      render :edit
    end
  end

  private

  def profile_params
    params.require(:profile).permit(:first_name, :last_name, :street_name, :house_no, :apartment_no, :zip_code, :city_name)
  end
end
