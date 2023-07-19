class Tianyan < ActiveRecord::Base
  self.inheritance_column = :_type

  serialize :industryAll, Hash
  serialize :historyNameList, Array

  def self.search(kw)
    query = <<~SQL
    id = :kw1 OR creditCode = :kw1 OR regNumber = :kw1 OR
    name LIKE :kw2 OR historyNames LIKE :kw2 OR alias LIKE :kw2 OR property3 LIKE :kw2
    SQL

    records = where(query, kw1: kw, kw2: '%'+kw+'%')
    return records.first if records.any?

    t = Common::Tiany.search(kw)
    puts "========> Called tianyan!"
    create! t[:result] if t[:result]
  end
end
