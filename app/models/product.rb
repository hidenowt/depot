class Product < ActiveRecord::Base
  # scopes
  default_scope :order => 'title'
  
  # associations
  has_many :line_items
  
  # validations
  validates :title, :description, :image_url, :presence => true
  validates :price, :numericality => { :greater_than_or_equal_to => 0.01 }
  validates :title, :uniqueness   => true,
                    :length       => { 
                      :minimum => 10, 
                      :message => 'must be at least ten characters long.'
                    }
  validates :image_url, :format   => { 
      :with    => %r{\.(gif|jpg|png)$}i,
      :message => 'must be a URL for GIF, JPG or PNG image.'
    }
  
  # callbacks
  before_destroy :ensure_not_referenced_by_any_line_item
  
  private
    # ensure that there are no line items referencing this product
    def ensure_not_referenced_by_any_line_item
      if line_items.empty?
        return true
      else
        errors.add(:base, 'Line Items present')
        return false
      end
    end
end
