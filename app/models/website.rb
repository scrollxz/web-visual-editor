class Website < ApplicationRecord
  has_many :elements, dependent: :destroy
end
