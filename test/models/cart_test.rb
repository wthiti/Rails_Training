require 'test_helper'

class CartTest < ActiveSupport::TestCase
  test "should copy product price to line item" do
    cart = Cart.create
    product = Product.new(id:999, title: "My Book Title", description: "yyy", price: 1.00, image_url: "fred.gif")
    line_item = cart.add_product(product)
    assert_equal 1.00, line_item.price
    product.save!
    line_item.save!

    line_item = cart.add_product(product)
    assert_equal 2, line_item.quantity
    assert_equal 2.00, line_item.price.to_f
  end
end
