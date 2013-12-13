require 'matrizDensa'
require 'matriz'
require 'matrizDispersa'
require 'test/unit'

class TestMatriz < Test::Unit::TestCase 

  def test_densa
    @m1 = MatrizDensa.new([[1,2],[2,5]])
    @m2 = MatrizDensa.new([[3,4],[1,3]])
    @m3 = MatrizDensa.new([[4,6],[3,8]])
    assert_equal((@m1+@m2).to_s, @m3.to_s)
  end

  def test_dispersa
    @md1 = MatrizDispersa.new(3,3,{0 => {0 => 3, 2 => 7}, 2 => {1 => 1}}) 
    @md2 = MatrizDispersa.new(3,3,{0 => {1 => 2, 2 => 2}, 1 => {0 => 1}})
    @md3 = MatrizDensa.new([[3,2,9],[1,0,0],[0,1,0]])
    assert_equal((@md1+@md2).to_s, @md3.to_s)
  end

end
