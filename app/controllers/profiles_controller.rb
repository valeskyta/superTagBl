class ProfilesController < ApplicationController
	  # ruta get 'profiles/show/:id', to: 'profiles#show'
  def show

    if params[:username].present?
      @user = User.find_by(username: params[:username])
    else
      @user = current_user
    end
  end

  def edit
  end

end
