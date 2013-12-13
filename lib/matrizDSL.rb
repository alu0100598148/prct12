require 'matriz.rb'
require 'matrizDensa.rb'
require 'matrizDispersa.rb'

class MatrizDSL < Matriz
  attr_accessor :resultado

  def initialize(tipo_operacion, &block)

      @operandos = []
      @resultado = nil
      @tipo_resultado = :densa
      @operacion = :nada

      case tipo_operacion
        when "suma"
          @operacion = :suma
        when "resta"
          @operacion = :resta
        when "multiplicacion"
          @operacion = :multiplicacion
        else
          puts "Tipo de operacion inválido", tipo_operacion
      end

      if block_given?
        if block.arity == 1
          yield self
        else
          instance_eval &block
        end
      end
  end
end
