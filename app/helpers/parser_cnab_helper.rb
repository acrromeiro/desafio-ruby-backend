class ParserCnabHelper
  def self.parser_line_cnab_to_hash(line)
    type =  line[0, 1]
    date = line[1, 8]
    value = line[9, 10]
    cpf = line[19, 11]
    card = line[30, 12]
    hour = line[42, 6]
    owner = line[48, 14]
    store = line[62, 19]

    {type:type, date:date, value:value, cpf:cpf, card:card, hour:hour, owner:owner, store:store}
  end
end