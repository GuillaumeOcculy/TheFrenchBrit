class StaticPagesController < ApplicationController
  def home
    @pins_ads = Pin.ads.limit(3)
    @pins_cinemas = Pin.cinemas.limit(3)
    @partners = Partner.limit(5).priority
  end


  def studio
  end
end
