# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

class CoreData

  def self.create_users
    User.create(email: "admin@blueprint.com", password: "password", password_confirmation: "password")
  end

end

require 'factory_girl_rails'
class TestData

  def self.create_products
      
  end

end

CoreData.create_users