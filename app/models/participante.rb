class Participante < ApplicationRecord
  belongs_to :evento
  belongs_to :usuario
end
