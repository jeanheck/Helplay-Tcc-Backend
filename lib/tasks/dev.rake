namespace :dev do
  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do

    # puts "Cadastrando os Esportes e as caracteristicas"
    #
    # #Futebol
    # esporte = Esporte.create!(
    #   nome: "Futebol"
    # )
    # caracteristicas = %w(Goleiro Atacante Zagueiro Rápido Forte)
    # caracteristicas.each do |caracteristica|
    #   Caracteristica.create!(
    #     descricao: caracteristica, esporte: esporte, inseridaPeloUsuario: false
    #   )
    # end
    #
    # #Volei
    # esporte = Esporte.create!(
    #   nome: "Volei"
    # )
    # caracteristicas = %w(Alto Agil Forte)
    # caracteristicas.each do |caracteristica|
    #   Caracteristica.create!(
    #     descricao: caracteristica, esporte: esporte
    #   )
    # end
    #
    # #Handebol
    # esporte = Esporte.create!(
    #   nome: "Handebol"
    # )
    # caracteristicas = %w(Estratégico Passe Goleiro)
    # caracteristicas.each do |caracteristica|
    #   Caracteristica.create!(
    #     descricao: caracteristica, esporte: esporte
    #   )
    # end
    #
    # #Basquete
    # esporte = Esporte.create!(
    #   nome: "Basquete"
    # )
    # caracteristicas = %w(Alto Forte Distância)
    # caracteristicas.each do |caracteristica|
    #   Caracteristica.create!(
    #     descricao: caracteristica, esporte: esporte
    #   )
    # end
    #
    # #Corrida
    # esporte = Esporte.create!(
    #   nome: "Corrida"
    # )
    # caracteristicas = %w(Rapidissimo Saltos Africano)
    # caracteristicas.each do |caracteristica|
    #   Caracteristica.create!(
    #     descricao: caracteristica, esporte: esporte
    #   )
    # end
    #
    # puts "Esportes e as caracteristicas cadastrados com sucesso"

    @Individualidades = Individualidade.all

    @Individualidades.each do |individualidade|
      individualidade.delete
    end

    @atividades = Atividade.all

    @atividades.each do |atividade|
      atividade.delete
    end

    # puts "Cadastrando os usuarios"
    #
    # 100.times do |i|
    #   usuario = Usuario.create!(
    #     nome: Faker::Name.name,
    #     dataNascimento: Faker::Date.between(35.years.ago, 18.years.ago),
    #     sexo: (i % 2 == 0 ? "M" : "F")
    #   )
    #
    #   atividade = Atividade.create!(
    #      esporte: Esporte.find(rand(1..5)),
    #      usuario: usuario
    #   )
    #
    #   #Individualidade.create!(atividade: atividade, caracteristica: Caracteristica.find(rand(1..17)).descricao)
    #   Individualidade.create!(atividade: atividade, caracteristica_id: Caracteristica.find(rand(1..17)).id)
    # end
    #
    # puts "Usuarios cadastrados com sucesso"
    #
    # puts "Cadastrando os amigos"
    #
    # Usuario.all.each do |usuarioUm|
    #   10.times do |i|
    #     usuarioDois = Usuario.find(rand(1..100))
    #
    #     Amigo.create!(usuarioUm: usuarioUm, usuarioDois: usuarioDois)
    #   end
    #
    #   2.times do |i|
    #     evento = Evento.create!(
    #       descricao: Faker::FunnyName.name,
    #       local: Faker::Space.planet,
    #       dataHora: Faker::Time.between(2.days.ago, Date.today, :all),
    #       informacoes: Faker::Internet.email,
    #       publico: (i == 1 ? true : false),
    #       usuario: usuarioUm
    #     )
    #
    #     10.times do |i|
    #       Participante.create!(
    #         evento: evento,
    #         usuario: Usuario.find(rand(1..100))
    #       )
    #     end
    #   end
    # end
    #
    # puts "Amigos cadastrados com sucesso"

  end
end
