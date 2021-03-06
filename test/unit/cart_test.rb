require 'test_helper'

class CartTest < ActiveSupport::TestCase

  fixtures :products # specify which fixtures to load

  def setup
    @cart = Cart.new
    @rails = products(:rails_book)
    @ruby = products(:ruby_book)
  end

  def test_add_unique_products
    @cart.add_product @rails
    @cart.add_product @ruby
    assert_equal 2, @cart.items.size
    assert_equal @rails.price + @ruby.price, @cart.total_price
  end

  def test_add_duplicate_product
    @cart.add_product @rails
    @cart.add_product @rails
    assert_equal 1, @cart.items.size
    assert_equal 2, @cart.items[0].quantity
    assert_equal 2*@rails.price, @cart.total_price
  end

end