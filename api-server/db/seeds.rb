# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

## User モデル
# 管理者
User.create(user_id: SecureRandom.hex(10), age: 0, sex: 0, job: 0, area: 'none', password: 'a', artist: true, cross: true)
# 女性、アーティスト、アーティスト、すれ違い通信許可
User.create(user_id: SecureRandom.hex(10), age: 20, sex: 1, job: 0, area: '大阪府', password: 'a', artist: true, cross: true)
# 男性、学生、非アーティスト、すれ違い通信許可
User.create(user_id: SecureRandom.hex(10), age: 23, sex: 0, job: 1, area: '京都府', password: 'a', artist: false, cross: true)
# 女性、先生、非アーティスト、すれ違い通信拒否
User.create(user_id: SecureRandom.hex(10), age: 32, sex: 1, job: 2, area: '京都府', password: 'a', artist: false, cross: false)

## Music モデル
# J-Pop、イントロなし、すれ違い通信拒否
Music.create(name: '1テストミュージック1', artist: '山本くん', genre: 0, like: 54, intro: false, cross: false, path: '/home/tshimakawa', user_id: 1)
# K-Pop、イントロあり、すれ違い通信拒否
Music.create(name: '2テストミュージック2', artist: '那須くん', genre: 1, like: 39, intro: true, cross: false, path: '/home/rtomita', user_id: 1)
# クラシック、イントロあり、すれ違い通信許可
Music.create(name: '3テストミュージック3', artist: '大黒くん', genre: 2, like: 13, intro: true, cross: true, path: '/home/yhonda', user_id: 2)

## User_music モデル
UserMusic.create(user_id: 2, music_id: 2, local_path: '/home/yhonda/local')
UserMusic.create(user_id: 2, music_id: 3, local_path: '/home/yhonda/local')
UserMusic.create(user_id: 3, music_id: 1, local_path: '/home/tshimakawa/local')