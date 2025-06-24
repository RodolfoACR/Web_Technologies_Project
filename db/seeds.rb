
SavedPost.delete_all
Follow.delete_all
Like.delete_all
Comment.delete_all
PostHashtag.delete_all
Hashtag.delete_all
Post.delete_all
Profile.delete_all
User.delete_all

ActiveRecord::Base.connection.reset_pk_sequence!('users')
ActiveRecord::Base.connection.reset_pk_sequence!('profiles')
ActiveRecord::Base.connection.reset_pk_sequence!('posts')
ActiveRecord::Base.connection.reset_pk_sequence!('hashtags')
ActiveRecord::Base.connection.reset_pk_sequence!('comments')
ActiveRecord::Base.connection.reset_pk_sequence!('likes')
ActiveRecord::Base.connection.reset_pk_sequence!('saved_posts')

users = []
5.times do
  user = User.new(
    email: Faker::Internet.email,
    password: '123456'
  )

  user.build_profile(
    username: Faker::Internet.unique.username,
    avatar_url: Faker::Avatar.image,
    bio: Faker::Company.catch_phrase
  )

  user.save!
  users << user
end

admin = User.create!(
  email: "admin@admin.com",
  password: "admin123",
  admin: true
)
admin.create_profile!(
  username: "adminuser",
  bio: "Administrador del sistema"
)


posts = []
10.times do
  posts << Post.create!(
    profile: users.sample.profile,
    image_url: "https://picsum.photos/seed/#{rand(1000)}/400/300",
    description: Faker::Lorem.sentence(word_count: 10)
  )
end


5.times do
  tag = Faker::Marketing.buzzwords.split(' ').first.downcase
  hashtag = Hashtag.create!(tag: tag)

  posts.sample(3).each do |post|
    post.hashtags << hashtag unless post.hashtags.include?(hashtag)
  end
end

10.times do
  Comment.create!(
    post: posts.sample,
    profile: users.sample.profile,
    body: Faker::TvShows::GameOfThrones.quote
  )
end


10.times do
  Like.create!(
    profile: users.sample.profile,
    likeable: posts.sample
  )
end


5.times do
  user = users.sample
  user.reload 
  raise "User has no profile!" unless user.profile

  SavedPost.create!(user: user, post: posts.sample)
end

profiles = users.map(&:profile)
profiles.combination(2).to_a.sample(5).each do |a, b|
  Follow.create!(follower: a, followed: b)
end