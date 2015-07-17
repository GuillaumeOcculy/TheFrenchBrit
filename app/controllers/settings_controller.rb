class SettingsController < ApplicationController

  before_action :require_user

  def edit
    @setting = Setting.first
  end

  def update
    @setting = Setting.first
    if @setting.update(setting_params)
      redirect_to settings_path, flash: {success: 'Setting has been updated !'}
    else
      render :edit
      flash[:warning] = 'Setting has not been updated !'
    end
  end

  private

  def setting_params
    params.require(:setting).permit!
  end
end
