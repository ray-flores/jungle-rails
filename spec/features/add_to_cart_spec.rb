require 'rails_helper'

RSpec.feature "Visitor navigates to home page", type: :feature, js: true do
  #SETUP
  before :each do
    @category = Category.create! name: 'Apparel'

    10.times do |n|
      @category.products.create!(
        name: Faker::Hipster.sentence(3),
        description: Faker::Hipster.paragraph(4),
        image: open_asset('apparel1.jpg'),
        quantity: 10,
        price: 64.99
      )
    end
  end

  scenario "They add a product and increase the cart by one" do
    # ACT
    visit root_path
    first(".btn.btn-primary").click

    # DEBUG 
    puts page.html
    save_screenshot
    #save_and_open_screenshot

    # VERIFY
    expect(page).to have_content 'My Cart (1)'
  end
end
