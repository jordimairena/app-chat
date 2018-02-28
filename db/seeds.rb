%w(users trainer admin).each do |role|
  Role.create name: role
end
User.create(primer_nombre: 'jordi', apellido: 'mairen', usuario: 'jordi', password: 'password123', email: 'jordi@email.com', role: Role.last)