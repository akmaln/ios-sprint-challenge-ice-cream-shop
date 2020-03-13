struct Flavor {
    let name: String
    var rating: Double
    
}

enum Size: Double {
    case small = 2.38
    case medium = 3.89
    case large = 4.50
}

struct Cone {
    let flavor: Flavor
    let topping: String?
    var size: Size
    
    func eat() {
        print("Mmm! I love \(flavor.name)")
    }
}

class IceCreamShop {
    var flavors: [Flavor]
    var sizes: [Size]
    var toppings: [String]?
    var totalSales: Double = 0
    
    init(flavors: [Flavor], sizes: [Size], toppings: [String], totalSales: Double) {
        self.flavors = flavors
        self.sizes = sizes
        self.toppings = toppings
        self.totalSales = totalSales
    }
}

let vanilla = Flavor(name: "Vanilla", rating: 3.2)
let chocolate = Flavor(name: "Chocolate", rating: 4.2)
let brownie = Flavor(name: "Brownie", rating: 4.7)
let strawberry = Flavor(name: "Strawberry", rating: 3.0)
let mintChocoChip = Flavor(name: "Mint Choco Chip", rating: 5.0)

let small = Size.small
let medium = Size.medium
let large = Size.large

let sprinkles = "Sprinles"
let chocoSprinkles = "Chocolate Sprinkles"
let chocoSyrup = "Chocolage Syrup"

let shop1 = IceCreamShop(flavors: [vanilla, chocolate, brownie, strawberry, mintChocoChip], sizes: [.large, .small, .medium] , toppings: [sprinkles, chocoSprinkles, chocoSyrup], totalSales: 0)

func listTopFlavors() {
    for flavor in shop1.flavors {
        if flavor.rating > 4.0{
            print("Our top flavors are \(flavor.name)")
        }
    }
}
print(listTopFlavors())


func orderCone(flavor: Flavor, topping: String?, size: Size) -> Cone? {
    let newCone = Cone(flavor: brownie, topping: nil, size: medium)
    
    shop1.totalSales += newCone.size.rawValue
    
    if let unwrappedTopping = topping {
        print("Your \(flavor.name) cone with \(unwrappedTopping) is \(size.rawValue)")
    } else {
        print("Your \(flavor.name) cone is \(size.rawValue)")
    }
    
    return newCone
}

orderCone(flavor: brownie, topping: nil, size: small)

let cone2 = Cone(flavor: vanilla, topping: chocoSyrup, size: large)

orderCone(flavor: chocolate, topping: nil, size: medium)

cone2.eat()

print(shop1.totalSales)
