require "impacto_ambiental"
RSpec.describe ImpactoAmbiental do
  carne_de_vaca = Alimento.new("Carne de vaca",50.0,164.0,21.1,0.0,3.1)
  carnde_de_cordero = Alimento.new("Carne de cordero",20.0,185.0,18.0,0.0,17.0)
  camarones = Alimento.new("Camarones",18.0,2.0,17.6,1.5,0.6)
  manolo = Persona.new("H",29)
  lista = Lista.new
  plato = Plato.new("Arroz a la cubana",nil,nil)
  it "has a version number" do
    expect(ImpactoAmbiental::VERSION).not_to be nil
  end
  it "does something useful" do
    expect(false).to eq(false)
  end
  context "probando la clase alimento" do
    it "prueba del new de alimento" do
      expect(carne_de_vaca.class).to eq(Alimento)
    end
    it "probando los getters y el to_s de alimento" do
      expect(carne_de_vaca.nombre).to eq("Carne de vaca")
      expect(carne_de_vaca.gei).to eq(50.0)
      expect(carne_de_vaca.m2).to eq(164.0)
      expect(carne_de_vaca.proteinas).to eq(21.1)
      expect(carne_de_vaca.carbo).to eq(0.0)
      expect(carne_de_vaca.lipidos).to eq(3.1)
    end
    it "probando la funcion que calcula el valor energetico" do
      carne_de_vaca.val_energetico.should be_within(112.0).of(112.4)
    end
  end
  context "Probando la clase persona" do
    it "probando funciones de impacto" do
      manolo.impacto(carne_de_vaca)
      expect(manolo.impacto_gei).to eq(50.0)
      expect(manolo.impacto_m2).to eq(164.0)
    end
  end
  context "Probando la clase nodo" do
    nodo_test = Nodo.new("test",0,7)
    it "Probando getters y setters" do
      expect(nodo_test[0]).to eq("test")
      expect(nodo_test.value).to eq("test")
      expect(nodo_test[1]).to eq(0)
      expect(nodo_test.next).to eq(0)
      expect(nodo_test.prev).to eq(7)
      expect(nodo_test[2]).to eq(7)
      nodo_test[0] = "we finish the test"
      expect(nodo_test[0]).to eq("we finish the test")
    end
  end
  context "Probando la clase lista" do
    it "Probando getters" do
      lista_t = Lista.new
      expect(lista_t.tail).to eq(nil)
      expect(lista_t.head).to eq(nil)
    end
    it "Probando insert" do
      lista.insert("H")
      lista.insert("M")
      lista.insert("T")
    end
    it "Probando pop front" do
      expect(lista.pop_front).to eq("H")
      expect(lista.pop_front).to eq("M")
      expect(lista.pop_front).to eq("T")
    end
  end
  context "Tests Alimento Comparable" do
    before :each do
      @tcarne_de_vaca = Alimento.new("Carne de vaca",50.0,164.0,21.1,0.0,3.1)
      @tcarnde_de_cordero = Alimento.new("Carne de cordero",20.0,185.0,18.0,0.0,17.0)
      @tcamarones = Alimento.new("Camarones",18.0,2.0,17.6,1.5,0.6)
    end
    it "Carne de vaca es igual a carne de vaca" do
      expect(@tcarne_de_vaca==carne_de_vaca).to eq(true)
    end
    it "Los alimentos son iguales entre ellos" do
      expect(@tcarnde_de_cordero==carnde_de_cordero).to eq(true)
      expect(@tcamarones==camarones).to eq(true)
    end
    it "Carne de vaca es distinta de carne de cordero" do
      expect(@tcarne_de_vaca==@tcarnde_de_cordero).to eq(false)
    end
    it "Los camarones son distintos a la carne de vaca" do
      expect(@tcarne_de_vaca==@tcamarones).to eq(false)
    end
  end
  context "test lista Enumerable" do
    before :each do
      @tlista = Lista.new
    end
    it "probando collect" do
      @tlista.insert("H")
      @tlista.insert("M")
      @tlista.insert("T")
      expect(@tlista.collect{|i| i}).to eq(["H","M","T"])
    end
    it "probando max y min" do
      @tlista.insert(99)
      @tlista.insert(150)
      @tlista.insert(1)
      expect(@tlista.max).to eq(150)
      expect(@tlista.min).to eq(1)
      @tlista.insert(0)
      expect(@tlista.min).to eq(0)
      @tlista.insert(999)
      expect(@tlista.max).to eq(999)
    end
    it "comprobando sort" do
      @tlista.insert(99)
      @tlista.insert(150)
      @tlista.insert(1)
      @tlista.insert(0)
      @tlista.insert(999)
      expect(@tlista.sort).to eq([0,1,99,150,999])
    end
  end
  context "test class plato" do
    before :each do
      @plato = Plato.new("Arroz a la cubana",nil,nil)
    end
    it "obteniendo el nombre del plato" do
        expect(@plato.nombre).to eq("Arroz a la cubana")
    end
    #it "un objeto plato es una instancia de la clase Plato" do
    #  expect(@plato).to be_an_intance_of(Plato)
    #end
    #it "un objeto plato no es una instancia de la clase Object" do
    #  expect(@plato).not_to be_an_intance_of(Object)
    #end
    it "Un plato hereda de basic object" do
      expect(@plato).to be_a_kind_of(BasicObject)
    end
    it "Un plato hereda de object" do
      expect(@plato).to be_a_kind_of(Object)
    end
  end
end
