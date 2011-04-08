class Cart < ActiveRecord::Base
  # associations
  has_many :line_items, :dependent => :destroy
end
