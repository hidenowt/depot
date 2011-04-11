class AddProductPriceToLineItem < ActiveRecord::Migration
  def self.up
    add_column :line_items, :price, :decimal, :precision => 8, :scale => 2
    
    say_with_time "Updating prices..." do
      LineItem.all.each do |line_item|
        line_item.update_attribute :price, line_item.product.price
      end
    end
  end

  def self.down
    remove_column :line_items, :price
  end
end
