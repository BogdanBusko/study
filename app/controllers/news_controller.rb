class NewsController < ApplicationController
  def index
    @news = News.all.paginate(page: params[:page], per_page: 5)
  end

  def show
    @news = News.find(params[:id])
  end
end
