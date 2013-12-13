# = matrizDensa.rb
#
# Autor::   Oliver Valido Ramos, Rodrigo Colombo Vlaeminch
# Web::     https://github.com/alu0100598148/prct11
#
# === Clase Matriz Densa
#
# Definición de la clase _MatrizDensa_ compuesta por
# * metodo initialize
# * metodo to_s
# * metodo det
# * metodo tras
# * metodo x
# * metodo +
# * metodo -
# * metodo *
# * metodo <=>
# * metodo max
# * metodo min
#

#! /usr/local/ruby/bin/ruby 
# require 'racional.rb'
require 'matriz.rb'

class MatrizDensa < Matriz

  attr_accessor :nFil , :mCol, :matriz

  def initialize (matriz)
    @nFil = matriz.size
    @mCol = matriz[0].size
    @matriz = matriz
  end
  
  # Metodo para obtener la matriz en formato string
  def to_s
    matString = ""
    (@nFil).times do |i|
      (@mCol).times do |j|
        matString = matString + @matriz[i][j].to_s + " "
      end
      matString = matString + "\n"
    end
    matString
  end
  
  # Metodo para calcular el determinante de una matriz
  def det
    if (@nFil == @mCol)
    det = @matriz[0][0]
    aux = MatrizDensa.new(@matriz)
    for k in 0...@nFil do 
      l = k+1
      for i in l...@mCol do
        for j in l...@mCol do
          aux.matriz[i][j] = (aux.matriz[k][k] * aux.matriz[i][j] - aux.matriz[k][j] * aux.matriz[i][k])/ aux.matriz[k][k]
        end
      end
      det = det * aux.matriz[k][k]
    end
    else
    det = "ERROR, la matriz no es cuadrada"
    end
    det
  end

  # Método para calcular la traspuesta de una matriz
  def tras
    result = Array.new
      (@nFil).times do |i|
        result[i] = Array.new
        (@mCol).times do |j|
          result[i][j] = 0
        end
      end

    aux = MatrizDensa.new(result)
    (@nFil).times do |i|
      (@mCol).times do |j|
        aux.matriz[i][j] = @matriz[j][i]
      end
    end
    aux
  end
  
  # Metodo para multiplicar una matriz por un escalar
  def x(escalar)
    aux = MatrizDensa.new(@matriz)
    (@nFil).times do |i|
      (@mCol).times do |j|
        aux.matriz[i][j] = @matriz[i][j] * escalar
      end
    end
    aux
  end

  #Metodo para sumar dos matrices
  def +(mat)
    if (mat.nFil == @nFil && mat.mCol == @mCol)
      aux = MatrizDensa.new(@matriz)
      (@nFil).times do |i|
        (@mCol).times do |j|
          aux.matriz[i][j] = @matriz[i][j] + mat.matriz[i][j]
        end
      end
    else
      aux = 0
    end
    aux
  end

  # Metodo para restar dos matrices
  def -(mat)
    if (mat.nFil == @nFil && mat.mCol == @mCol)
      aux = MatrizDensa.new(@matriz)
      (@nFil).times do |i|
        (@mCol).times do |j|
          aux.matriz[i][j] = @matriz[i][j] - mat.matriz[i][j]
        end
      end
    else
      aux = 0
    end
    aux
  end

  # Metodo para multiplicar dos matrices
  def *(mat)
    if (@mCol == mat.nFil)
      result = Array.new
      (@nFil).times do |i|
        result[i] = Array.new
        (mat.mCol).times do |j|
          if (mat.matriz[0][0].class == Fraccion)
           result[i][j] = Fraccion.new(0, 1)
          else
           result[i][j] = 0
          end
        end
      end

      aux = MatrizDensa.new(result)

      (@nFil).times do |i|
        (mat.mCol).times do |j|
          (@mCol).times do |z|
            aux.matriz[i][j] += @matriz[i][z] * mat.matriz[z][j]
          end
        end
      end
    else
      aux = 0
    end
    aux
  end

  # Metodo que nos permite comparar dos matrices
  def <=>(matriz)
    if (@nFil == matriz.nFil && @mCol == matriz.mCol)
      comparacion = 0
      for i in 0...@nFil do
        for j in 0...@mCol do
          comparacion += @matriz[i][j] <=> matriz.matriz[i][j]
        end
      end
    end
    if (comparacion > 0)
      comparacion = 1
    elsif (comparacion < 0)
      comparacion = -1
    end
    comparacion
  end

  # Metodo para saber el maximo elemento de la matriz
  def max
    maxi = @matriz[0][0]
    for i in 0...@nFil do
      for j in 0...@mCol do
          if (maxi < @matriz[i][j])
            maxi = @matriz[i][j]
          end
        
      end
    end
    maxi
  end

  # Metodo para saber el minimo elemento de la matriz
  def min
    mini = @matriz[0][0]
    for i in 0...@nFil do
      for j in 0...@mCol do
          if (mini > @matriz[i][j])
            mini = @matriz[i][j]
          end
      end
    end
    mini
  end

  def encontrar
    (@nFil).times do |i|
      (@mCol).times do |j|
        if(yield(@matriz[i][j]))
          return i, j
        end
      end
    end
    return nil
  end
end

