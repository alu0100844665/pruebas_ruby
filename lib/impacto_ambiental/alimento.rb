class Alimento
  include Comparable
  attr_reader :nombre, :gei, :m2, :proteinas, :carbo, :lipidos, :val_energetico
  def initialize(nombre,gei,m2,proteinas,carbo,lipidos)
    @nombre, @gei, @m2, @proteinas, @carbo, @lipidos = nombre,gei,m2,proteinas,carbo,lipidos
    @val_energetico = (4*@carbo)+(4*@proteinas)+(9*@lipidos)
  end
  def to_s
    "(#{nombre}:proteinas(g)=#{proteinas},carbohidratos(g)=#{carbo},lipidos(g)=#{lipidos},valor energetico(Kcal)=#{val_energetico})"
  end
  def <=>(other)
    return nil unless other.instance_of? Alimento
    @val_energetico <=> other.val_energetico
  end
  def ==(other)
    if other.is_a?Alimento
      @val_energetico == other.val_energetico
    else
      false
    end
  end
end
