require_relative 'base_service.rb'
require_relative '../classes/item.rb'
require_relative '../classes/cart_items.rb'

class CartItemsReaderService < BaseService
    def initialize(file_name)
        @file_name = file_name
    end

    def call
      cart_items = CartItems.new
      File.open(@file_name, "r") do |file|
        file.each_line do |line|
          item = convert_line_to_item(line)
          cart_items.add_item(item)
        end
      end
      cart_items
    rescue
      CartItems.new
    end

    private

    def convert_line_to_item(line)
      pattern = /(\d+) (imported )?(.*?) at (\d+\.\d+)/

      match_data = line.match(pattern)
      name = match_data[3]
      exempt = %w[book chocolate pills].any? { |product_type| name.include?(product_type) }

      Item.new(quantity: match_data[1].to_i,
               imported: !match_data[2].nil?,
               name: name,
               price: match_data[4].to_f,
               exempt: exempt)
    end
end