![Let's Build](https://i.imgur.com/kGYNrNG.jpg)

# Let's Build: With Ruby on Rails - A Book Library App with Stripe Subscription Payments

Welcome to my **eleventh** Let's Build series featuring Ruby on Rails. This installment, once again, focuses on accepting payments using Ruby on Rails as a web application framework. We partner Ruby on Rails with Stripe to create a subscription based SaaS model for a book library application.

### What's new in this build?

- Rails 5.2 makes an appearance 
- We use [ActiveStorage](http://edgeguides.rubyonrails.org/active_storage_overview.html) which comes new with Rails 5.2. No longer do we require third-party gems like PaperClip or Carrierwave. 
- New encrypted secrets which make managing any environment variables or keys way easier. You can commit these to version control without fear thanks to the encrypted quality
- [Stripe Billing](https://stripe.com/billing) - Stripe recently released a new model around their subscription products. Within Stripe Billing you can define overlying products which have associated plans. It's a nicer way to bundle whatever it is you sell but still be able to sell things in different manners i.e. Flat rates, Multiple Plans, Per seat, Usage-based, and Flat rate + overage.

### The Book Library application

The application is a simple book application that allows a user to add and remove books from their library. These books can be downloaded for reading once a user is subscribed. Accessing a library is only possible if a user is subscribed. This app differs than previous apps where a user must pay before making an account. 

A user is presented with buttons for adding a book to their library. As you can guess, to do this action a user first needs an account. Upon clicking the "add to library" button a public facing user (someone with no account) is redirected to a signup page of which we implement using the [Devise](https://github.com/plataformatec/devise) gem. 

A nice callback function from Devise allows us to redirect a user upon successfully signing up. In this case, we redirect a user to a pricing page which features three plans to choose from. Each plan has its own parameters associated with it. Upon clicking the "subscribe" button on any of the tiers, the user is redirected to a payment page carrying over the necessary parameters to hook into Stripe with. 

What seems like a simple app carries some logic and weight to cover all our tracks. The application is far from complete but you can, however, extend this to be much more however you like. 

I ran out of time but one obvious area to extend this app is to save what plan a user has subscribed to. This can be done at the time they create a subscription. From there you can query different places in your app to show and hide specific features based on their plan type. 


### Downloading and running the demo app
Clone or download the files. `cd` into the project and run `bundle install`. From there you can run `rails db:migrate` and finally `rails s` to boot the server.

The add your own credentials you need to run

```
bin/rails credentials:edit
```

top be able to access the credients file make sure your `config/master.key` file is filled with this key:

```
2bd890bb50c217270605d568943688e3
```

This app currently has no valid stripe api and plan keys so you will need to create and add your own using the command above.

#### Models and Relationships

Our app features just three models. At all times we access books and users through a library model. This ends up being a `many-to-many` association. 


[Continue reading on web-crunch.com (to see all videos and code)](https://web-crunch.com/lets-build-ruby-on-rails-book-library-stripe-subscription-payments)

