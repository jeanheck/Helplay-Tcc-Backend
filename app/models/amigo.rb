class Amigo < ApplicationRecord
  belongs_to :usuarioUm, :class_name => 'Usuario'
  belongs_to :usuarioDois, :class_name => 'Usuario'
end
