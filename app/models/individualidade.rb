class Individualidade < ApplicationRecord
  belongs_to :atividade, optional: true
  belongs_to :caracteristica, optional: true
end
