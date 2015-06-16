require 'ffaker'

5.times do |i|
  User.create(first_name: FFaker::Name::first_name, last_name: FFaker::Name::last_name)
end
