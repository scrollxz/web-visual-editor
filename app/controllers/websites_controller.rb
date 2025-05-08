class WebsitesController < ApplicationController
  before_action :set_website, only: %i[edit update destroy show]

  def index
    @websites = Website.all
  end

  def new
    @website = Website.new
  end

  def create
    @website = Website.new website_params
    if @website.save
      redirect_to '/'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @website.update website_params
      redirect_to '/'
    else
      render :edit
    end
  end

  def destroy
    @website.destroy
    redirect_to '/'
  end

  def show; end

  private

  def website_params
    params.require(:website).permit(:name)
  end

  def set_website
    @website = Website.find(params[:id])
  end
end
