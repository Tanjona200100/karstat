class SessionsController < ApplicationController
  def new
    # Affiche le formulaire de connexion
  end

  def create
    user = User.find_by(login: params[:login])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Connexion réussie"
    else
      flash.now[:alert] = "Login ou mot de passe invalide"
      render :new
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Vous avez été déconnecté avec succès"
  end
end