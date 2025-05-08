class Element < ApplicationRecord
  belongs_to :website

  str_enum :element_type, %i[string image div]
end
