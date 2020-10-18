require_relative '../helpers/parser_cnab_helper.rb'

class ImportCnabFileService

  def self.import(file_name)
    file = File.open(file_name)
    file.readlines.each do |line|
      hash = ParserCnabHelper.parser_line_cnab_to_hash(line)
      Transaction.convert_hash_to_object(hash)
    end
  end
end