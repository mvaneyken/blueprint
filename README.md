# blueprint.com

On-line, time-limited, specials. End of lot sales with limited quantities and great discounts.

# Environment

* Ruby 1.9.3
* Rails 3.2.x
* MySQL 5.x
* ImageMagick

# Getting Started

* Copy config/settings.yml to config/settings.local.yml & fill in the details
* Copy config/settings/<environment>.yml to config/settings/<environment>.local.yml & fill in the details
* Create blueprint_<environment> database

# Data load
    rake db:seed

# Interfaces

* A stripe.com account is required for payment processing. Test credit card number is "4242 4242 4242 4242", any future expiry, any CVC.

# Sign-in

Administrators:
    http:<server>/admins/sign_in

Members: 
Sign-up & sign-in via the navbar links.

# Technical Documentation
    rake doc:app

Results will be in ../app_documents/blueprint/index.html

# Authors

* Marc van Eyken
* Chris Favreau

