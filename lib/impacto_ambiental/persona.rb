class Persona
  attr_reader :genero, :edad , :impacto_gei, :impacto_m2
  def initialize(genero,edad)
    @genero,@edad =  genero,edad
    @impacto_gei = 0.0
    @impacto_m2 = 0.0
  end
  def impacto(alimento)
    @impacto_gei += alimento.gei
    @impacto_m2 += alimento.m2
  end
end
