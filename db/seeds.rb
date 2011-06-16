# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

user = User.create( 
  :username               => 'admin',
  :first_name             => 'admin', 
  :last_name              => 'admin',  
  :admin                  => true,
  :email                  => 'tudorblink@gmail.com', 
  :password               => 'password', 
  :password_confirmation  => 'password', 
).confirm! 
