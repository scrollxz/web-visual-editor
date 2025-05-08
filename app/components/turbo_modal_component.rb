# frozen_string_literal: true

class TurboModalComponent < ViewComponent::Base
  include Turbo::FramesHelper

  def initialize(title: nil, max_width_class: 'max-w-3xl', height_class: '', show_header: true)
    @title = title
    @max_width_class = max_width_class
    @height_class = height_class
    @show_header = show_header
    super
  end
end
