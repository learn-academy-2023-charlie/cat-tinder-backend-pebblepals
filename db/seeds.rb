# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

rocks = [
    {
        name: 'Rocky Balboa',
        age: "10,000",
        enjoys: 'boxing and training sequences',
        image: 'placeholder',
    },
    {
        name: "Dwayne 'The Rock' Johnson",
        age: "3,445,534",
        enjoys: "consuming 8,000 calories per day",
        image:'placeholder',
    },
     {
        name: 'Pebble Picasso',
        age: "2,345,654",
        enjoys:'rock artistry and sculpting',
        image:'placeholder',
    }, 
    {
        name: 'Rock Offerman',
        age: "130,000",
        enjoys: 'woodworking, meat, hunting, and solitude',
        image:'placeholder',
    }
]

rocks.each do |each_rock|
    Rock.create each_rock
    p 'creating rock #{each_rock}'
end