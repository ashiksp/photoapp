class AlbumsController < ApplicationController
  def new
  	@album = Album.new
  end

  def create
  	@album = Album.new(album_params)
  	if @album.save
  		flash[:success] = "Album created successfully"
  		redirect_to @album
  	else
  		render :new
  	end
  end

  def show
  	@album = Album.find(params[:id])
  end

  def edit
  	@album = Album.find(params[:id])
  end

  def update
  	@album = Album.find(params[:id])
  	if @album.update(album_params)
  		flash[:success] = "Album updated successfully"
  		redirect_to @album
  	else
  		render :edit
  	end
  end

  def destroy
  	@album = Album.find(params[:id])
  	@album.destroy
  	flash[:success] = "Album deleted successfully"
  	redirect_to albums_path
  end

  def index
  	#@albums = []
  	@albums = Album.all.paginate(page: params[:page], per_page: 4)
  end

  private

  def album_params
  	params.require(:album).permit(:name, :description)
  end

end
