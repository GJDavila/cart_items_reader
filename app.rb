require_relative 'services/cart_items_reader_service.rb'

cart_items1 = CartItemsReaderService.call('inputs/input1.txt')
puts cart_items1.generate_receipt
puts " "
cart_items2 = CartItemsReaderService.call('inputs/input2.txt')
puts cart_items2.generate_receipt
puts " "
cart_items3 = CartItemsReaderService.call('inputs/input3.txt')
puts cart_items3.generate_receipt
