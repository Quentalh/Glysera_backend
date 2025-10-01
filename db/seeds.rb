# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Limpando o banco de dados..."
Endereco.destroy_all
Usuario.destroy_all
puts "Banco de dados limpo."

# Criando 10 usuários
puts "Criando usuários..."
usuarios = Usuario.create!([
  { nome: 'Ana Silva', email: 'ana.silva@email.com' },
  { nome: 'Breno Lobo', email: 'breno.lobo@email.com' },
  { nome: 'Carla Dias', email: 'carla.dias@email.com' },
  { nome: 'Daniel Mendes', email: 'daniel.mendes@email.com' },
  { nome: 'Eduardo Costa', email: 'eduardo.costa@email.com' },
  { nome: 'Fernanda Lima', email: 'fernanda.lima@email.com' },
  { nome: 'Gustavo Borges', email: 'gustavo.borges@email.com' },
  { nome: 'Helena Souza', email: 'helena.souza@email.com' },
  { nome: 'Igor Almeida', email: 'igor.almeida@email.com' },
  { nome: 'Juliana Pereira', email: 'juliana.pereira@email.com' }
])
puts "Usuários criados com sucesso!"

# Criando endereços e associando-os aos usuários
puts "Criando endereços..."
Endereco.create!([
  # Endereços para Ana Silva (ID 1)
  { rua: 'Rua das Flores, 123', cidade: 'São Paulo', cep: '01000-001', usuario: usuarios[0] },
  { rua: 'Avenida Paulista, 1500', cidade: 'São Paulo', cep: '01310-200', usuario: usuarios[0] },

  # Endereço para Breno Lobo (ID 2)
  { rua: 'Rua da Consolação, 999', cidade: 'São Paulo', cep: '01301-100', usuario: usuarios[1] },

  # Endereços para Carla Dias (ID 3)
  { rua: 'Avenida Rio Branco, 200', cidade: 'Rio de Janeiro', cep: '20040-001', usuario: usuarios[2] },

  # Endereço para Daniel Mendes (ID 4)
  { rua: 'Praça da Sé, s/n', cidade: 'São Paulo', cep: '01001-000', usuario: usuarios[3] },

  # Endereços para Fernanda Lima (ID 6)
  { rua: 'Avenida Boa Viagem, 555', cidade: 'Recife', cep: '51011-000', usuario: usuarios[5] },
  { rua: 'Rua do Bom Jesus, 183', cidade: 'Recife', cep: '50030-170', usuario: usuarios[5] },

  # Endereços para Gustavo Borges (ID 7)
  { rua: 'Rua Oscar Freire, 400', cidade: 'São Paulo', cep: '01426-000', usuario: usuarios[6] },

  # Endereço para Helena Souza (ID 8)
  { rua: 'Avenida Afonso Pena, 1200', cidade: 'Belo Horizonte', cep: '30130-003', usuario: usuarios[7] },

  # Endereços para Juliana Pereira (ID 10)
  { rua: 'Rua 24 de Outubro, 1800', cidade: 'Porto Alegre', cep: '90510-001', usuario: usuarios[9] },
  { rua: 'Avenida Ipiranga, 6681', cidade: 'Porto Alegre', cep: '90619-900', usuario: usuarios[9] }
])
puts "Endereços criados e associados com sucesso!"
puts "Banco de dados populado!"
