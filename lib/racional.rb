#! /usr/local/ruby/bin/ruby 
include Comparable

class Fraccion
  attr_reader :num, :den
  
  # Constructor de la clase Fraccion
  def initialize (num, den)
    mcd = gdc(num, den)
    @num = num / mcd
    @den = den / mcd
  end

  # Metodo que calcula el Maximo común divisor
  def gdc(a, b)
    while b != 0
      a, b = b, a % b
    end
    a
  end
  
  def coerce(num)
    [self, num]
  end

  # Metodo que imprime el numero racional en el formato: num/den
  def to_s
    "#{@num}/#{@den}"
  end

  # Metodo que devuelve el número racional como flotante
  def to_f
    @num/@den
  end
  
  # Metodo que calcula el valor absoluto de un numero racional
  def abs
    Fraccion.new(@num.abs, @den.abs)
  end

  # Metodo que calcula el reciproco de un numero racional
  def reciproco
    Fraccion.new(@den, @num)
  end
 
  # Metodo que cambia de signo el numero racional
  def -@
    Fraccion.new(-@num, @den)
  end

  # Metodo para sumar dos numeros racionales
  def +(fraccion)
    if (fraccion.class == Fraccion)
      num = @num * fraccion.den + fraccion.num * @den
      den = @den * fraccion.den
      Fraccion.new(num, den)
    else
      num = @num + fraccion * @den
      den = @den
      Fraccion.new(num, den)
    end
  end
  
  # Metodo para restar dos numeros racionales
  def -(fraccion)
    if (fraccion.class == Fraccion)
      num = @num * fraccion.den - fraccion.num * @den
      den = @den * fraccion.den
    else
      num = @num - fraccion * @den
      den = @den
    end
    Fraccion.new(num, den)
  end

  # Metodo para multiplicar dos numeros racionales
  def *(fraccion)
    if (fraccion.class == Fraccion)
      num = @num * fraccion.num
      den = @den * fraccion.den
    else
      num = @num * fraccion
      den = @den
    end
    resultado = Fraccion.new(num, den)
  end

  # Metodo para dividir dos numeros racionales
  def /(fraccion)
    if (fraccion.class == Fraccion)
      num = @num * fraccion.den
      den = @den * fraccion.num
    else
      num = @num
      den = @den * fraccion
    end
    resultado = Fraccion.new(num, den)
  end

  # Metodo para calcular el resto de dos numeros racionales
  def %(fraccion)
    ((@num * fraccion.den) % (@den * fraccion.num))
  end

  # Metodo guerra de las galaxias
  def <=>(fraccion)
    if ((@num == fraccion.num) && (@den == fraccion.den))
      return 0
    end
    if ((@num * fraccion.den) < (@den * fraccion.num))
      return -1
    end
    if ((@num * fraccion.den) > (@den * fraccion.num))
      return 1 
    end
  end

end
