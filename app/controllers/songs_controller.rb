class SongsController < ApplicationController
  def index
    session[:hit_counter] ||= 0
    session[:hit_counter] += 1
    @songs = current_user.songs.all #Song.all replace with: @ songs = current_user.songs.all to associate to a specidfic user
  end

  def show
    @song = current_user.songs.find(params[:id]) #Song.find(params[:id]) replace with: @ songs = current_user.songs.find(params[:id])
  end

  def new
    @song = current_user.songs.new #Song.new
  end

  def create
    @song = current_user.songs.new(song_params) #Song.new(song_params)
    if @song.save
      flash[:notice] = "Song successfully created"
      redirect_to song_path(@song)
    else
      flash[:errors] = @song.errors.full_messages.join(', ')
      render :new
    end
  end

  def edit
    @song = current_user.songs.find(params[:id]) #Song.find(params[:id])
  end

  def update
    @song = current_user.songs.find(params[:id]) #Song.find(params[:id])
    if @song.update(song_params)
      redirect_to song_path(@song)
    else
      render :edit
    end
  end

  def destroy
    @song = current_user.songs.find(params[:id]) #Song.find(params[:id])
    @song.destroy
    redirect_to songs_path
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist)
  end
end
