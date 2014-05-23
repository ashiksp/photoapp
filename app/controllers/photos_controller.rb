class PhotosController < ApplicationController

def create
	if params[:path] == "new"
		@album = Album.find(params[:photo][:album_id])
	else
		@album = Album.find(params[:album_id])
	end
	@photo = @album.photos.build(photo_params) 
	if @photo.save
		flash[:success] = "Photo uploaded successfully"
		redirect_to @album
	else
		render @album
	end
end

def destroy
	@photo = Photo.find(params[:id])
	@album = Album.find(params[:album_id])
	@photo.destroy
	redirect_to @album
end

def new
	@photo = Photo.new
end

private

def photo_params
	params.require(:photo).permit(:caption, :description, :pic)
end

end
