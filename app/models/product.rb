class Product < ActiveRecord::Base
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
end
