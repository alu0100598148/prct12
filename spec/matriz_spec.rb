require 'matriz'
require 'matrizDispersa'
require 'matrizDensa'
require 'racional'
require 'matrizDSL'

describe Matriz do
  
  before :each do
    @m1 = MatrizDensa.new([[1,3],[2,0]])
    @m2 = MatrizDensa.new([[2,1],[0,1]])
    @m3 = MatrizDensa.new([[2,0,1],[3,0,0],[5,1,1]])
    @m4 = MatrizDensa.new([[4,1,6],[2,0,1]])
    @m5 = MatrizDensa.new([[Fraccion.new(1, 2), Fraccion.new(3, 5)], [Fraccion.new(3, 4), Fraccion.new(2, 3)]])
    @m6 = MatrizDensa.new([[Fraccion.new(3, 2), Fraccion.new(1, 5)], [Fraccion.new(5, 4), Fraccion.new(1, 3)]])
    @md1 = MatrizDispersa.new(3,3,{0 => {0 => 3, 2 => 7}, 2 => {1 => 1}})
    @md2 = MatrizDispersa.new(3,3,{0 => {1 => 2, 2 => 2}, 1 => {0 => 1}})
    @md3 = MatrizDispersa.new(3,3,{0 => {0 => Fraccion.new(3, 2)}})
  end

  describe "# Se crean las matrices del tamanio especificado e inicialidas" do
    it "Se establecen correctamente las dimensiones" do
      @m1.mCol.should == 2
      @m1.nFil.should == 2
      @m3.mCol.should == 3
      @m3.nFil.should == 3
      @m5.mCol.should == 2
      @m5.nFil.should == 2
      @md1.nFil.should == 3
      @md1.mCol.should == 3
      @md2.nFil.should == 3
      @md2.mCol.should == 3
    end
    it "Se inicializa correctamente" do
      @m1.to_s.should == "1 3 \n2 0 \n"
      @m2.to_s.should == "2 1 \n0 1 \n"
      @m3.to_s.should == "2 0 1 \n3 0 0 \n5 1 1 \n"
      @m5.to_s.should == "1/2 3/5 \n3/4 2/3 \n"
      @md1.to_s.should == "3 0 7 \n0 0 0 \n0 1 0 \n" 
      @md2.to_s.should == "0 2 2 \n1 0 0 \n0 0 0 \n"
    end
  end

  describe "Operaciones unarias" do
    it "Traspuesta" do
      (@m3.tras.matriz == MatrizDensa.new([[2,3,5],[0,0,1],[1,0,1]]).matriz).should be_true
      (@md1.tras.matriz == MatrizDispersa.new(3,3,{0 => {0 => 3}, 1 => {2 => 1}, 2 => {0 => 7}}).matriz).should be_true
    end
    it "Determinante" do
      (@m1.det.should == -6)
    end
  end

  describe "Multiplicar por un escalar" do
    it "Multiplicacion" do
      ((@m3.x(2)).matriz.should == MatrizDensa.new([[4,0,2],[6,0,0],[10,2,2]]).matriz)
      ((@m1.x(-3)).matriz.should == MatrizDensa.new([[-3,-9],[-6,0]]).matriz)
      ((@md1.x(2)).matriz.should == MatrizDispersa.new(3,3,{0 => {0 => 6, 2 => 14}, 2 => {1 => 2}}).matriz)
    end
  end

  describe "Operaciones con dos matrices" do
    it "Se deben poder sumar dos matrices" do
      ((@m1 + @m2).matriz.should == MatrizDensa.new([[3,4],[2,1]]).matriz)
      ((@m5 + @m6).matriz.should == MatrizDensa.new([[Fraccion.new(2, 1), Fraccion.new(4, 5)], [Fraccion.new(2, 1), Fraccion.new(1, 1)]]).matriz)
      ((@md1 + @md2).matriz.should == MatrizDensa.new([[3,2,9],[1,0,0],[0,1,0]]).matriz)
      ((@md1 + @m3).matriz.should == MatrizDensa.new([[5,0,8],[3,0,0],[5,2,1]]).matriz)		#Dispersa + Densa  
    end
    it "Se deben poder multiplicar dos matrices" do
      ((@m1 * @m2).matriz.should == MatrizDensa.new([[2,4],[4,2]]).matriz)
      ((@m1 * @m4).matriz.should == MatrizDensa.new([[10,1,9],[8,2,12]]).matriz)
      ((@m5 * @m6).matriz.should == MatrizDensa.new([[Fraccion.new(3, 2), Fraccion.new(3, 10)], [Fraccion.new(47, 24), Fraccion.new(67, 180)]]).matriz)
      ((@md1 * @md2).matriz.should == MatrizDispersa.new(3,3,{0 => {1 => 6, 2 => 6}, 2 => {0 => 1}}).matriz)
      ((@md1 * @m3).matriz.should == MatrizDensa.new([[41,7,10],[0,0,0],[3,0,0]]).matriz)	#Dispersa * Densa
    end
    it "Se deben poder restar dos matrices" do
      ((@m1 - @m2).matriz.should == MatrizDensa.new([[-1,2],[2,-1]]).matriz)
      ((@md1 - @md2).matriz.should == MatrizDensa.new([[3,-2,5],[-1,0,0],[0,1,0]]).matriz)
      ((@md1 - @m3).matriz.should == MatrizDensa.new([[1,0,6],[-3,0,0],[-5,0,-1]]).matriz)	#Dispersa - Densa
    end
  end

  describe "Comparaciones de matrices" do
    it "Se debe poder comparar dos matrices" do
      (@m1 == @m2).should be_true
      (@md1 > @md2).should be_true
    end
  end

  describe "Metodo maximo y minimo" do
    it "Se debe encontrar el maximo elemento de la matriz" do
      (@m1.max.should == 3)
      (@md1.max.should == 7)
    end
    it "Se debe poder encontrar el minimo elemento de la matriz" do
      (@m2.min.should == 0)
      (@md2.min.should == 0)
    end
  end
   
  describe "Modificacion" do
    it "Se debe pasar la posicion en la que un elemento al cuadrado es mayor que 6" do
      ((@m3.encontrar {|e| e*e > 6}).should == [1,0])
    end
  end

  describe "Prueba MatrizDSL" do
    it "Suma con el DSL" do
      @dsl1 = MatrizDSL.new("suma") do
        operando([[1,1],[1,1]])
        operando([[1,1],[1,1]])
      end
      @dsl1.calcular.should == [[2,2],[2,2]]
    end
    it "Resta con el DSL" do
      @dsl2 = MatrizDSL.new("resta") do
        operando([[2,7],[3,2]])
        operando([[1,3],[4,1]])
      end
      @dsl2.calcular.should == [[1,4],[-1,1]]
    end
    it "Multiplicacion con el DSL" do
      @dsl3 = MatrizDSL.new("multiplicacion") do
        operando([[1,3],[2,0]])
        operando([[2,1],[0,1]])
      end
      @dsl3.calcular.should == [[2,4],[4,2]]
    end
  end
end
