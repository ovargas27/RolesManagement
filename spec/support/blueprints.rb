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
  user   { User.make }
  title  { "A Post" }
  content   { "Lorem ipsum..." }
end

Role.blueprint do
  # Attributes here
end
