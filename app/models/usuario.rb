class Usuario < ApplicationRecord
  has_many :usuarioUm_amigos, :class_name => 'Amigo', :foreign_key => 'usuarioUm_id'
  has_many :usuarioDois_amigos, :class_name => 'Amigo', :foreign_key => 'usuarioDois_id'
  has_many :atividades
  has_many :eventos

  belongs_to :user, optional: true

  def dataNascimento_br
    I18n.l(self.dataNascimento) unless self.dataNascimento.blank?
  end
end
