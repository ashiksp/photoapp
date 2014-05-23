class StaticPagesController < ApplicationController
  
  def home
  end

  def new
  	@album = Album.all
  	@photo = Photo.new
  end

end
