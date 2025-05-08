class ElementsController < ApplicationController
  def update
    @element = Element.find(params[:element_id] || params[:id])

    @element.update element_params
  end

  private

  def element_params
    params.require(:element).permit(:type, :x, :y)
  end
end