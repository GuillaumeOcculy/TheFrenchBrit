class StaticPagesController < ApplicationController
  def home
    @castings_ads = Casting.ads.limit(3)
    @castings_cinemas = Casting.cinemas.limit(3)
    @partners = Partner.limit(5).priority
  end


  def studio
  end
end
