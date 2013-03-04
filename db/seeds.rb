# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.delete_all
Tweet.delete_all
Hashtag.delete_all

gm = User.create( :username => 'gabrielmar', :password => 'x', :password_confirmation => 'x')
cd = User.create( :username => 'charlesd', :password => 'x', :password_confirmation => 'x')
jh = User.create( :username => 'josephheller', :password => 'x', :password_confirmation => 'x')

tweet1 = Tweet.create( :content => 'Many years later, as he faced the firing squad, Colonel #Aureliano Buendia was to remember that distant afternoon when his father took him to discover ice. ')
tweet2 = Tweet.create( :content => 'It was #thebestoftimes, it was the worst of times, it was the age of wisdom, it was the age of foolishness, it was the epoch of belief, it was the epoch of incredulity, it was the season of Light, it was the season of Darkness, it was the spring of hope, it was the winter of despair. ')
tweet3 = Tweet.create( :content => 'It was love #atfirstsight. ')

hashtag1 = Hashtag.create( :name => '#aureliano' )
hashtag2 = Hashtag.create( :name => '#thebestoftimes' )
hashtag3 = Hashtag.create( :name => '#atfirstsight' )

hashtag1.tweets << tweet1
hashtag2.tweets << tweet2
hashtag3.tweets << tweet3

gm.tweets << tweet1
cd.tweets << tweet2
jh.tweets << tweet3