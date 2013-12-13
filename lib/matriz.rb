# = matriz.rb
#
# Autor::   Oliver Valido Ramos, Rodrigo Colombo Vlaeminch
#
# === Clase Matriz
#
# Definición de la clase _Matriz_ compuesta por
# * metodo initialize
# * metodo coerce
# * metodo +
# * metodo -
# * metodo *
# * metodo x
# * metodo max
# * metodo min
# * metodo <=>
# * metodo det
# * metodo tras
# * metodo to_s
#
require 'racional'

class Matriz
  attr_accessor :nFil, :mCol, :matriz

  def initialize(matriz); end

  include Comparable

  def coerce(matriz); end

  def +(matriz); end

  def -(matriz); end

  def *(matriz); end

  def x(matriz); end

  def max; end

  def min; end

  def <=>(matriz); end

  def det; end

  def tras; end

  def to_s; end
end

