# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

s1 = Spot.create(name: "Sala 01", governance: "Governo do estado do Ceará", lat: "1524", long: "123", status: 0)
s2 = Spot.create(name: "Sala 02", governance: "Governo do estado do Ceará", lat: "1524", long: "123", status: 0)
s3 = Spot.create(name: "Salão de jogos", governance: "Governo do estado do Ceará", lat: "1524", long: "123", status: 0)

t1 = Task.create(name: "Varrer o chão", description: "Varrer o chão com vassoura")
t2 = Task.create(name: "Passar pano no chão", description: "Lavar e passar um pano úmido em todo o chão")
t3 = Task.create(name: "Limpar vidraça", description: "Limpar vidraça com um pano úmido")
t4 = Task.create(name: "Organizar jogos", description: "Guardar todos os jogos em suas respectivas gavetas")

# TaskHasSpot
s1.tasks << [t1, t2, t3]
s2.tasks << [t1]
s3.tasks << [t1, t2, t3, t4]

# Detail
# Detail.create(task_has_spot_id: 1, description: "obs1")
# Detail.create(task_has_spot_id: 1, description: "obs2")
# Detail.create(task_has_spot_id: 2, description: "obs3")

# s.task_has_spot[0].details.last
 Admin.create(email: "davimelovasc@gmail.com", password: "12345678")
