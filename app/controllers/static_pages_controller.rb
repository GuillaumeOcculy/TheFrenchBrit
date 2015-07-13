class StaticPagesController < ApplicationController
  def home
    @pins = Pin.all.limit(5).priority
  end

  def contact
  end
end
