require 'csv'

file_path = Rails.root.join('doc/pokemon.csv').to_s
csv_doc = CSV.parse(File.open(file_path), headers: true)

csv_doc.each do |row|
  next unless Pokemon.find_by(name: row['Name']).nil?

  Pokemon.create({
    name: row['Name'],
    type_1: row['Type 1'],
    type_2: row['Type 2'],
    total: row['Total'].to_i,
    hp: row['HP'].to_i,
    attack: row['Attack'].to_i,
    defense: row['Defense'].to_i,
    sp_atk: row['Sp. Atk'].to_i,
    sp_def: row['Sp. Def'].to_i,
    speed: row['Speed'].to_i,
    generation: row['Generation'].to_i,
    legendary: row['Legendary'].downcase == 'true'
  })
end
