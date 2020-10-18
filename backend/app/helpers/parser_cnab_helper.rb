module ParserCnabHelper
  def self.parser_line_cnab_to_hash(line)
    type =  line[0, 1].strip
    date = line[1, 8].strip
    value = (line[9, 10].strip.to_f/100)
    cpf = line[19, 11].strip
    card = line[30, 12].strip
    hour = line[42, 6].strip
    owner = line[48, 14].strip
    store = line[62, 19].strip

    {type:type, date:date, value:value, cpf:cpf, card:card, hour:hour, owner:owner, store:store}
  end
end