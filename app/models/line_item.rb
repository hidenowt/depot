class LineItem < ActiveRecord::Base
  # associations
  belongs_to :product
  belongs_to :cart
end
