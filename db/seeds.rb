# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

45.times { Location.create }

# no duplicates, only list neighbors to nodes with greater id than self
PATHS = {
    1  => [2],
    2  => [3],
    3  => [4],
    4  => [5, 10],
    5  => [6],
    6  => [7],
    7  => [8],
    8  => [16],
    9  => [10, 19],
    10 => [25],
    11 => [20],
    12 => [13],
    13 => [14, 21],
    14 => [15],
    15 => [16, 22],
    16 => [17],
    17 => [18, 23],
    18 => [],
    19 => [28],
    20 => [21, 26],
    21 => [30],
    22 => [27],
    23 => [24],
    24 => [],
    25 => [26, 32],
    26 => [33],
    27 => [],
    28 => [],
    29 => [30],
    30 => [34],
    31 => [36],
    32 => [33, 38],
    33 => [41],
    34 => [35, 41],
    35 => [36, 44],
    36 => [45],
    37 => [38],
    38 => [],
    39 => [40],
    40 => [41],
    41 => [],
    42 => [43],
    43 => [44],
    44 => [45],
    45 => []
}

PATHS.each_pair do |location, neighbors|
  neighbors.each do |neighbor|
    Path.draw location, neighbor
  end
end
