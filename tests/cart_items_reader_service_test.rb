require 'minitest/autorun'
require 'mocha/minitest'

require_relative '../services/cart_items_reader_service.rb'

class CartItemsReaderServiceTest < Minitest::Test
  def mock_file(file_name, lines_to_read)
    file_mock = mock()
    file_mock.stubs(:each_line).multiple_yields(*lines_to_read)
    File.stubs(:open).with(file_name, "r").yields(file_mock)
  end

  def test_input_1
    file_name = 'input1_test.txt'
    file_content =  ["2 book at 12.49\n", "1 music CD at 14.99\n", "1 chocolate bar at 0.85"]    
    result = "2 book: 24.98\n" \
             "1 music CD: 16.49\n" \
             "1 chocolate bar: 0.85\n" \
             "Sales Taxes: 1.50\n" \
             "Total: 42.32" 
    
    mock_file(file_name, file_content)

    cart_items1 = CartItemsReaderService.call(file_name)
    receipt = cart_items1.generate_receipt

    assert_equal result, receipt
  end

  def test_input_2
    file_name = 'input2_test.txt'
    file_content =  ["1 imported box of chocolates at 10.00\n", "1 imported bottle of perfume at 47.50"]    
    result = "1 imported box of chocolates: 10.50\n" \
             "1 imported bottle of perfume: 54.65\n" \
             "Sales Taxes: 7.65\n" \
             "Total: 65.15" 
    
    mock_file(file_name, file_content)

    cart_items2 = CartItemsReaderService.call(file_name)
    receipt = cart_items2.generate_receipt

    assert_equal result, receipt
  end

  def test_input_3
    file_name = 'input3_test.txt'
    file_content =  ["1 imported bottle of perfume at 27.99\n", "1 bottle of perfume at 18.99\n", "1 packet of headache pills at 9.75\n", "3 imported boxes of chocolates at 11.25"]    
    result = "1 imported bottle of perfume: 32.19\n" \
             "1 bottle of perfume: 20.89\n" \
             "1 packet of headache pills: 9.75\n" \
             "3 imported boxes of chocolates: 35.55\n" \
             "Sales Taxes: 7.90\n" \
             "Total: 98.38" 
    
    mock_file(file_name, file_content)

    cart_items3 = CartItemsReaderService.call(file_name)
    receipt = cart_items3.generate_receipt

    assert_equal result, receipt
  end
end