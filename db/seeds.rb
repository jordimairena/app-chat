%w(user trainer admin).each do |role|
  Role.create name: role
end
