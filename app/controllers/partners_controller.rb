class PartnersController < ApplicationController
  before_action :find_partner, only: [:show, :edit, :update, :destroy]

  def index
    @partners = Partner.priority
  end

  def show
  end

  def new
    @partner = Partner.new
  end

  def create
    @partner = Partner.new(partner_params)
    if @partner.save
      redirect_to @partner
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @partner.update(partner_params)
      redirect_to @partner
    else
      render :edit
    end
  end

  def destroy
    @partner.destroy
    redirect_to root_path
  end

  private

  def find_partner
    @partner = Partner.friendly.find(params[:id])
  end

  def partner_params
    params.require(:partner).permit!
  end
end
