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
# 女性、サラリーマン、非アーティスト、すれ違い通信拒否
User.create(user_id: SecureRandom.hex(10), age: 32, sex: 1, job: 2, area: '三重県', password: 'a', artist: false, cross: true)
# 男性、学生、アーティスト、すれ違い通信許可
User.create(user_id: SecureRandom.hex(10), age: 19, sex: 0, job: 1, area: '兵庫県', password: 'a', artist: false, cross: true)

## Music モデル
# J-Pop、イントロなし、すれ違い通信許可
Music.create(name: 'トマトの唄', artist: '赤色バンド', genre: 0, like: 54, intro: false, cross: true, path: '/home/tshimakawa', user_id: 2)
# K-Pop、イントロあり、すれ違い通信許可
Music.create(name: 'パンダの唄', artist: 'パンダバンド', genre: 1, like: 39, intro: true, cross: true, path: '/home/rtomita', user_id: 2)
# クラシック、イントロあり、すれ違い通信許可
Music.create(name: 'ワールドカップの唄', artist: 'トレド', genre: 2, like: 3, intro: true, cross: true, path: '/home/yhonda', user_id: 2)
# クラシック、イントロあり、すれ違い通信拒否
Music.create(name: '健康の唄', artist: 'ボビー', genre: 2, like: 13, intro: true, cross: false, path: '/home/yhonda', user_id: 2)

## User_music モデル
UserMusic.create(user_id: 2, music_id: 2, local_path: '/home/yhonda/local')
UserMusic.create(user_id: 2, music_id: 3, local_path: '/home/yhonda/local')
UserMusic.create(user_id: 2, music_id: 4, local_path: '/home/yhonda/local')

## Live モデル
Live.create(user_id: 2, name: 'スーパーライブ', date: DateTime.now)
Live.create(user_id: 2, name: 'はんなりライブ', date: DateTime.now.tomorrow)
Live.create(user_id: 1, name: '女子限定ライブ@兵庫', date: DateTime.now.tomorrow)
Live.create(user_id: 1, name: 'Mステ', date: DateTime.now.tomorrow.tomorrow)

## User_cross_music モデル
# UserCrossMusic.create(user_id: 1, music_id: 1)
# UserCrossMusic.create(user_id: 1, music_id: 4)
# UserCrossMusic.create(user_id: 2, music_id: 2)
# UserCrossMusic.create(user_id: 2, music_id: 3)