class BookmarksController < ApplicationController
  # before_action :set_movie
  before_action :set_list, only: ["new", "create"]
  before_action :set_bookmark, only: ["destroy"]

  def new
    @bookmark = Bookmark.new
  end

  def create
    # @bookmark.movie_id = params[:movie_id]
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list_id = params[:list_id]
    if @bookmark.save
      redirect_to list_path(@list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @bookmark.destroy

    redirect_to @bookmark.list
  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment, :movie_id)
  end

  def set_list
    @list = List.find(params[:list_id])
  end

  def set_bookmark
    @bookmark = Bookmark.find(params[:id])
  end

end
