Tweet.destroy_all
User.destroy_all

t1 = Tweet.create(:content => 'Leadership spill will be held on Tuesday')
t2 = Tweet.create(:content => 'First project is super stressful')
t3 = Tweet.create(:content => 'Pop music is the best')

u1  = User.create(:name => 'Amy', :password => 'chicken', :password_confirmation => 'chicken')
u2  = User.create(:name => 'Julia', :password => 'chicken', :password_confirmation => 'chicken')
u3  = User.create(:name => 'Liam', :password => 'chicken', :password_confirmation => 'chicken')
admin = User.create(:name => 'admin', :password => 'chicken', :password_confirmation => 'chicken')

#associate tweets and users
t1.user = u1
t1.save
t2.user = u2
t2.save
t3.user = u3
t3.save



# #associate songs and genres
# #appending here because genres is an array
# s1.genres << g1
# s2.genres << g2
# s3.genres << g3

# #associate songs and albums
# s1.album = a1
# s1.save
# s2.album = a2
# s2.save
# s3.album = a3
# s3.save

# #associate songs and mixtapes
# m1.songs = [s1, s2, s3]
# m1.save
# m2.songs = [s1, s2]
# m2.save
# m3.songs = [s2]
# m3.save

# #associate mixtapes and users
# m1.user = u3
# m1.save
# m2.user = u1
# m2.save
# m3.user = u2
# m3.save


# u1  = User.create(:name => 'Amy', :password => 'chicken', :password_confirmation => 'chicken')
# u2  = User.create(:name => 'Julia', :password => 'chicken', :password_confirmation => 'chicken')
# u3  = User.create(:name => 'Liam', :password => 'chicken', :password_confirmation => 'chicken')
# admin = User.create(:name => 'admin', :password => 'admin', :password_confirmation => 'admin', :is_admin => true)


# user_one = User.create(...)
# Tweet.create(user_id: user_one.id)