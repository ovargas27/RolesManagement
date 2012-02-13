require 'machinist/active_record'

# Add your blueprints here.
#
# e.g.
#   Post.blueprint do
#     title { "Post #{sn}" }
#     body  { "Lorem ipsum..." }
#   end

User.blueprint do
  email { 'test@example.com'}
  password { '123456' }
  password_confirmation { '123456' }
end

Post.blueprint do
  title  { "A Post" }
  body   { "Lorem ipsum..." }
end
