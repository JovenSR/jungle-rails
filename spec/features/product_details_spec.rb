require 'rails_helper'

RSpec.feature "Navigate from home page to poduct details page", type: :feature, js: true do

  # SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name:  Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
    @product = Product.first
  end

  scenario "They see product details" do
    # ACT
    visit root_path

    first('article.product').find_link('Details').click

    puts product_path(@product.id)
    visit product_path(@product.id)

    # DEBUG
    save_screenshot

    # VERIFY
    expect(page).to have_css 'article.product-detail'
  end
end
