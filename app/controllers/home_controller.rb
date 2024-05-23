class HomeController < ApplicationController
  def index
    if buffet_profile_signed_in?
      @buffet = current_buffet_profile.buffet
      if @buffet
        redirect_to buffet_path(@buffet)
      else
        redirect_to new_buffet_path
      end
    else
      redirect_to buffets_path
    end
  end
end
