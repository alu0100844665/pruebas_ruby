
#class Plato
#  attr_reader :nombre,:conjunto
#  def initialize(nombre,conjunto)
#    @nombre = nombre
#    @conjunto = Lista.new
#  end
#end


class Plato
attr_reader :nombre,:conjunto_alimentos,:conjunto_gramos
  def initialize(nombre,conjunto_alimentos,conjunto_gramos)
    @nombre = nombre
    @conjunto_alimentos = nil
    @conjunto_gramos = nil
    @proteinas = 0
    @lipidos = 0
    @hidratos = 0
    @vct = 0
    if conjunto_alimentos == nil
      @conjunto_alimentos = Lista.new
    elsif conjunto_alimentos.is_a?Lista
      @conjunto_alimentos = conjunto_alimentos
    end
    if conjunto_gramos == nil
      @conjunto_gramos = Lista.new
    elsif conjunto_gramos.is_a?Lista
      @conjunto_gramos = conjunto_gramos
    end
  end
end
