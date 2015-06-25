class Admin::AdminController < ApplicationController
  before_action :authorized

  private
  def authorized
   unless current_user.is_admin?
     flash[:error] = "Nie masz uprawnień do przeglądania tej strony."
     redirect_to root_path
   end
  end
end
