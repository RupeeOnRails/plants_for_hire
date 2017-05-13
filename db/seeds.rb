# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


# no duplicates, only list neighbors to nodes with greater id than self

if Location.count == 0
  45.times { Location.create }

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

end

# [id, x_position, y_position]
coordinates = [[1, 65, 20], [2, 65, 67], [3, 65, 120], [4, 65, 190], [5, 65, 250], [6, 65, 360], [7, 65, 435], [8, 65, 500], [9, 146, 62], [10, 146, 129], [11, 165, 200], [12, 125, 245], [13, 125, 290], [14, 125, 337], [15, 125, 383], [16, 125, 475], [17, 190, 450], [18, 190, 500], [19, 236, 62], [20, 237, 200], [21, 237, 290], [22, 247, 383], [23, 275, 450], [24, 275, 500], [25, 310, 129], [26, 310, 200], [27, 318, 383], [28, 354, 62], [29, 374, 245], [30, 374, 290], [31, 373, 500], [32, 434, 129], [33, 434, 200], [34, 448, 290], [35, 448, 460], [36, 448, 500], [37, 434, 20], [38, 434, 70], [39, 511, 100], [40, 511, 160], [41, 511, 220], [42, 511, 370], [43, 511, 416], [44, 511, 460], [45, 511, 500]]
coordinates.each do |coordinate|
  location = Location.find coordinate[0]
  location.x = coordinate[1]
  location.y = coordinate[2]
  location.save
end


tomato = Tomato.create
potato = Potato.create

s = Supplier.new
s.name = 'Mrs. Spaghetti'
s.location = Location.find 28
s.save

s_order = StockOrder.new
s_order.merchant = s
s_order.size = 120
s_order.save

s_rule = StockRule.new
s_rule.item = tomato
s_rule.price = 0
s_rule.restock = 12
s_rule.stock_order = s_order
s_rule.save

j = Supplier.new
j.name = 'Potato Joe'
j.location = Location.find 22
j.save

j_order = StockOrder.new
j_order.merchant = j
j_order.size = 160
j_order.save

j_rule = StockRule.new
j_rule.item = potato
j_rule.price = 2
j_rule.restock = 10
j_rule.stock_order = j_order
j_rule.save

b = Buyer.new
b.name = "Food 'N' Stuff"
b.location = Location.find 30
b.save

b_order = StockOrder.new
b_order.merchant = b
b_order.size = 240
b_order.save

b_rule = StockRule.new
b_rule.item = tomato
b_rule.price = 3
b_rule.restock = -32
b_rule.stock_order = b_order
b_rule.save

b_rule2 = StockRule.new
b_rule2.item = potato
b_rule2.price = 3
b_rule2.restock = -20
b_rule2.stock_order = b_order
b_rule2.save

shop = UpgradeShop.create name: 'Upgrade Shop', location_id: 40

bike   = VehicleUpgrade.create name: 'Bicycle', inventory: 24,   speed: 4,  tier: 0
basket = VehicleUpgrade.create name: 'Basket',  inventory: 48,   speed: 4,  tier: 1
cart   = VehicleUpgrade.create name: 'Cart',    inventory: 256,  speed: 3,  tier: 2
van    = VehicleUpgrade.create name: 'Van',     inventory: 1024, speed: 11, tier: 3
pickup = VehicleUpgrade.create name: 'Pickup',  inventory: 2048, speed: 12, tier: 4

shop.add_upgrade basket, 100
shop.add_upgrade cart, 1000
shop.add_upgrade van, 20000
shop.add_upgrade pickup, 30000


intro = 'Welcome to Plants For Hire! Behind this message you will see the Town Map. '\
        'The colored dots are locations. The green dot is you. '\
        'Travel to a neighboring location by clicking on it or using the arrow keys. '\
        'Your next-door neighbor Mrs. Spaghetti has heard about your business plans and has '\
        'offered her surplus of tomatoes to you free of charge! Travel to the orange location marker '\
        'to pick up your first delivery, then look for a place to sell it!'
HelpText.create title: 'Introduction', text: intro
