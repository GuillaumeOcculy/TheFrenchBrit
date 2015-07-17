class StaticPagesController < ApplicationController
  def home
    @pins = Pin.limit(6).priority
    @partners = Partner.limit(5).priority
    @setting = Setting.first
  end


  def studio
    @setting = Setting.first
  end
end
