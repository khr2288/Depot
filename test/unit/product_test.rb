require 'test_helper'

class ProductTest < ActiveSupport::TestCase

  fixtures :products # specify which fixtures to load

  test "the truth" do
    assert true
  end

  test "invalid with empty attributes" do
    product = Product.new
    assert !product.valid?
    assert product.errors.invalid?(:title)
    assert product.errors.invalid?(:description)
    assert product.errors.invalid?(:price)
    assert product.errors.invalid?(:image_url)
  end

  test "positive price" do
    # create a new product
    product = Product.new(:title => "My Book Title" ,
                          :description => "Some description.........." ,
                          :image_url => "testimg.jpg")
    
    # set price to -1, 0, and +1 ... if model is working, first two will be invalid

    product.price = -1
    assert !product.valid? # i.e. with price as -1, product should not be valid
    assert_equal "should be at least &nbsp;0.01" , product.errors.on(:price) #verify what error msg will be displayed

    product.price = 0
    assert !product.valid?
    assert_equal "should be at least &nbsp;0.01" , product.errors.on(:price)

    product.price = 1
    assert product.valid?
  end

  test "image url" do
    ok = %w{ fred.gif fred.jpg fred.png FRED.JPG FRED.Jpg
    http://a.b.c/x/y/z/fred.gif }

    bad = %w{ fred.doc fred.gif/more fred.gif.more }

    ok.each do |name|
      product = Product.new(:title => "My Book Title" ,
                            :description => "Some description.........." ,
                            :price => 1,
                            :image_url => name)

      assert product.valid?, product.errors.full_messages
    end

    bad.each do |name|
      product = Product.new(:title => "My Book Title" ,
                            :description => "Some description.........." ,
                            :price => 1,
                            :image_url => name)

      assert !product.valid?, "saving #{name}"
    end
  end

  test "unique title" do
    product = Product.new(:title => products(:ruby_book).title,
                          :description => "Some description.........." ,
                          :price => 1,
                          :image_url => "testimg.gif")

    assert !product.save
    assert_equal "has already been taken" , product.errors.on(:title)
  end

  test "unique title1" do
    product = Product.new(:title => products(:ruby_book).title,
                          :description => "Some description.........." ,
                          :price => 1,
                          :image_url => "testimg.gif")
    assert !product.save
    assert_equal I18n.translate('activerecord.errors.messages.taken' ), product.errors.on(:title)
  end

end
