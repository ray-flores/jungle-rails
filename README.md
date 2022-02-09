# Jungle

A mini e-commerce application with Stripe payment processing API and built with Rails 4.2.

## Setup

1. Run `bundle install` to install dependencies
2. Create `config/database.yml` by copying `config/database.example.yml`
3. Create `config/secrets.yml` by copying `config/secrets.example.yml`
4. Run `bin/rake db:reset` to create, load and seed db
5. Create .env file based on .env.example
6. Sign up for a Stripe account
7. Put Stripe (test) keys into appropriate .env vars
8. Run `bin/rails s -b 0.0.0.0` to start the server

## Stripe Testing

Use Credit Card # 4111 1111 1111 1111 for testing success scenarios.

More information in their docs: <https://stripe.com/docs/testing#cards>

## Dependencies

* Rails 4.2 [Rails Guide](http://guides.rubyonrails.org/v4.2/)
* PostgreSQL 9.x
* Stripe
* Faker
* Bcrypt
* Puma

### Testing

* Capybara
* Poltergeist
* Database Cleaner

## Screenshots

Home Page

!["Home Page"](https://github.com/ray-flores/jungle-rails/blob/master/docs/home-page.png?raw=true)

Product Details 

!["Product Details"](https://github.com/ray-flores/jungle-rails/blob/master/docs/product-details-page.png?raw=true)

Admin Product Add/Delete

!["Admin Product Add/Delete"](https://github.com/ray-flores/jungle-rails/blob/master/docs/admin-add-products.png?raw=true)

My Cart 

!["My Cart"](https://github.com/ray-flores/jungle-rails/blob/master/docs/my-cart-page.png?raw=true)
