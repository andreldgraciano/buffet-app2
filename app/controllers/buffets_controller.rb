class BuffetsController < ApplicationController
  before_action :set_buffet, only: [:show, :edit, :update]
  before_action :allowed_only_for_own_buffet_profile, only: [:show, :edit, :update]
  before_action :not_allowed_for_buffet_profiles, only: [:index]
  before_action :block_for_unregistered_buffets, only: [:index, :show, :edit, :update]

  def index
    @buffets = Buffet.all
  end

  def show; end

  def new
    @buffet = Buffet.new
  end

  def create
    if Buffet.exists?(buffet_profile_id: current_buffet_profile.id)
      return redirect_to home_buffet_profile_path, alert: 'You have already registered your buffet'
    end

    @buffet = Buffet.new(buffet_params)
    @buffet.email = current_buffet_profile.email
    @buffet.buffet_profile = current_buffet_profile

    if @buffet.save
      redirect_to @buffet, notice: 'Buffet registered successfully'
    else
      flash.now[:notice] = 'Buffet not registered'
      render :new
    end
  end

  def edit; end

  def update
    if @buffet.update(buffet_params)
      redirect_to @buffet, notice: 'Buffet edited successfully'
    else
      flash.now[:notice] = 'Buffet not edited'
      render :new
    end
  end

  private

  def set_buffet
    @buffet = Buffet.find_by(id: params[:id])
    if !@buffet
      return redirect_to root_path, notice: 'There is no buffet with this index'
    end
  end


  def buffet_params
    params.require(:buffet).permit(:brand_name, :corporation_name, :description, :cnpj, :phone, :address, :email, :district, :state, :city, :cep, payment_ids: [])
  end

  def allowed_only_for_own_buffet_profile
    if current_buffet_profile && @buffet != current_buffet_profile.buffet
      redirect_to buffet_path(current_buffet_profile.buffet), notice: 'Buffet profiles  can only access their own buffet'
    end
  end

  def not_allowed_for_buffet_profiles
    if current_buffet_profile
      redirect_to buffet_path(current_buffet_profile.buffet), notice: 'Buffet profiles  can only access their own buffet'
    end
  end

  def block_for_unregistered_buffets
    if current_buffet_profile && !current_buffet_profile.buffet
      return redirect_to root_path, notice: 'Register your buffet'
    end
  end
end
