# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
@user = User.new
@user.name = 'Test User'
@user.email = 'test@mail.com'
@user.password = 'test1234'
@user.save

@corporation = Corporation.new
@corporation.name = '株式会社A'
@corporation.save

@corporation = Corporation.new
@corporation.name = 'B株式会社'
@corporation.save

@job = Job.new
@job.corporation_id = 1
@job.title = 'フロントエンドエンジニア募集！'
@job.description = 'あんなことや、こんなことをするお仕事です。こんなことができる人が欲しいです。'
@job.save

@job = Job.new
@job.corporation_id = 2
@job.title = 'バックエンドエンジニア募集！'
@job.description = 'あんなことや、こんなことをするお仕事です。こんなことができる人が欲しいです。'
@job.save

@job = Job.new
@job.corporation_id = 1
@job.title = 'QAエンジニア募集！'
@job.description = 'あんなことや、こんなことをするお仕事です。こんなことができる人が欲しいです。'
@job.save

@user_like = UserLike.new
@user_like.job_id = 1
@user_like.user_id = 1
@user_like.save

@job_likes = JobLike.new
@job_likes.user_id = 1
@job_likes.job_id = 3
@job_likes.save

@corporation_admin = CorporationAdmin.new
@corporation_admin.corporation_id = 1
@corporation_admin.name = 'Test CorpAdmin'
@corporation_admin.email = 'corp@admin.com'
@corporation_admin.password = 'test1234'
@corporation_admin.save
