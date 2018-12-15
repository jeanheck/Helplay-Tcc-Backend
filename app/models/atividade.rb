class Atividade < ApplicationRecord
  belongs_to :esporte
  belongs_to :usuario
  has_many :individualidades, dependent: :delete_all

  accepts_nested_attributes_for :individualidades, allow_destroy: true
end
