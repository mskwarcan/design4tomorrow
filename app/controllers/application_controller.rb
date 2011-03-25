class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def join_the_team
    BoardMailer.board_email(params[:join]).deliver unless refinery_user?
    
    redirect_to('/join-the-team')
  end
end
