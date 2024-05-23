class BuffetsController < ApplicationController
  def index

  end

  def show
    @buffet = Buffet.find(params[:id])
  end

  def new
    @buffet = Buffet.new
  end

  def create
    @buffet = Buffet.new(buffet_params)
    @buffet.email = current_buffet_profile.email
    @buffet.buffet_profile = current_buffet_profile
    if @buffet.save
      redirect_to @buffet, notice: 'Buffet criado com sucesso'
    else
      render :new
    end
  end

  def edit
    @buffet = Buffet.find(params[:id])
  end

  def update
    @buffet = Buffet.find(params[:id])
    if @buffet.update(buffet_params)
      redirect_to @buffet, notice: 'Buffet editado com sucesso'
    else
      render :new
    end
  end

  private


  def buffet_params
    params.require(:buffet).permit(:brand_name, :corporation_name, :description, :cnpj, :phone, :address, :email, :district, :state, :city, :cep, payment_ids: [])
  end

end
