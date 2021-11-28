# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

5.times do
    Proprietario.create({
        nome: Faker::Name.name,
        bloco: Faker::Number.number(digits: 2),
        apartamento: Faker::Number.number(digits: 3),
        morador: Faker::Boolean.boolean
    }) 
end

5.times do
    Veiculo.create({
        proprietario_id: Faker::Number.between(from: 1, to: 5),
        placa: Faker::Vehicle.license_plate,
        cor: Faker::Vehicle.color,
        modelo: Faker::Vehicle.make_and_model
    })
end

5.times do
    HistoricoEntradaSaida.create({
        veiculo_id: Faker::Number.between(from: 1, to: 5),
        dataEntrada: DateTime.now(),
        isEntrada: Faker::Boolean.boolean
    })
end

5.times do
    MovimentacaoVeiculo.create({
        historico_entrada_saidas_id: Faker::Number.between(from: 1, to: 1)
    })
end
