
%w(user trainer admin).each do |role|
  Role.create name: role
end

# create admin user
User.create(primer_nombre: 'jordi', apellido: 'mairena', usuario: 'jordi123', password: '123123',
            email: 'jordi@email.com', role: Role.last)

# create normal user
10.times do
  primer_nombre = Faker::Name.primer_nombre
  apellido  = Faker::Name.apellido
  user_name  = "#{primer_nombre.downcase}_#{apellido.downcase}"
  email      = "#{primer_nombre}.#{apellido}@hotmail.com"
  User.create(primer_nombre: primer_nombre, apellido: apellido, usuario: user_name, password: 'abc123',
              email: email, role: Role.user)
end

# create trainer
10.times do
  primer_nombre = Faker::Name.primer_nombre
  apellido  = Faker::Name.apellido
  user_name  = "#{primer_nombre.downcase}_#{apellido.downcase}"
  email      = "#{primer_nombre}.#{apellido}@hotmail.com"
  User.create(primer_nombre: primer_nombre, apellido: apellido, usuario: user_name, password: 'abc123',
              email: email, role: Role.trainer)
end