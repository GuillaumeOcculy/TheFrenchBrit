class PinsController < ApplicationController

  before_action :find_pin, only: [:show, :edit, :update, :destroy]

  def index
    @pins = Pin.all
  end

  def show
  end

  def new
    @pin = current_user.pins.build
  end

  def create
    @pin = current_user.pins.build(pin_params)
    if @pin.save
      redirect_to @pin, flash: {success: 'Pin created !'}
    else
      render :new
      flash[:danger] = 'Pin has not been created !'
    end
  end

  def edit
  end

  def update
    if @pin.update(pin_params)
      redirect_to @pin, flash: {success: 'Pin updated !'}
    else
      render :edit
      flash[:danger] = 'Pin has not been updated !'
    end
  end

  def destroy
    @pin.destroy
    redirect_to root_path, flash: {notice: 'Pin has been deleted !'}
  end

  private

  def find_pin
    @pin = Pin.friendly.find(params[:id])
  end

  def pin_params
    params.require(:pin).permit!
  end
end
