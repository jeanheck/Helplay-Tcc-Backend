class Evento < ApplicationRecord
  belongs_to :usuario
  has_many :participantes
end
