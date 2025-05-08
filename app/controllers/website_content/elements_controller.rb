module WebsiteContent
  class ElementsController < BaseController
    protect_from_forgery with: :null_session
    skip_before_action :verify_authenticity_token

    before_action :set_element, only: %i[edit update show destroy test_element]

    def new
      @element = @website.elements.new
    end

    def create
      @element = @website.elements.new element_params
      if @element.save
        redirect_to website_path(@website)
      else
        render :new
      end
    end

    def edit; end

    def update
      if @element.update element_params
        redirect_to website_path(@website)
      else
        render :edit
      end
    end

    def destroy
      @element.destroy
      redirect_to website_path(@website)
    end

    private

    def element_params
      params.require(:element).permit(:element_type, :x, :y)
    end

    def set_element
      @element = @website.elements.find(params[:element_id] || params[:id])
    end
  end
end
