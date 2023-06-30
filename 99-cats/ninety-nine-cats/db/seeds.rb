# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

ApplicationRecord.transaction do 
    
    # Destroy cats
    puts "Destroying cats.."
    Cat.destroy_all
    

    # Reset Primary keys
    puts "Resetting primary keys..."
    %w(cats).each do |table|
        ApplicationRecord.connection.reset_pk_sequence!(table)
    end 
    

    # Seed
    puts "Seeding cats data..."
    c1 = Cat.create!(name: 'Marco', birth_date: '2000-12-3', color: 'brown', sex: 'M')
    c2 = Cat.create!(name: 'Garfield', birth_date: '1999-12-29', color: 'orange', sex: 'M')
    c3 = Cat.create!(name: 'Dave', birth_date: '2010-03-22', color: 'white', sex: 'F')
    c4 = Cat.create!(name: 'Milly', birth_date: '1000-04-6', color: 'brown', sex: 'M')
    c5 = Cat.create!(name: 'Phil', birth_date: '2005-12-21', color: 'mixed', sex: 'F')
    c6 = Cat.create!(name: 'Tubby', birth_date: '2022-01-3', color: 'black', sex: 'M')
    c7 = Cat.create!(name: 'Jamel', birth_date: '2019-05-10', color: 'white', sex: 'F')
    
    puts "all done :)"


end
