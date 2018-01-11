class CaixaDeParafusos
  protected
  attr_writer :quantidade

  public
  attr_reader :quantidade

  def initialize(quantidade)
    @quantidade = quantidade
  end

  def to_s
    "Quantidade de parafusos na caixa #{self.object_id}: #{@quantidade}"
  end

  def +(outra)
    nova = CaixaDeParafusos.new(@quantidade + outra.quantidade)
    @quantidade = 0
    outra.quantidade = 0
    nova
  end

  def /(quantidade)
    caixas = Array.new(quantidade, @quantidade / quantidade)
    (@quantidade % quantidade).times { |indice| caixas[indice] += 1 }
    @quantidade = 0
    caixas.map { |quantidade| CaixaDeParafusos.new(quantidade) }
  end
end

caixa1 = CaixaDeParafusos.new(10)
caixa2 = CaixaDeParafusos.new(20)
caixa3 = caixa1 + caixa2

puts caixa3 / 4
