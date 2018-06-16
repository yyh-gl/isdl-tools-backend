# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# 女性、アーティスト、アーティスト、すれ違い通信許可
User.create(user_id: SecureRandom.hex(10), age: 20, sex: 1, job: 0, area: '大阪府', password: 'a', artist: true, cross: true)

# 男性、学生、非アーティスト、すれ違い通信許可
User.create(user_id: SecureRandom.hex(10), age: 23, sex: 0, job: 1, area: '京都府', password: 'a', artist: false, cross: true)

# 女性、先生、非アーティスト、すれ違い通信拒否
User.create(user_id: SecureRandom.hex(10), age: 32, sex: 1, job: 2, area: '京都府', password: 'a', artist: false, cross: false)

