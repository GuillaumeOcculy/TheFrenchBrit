class StaticPagesController < ApplicationController
  def home
    @pins = Pin.limit(6).priority
    @partners = Partner.limit(5).priority
  end


  def studio
  end
end
