class CastingsController < ApplicationController

  before_action :find_casting, only: [:show, :edit, :update, :destroy]
  before_action :require_user, except: [:index, :show]

  def index
    @castings_ads = Casting.ads
    @castings_cinemas = Casting.cinemas
  end

  def show
    set_meta_title({ title: @casting.title })
    set_meta_description({ description: @casting.description}) if @casting.description
  end

  def new
    @casting = current_user.castings.build
  end

  def create
    @casting = current_user.castings.build(casting_params)
    if @casting.save
      redirect_to @casting, flash: {success: 'Casting created !'}
    else
      render :new
      flash[:warning] = 'Casting has not been created !'
    end
  end

  def edit
  end

  def update
    if @casting.update(casting_params)
      redirect_to @casting, flash: {success: 'Casting updated !'}
    else
      render :edit
      flash[:warning] = 'Casting has not been updated !'
    end
  end

  def destroy
    @casting.destroy
    redirect_to root_path, flash: {notice: 'Casting has been deleted !'}
  end

  private

  def find_casting
    @casting = Casting.friendly.find(params[:id])
  end

  def casting_params
    params.require(:casting).permit!
  end
end
