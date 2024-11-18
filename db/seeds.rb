# frozen_string_literal: true

if User.count.zero?
  user = User.create(
    username: 'admin',
    email: 'admin@gmail.com',
    password: 'password'
  )
  user.add_role :admin
end

if Category.count.zero?
  %w[ทั่วไป อาหาร ช๊อปปิ้ง].each do |name|
    Category.create(name: name)
  end
end
