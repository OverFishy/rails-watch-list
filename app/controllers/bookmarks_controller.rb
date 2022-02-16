class BookmarksController < ApplicationController
  def new
    @bookmark = Bookmark.new
  end

  def create
    @bookmark = Bookmark.new(bookmark_params)
    @bookmark.list = List.find(params[:list_id])
    if @bookmark.save
      redirect_to lists_path
    else
      render :new
    end
  end

  def delete

  end

  private

  def bookmark_params
    params.require(:bookmark).permit(:comment)
  end
end
