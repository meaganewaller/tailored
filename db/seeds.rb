# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
#
# Uncomment the following to create an Admin user for Production in Jumpstart Pro
#
global_categories = [
  {
    parent: "Accessories",
    subcategories: [
      {name: "Belts", metadata_schema: {material: nil, buckle_type: nil}},
      {name: "Glasses", metadata_schema: {frame_material: nil, lens_type: nil}},
      {name: "Gloves & Mittens", metadata_schema: {material: nil, lining: nil}},
      {name: "Hair Accessories", metadata_schema: {type: nil, material: nil}},
      {name: "Hats", metadata_schema: {brim_style: nil, material: nil}},
      {name: "Hosiery & Socks", metadata_schema: {material: nil, pattern: nil}},
      {name: "Scarves & Wraps", metadata_schema: {material: nil, length: nil}},
      {name: "Sunglasses", metadata_schema: {frame_material: nil, lens_type: nil, uv_protection: nil}},
      {name: "Umbrellas", metadata_schema: {size: nil, material: nil}},
      {name: "Watches", metadata_schema: {band_material: nil, water_resistance: nil}}
    ],
    metadata_schema: {
      material: nil
    }
  },
  {
    parent: "Bags",
    subcategories: [
      {name: "Baby Bags", metadata_schema: {size: nil, compartments: nil}},
      {name: "Backpacks", metadata_schema: {size: nil, closure_type: nil}},
      {name: "Clutches & Wristlets", metadata_schema: {material: nil, strap_type: nil}},
      {name: "Crossbody Bags", metadata_schema: {strap_length: nil, material: nil}},
      {name: "Hobos", metadata_schema: {material: nil, size: nil}},
      {name: "Mini Bags", metadata_schema: {size: "small", strap_length: nil}},
      {name: "Satchels", metadata_schema: {material: nil, compartments: nil}},
      {name: "Shoulder Bags", metadata_schema: {strap_length: nil, material: nil}},
      {name: "Totes", metadata_schema: {size: "large", handle_type: nil}},
      {name: "Travel Bags", metadata_schema: {size: nil, compartments: nil, closure_type: nil}},
      {name: "Wallets", metadata_schema: {material: nil, card_slots: nil}}
    ],
    metadata_schema: {
      material: nil,
      closure_type: nil,
      size: nil
    }
  },
  {
    parent: "Dresses",
    subcategories: [
      {name: "A-Line", metadata_schema: {waistline: "natural", skirt_length: "midi"}},
      {name: "Maxi", metadata_schema: {skirt_length: "maxi", hem_detail: nil}},
      {name: "Mini", metadata_schema: {skirt_length: "mini", embellishment: nil}},
      {name: "Sheath", metadata_schema: {fit: "slim", stretch_level: nil}},
      {name: "Sleeveless", metadata_schema: {sleeves: "sleeveless", strap_type: nil}},
      {name: "Long Sleeve", metadata_schema: {sleeves: "long"}},
      {name: "V-Neck", metadata_schema: {neckline: "v_neck"}}
    ],
    metadata_schema: {
      sleeves: nil,
      neckline: nil,
      waistline: nil,
      skirt_length: nil
    }
  },
  {
    parent: "Intimates & Sleepwear",
    subcategories: [
      {name: "Bandeaus", metadata_schema: {material: nil, support_level: nil}},
      {name: "Bras", metadata_schema: {support_level: nil, underwire: nil, padding: nil}},
      {name: "Chemises & Slips", metadata_schema: {material: nil, length: nil}},
      {name: "Pajamas", metadata_schema: {material: nil, sleeve_length: nil}},
      {name: "Panties", metadata_schema: {material: nil, rise: nil}},
      {name: "Robes", metadata_schema: {material: nil, closure_type: nil, length: nil}},
      {name: "Shapewear", metadata_schema: {compression_level: nil, material: nil}},
      {name: "Sports Bras", metadata_schema: {support_level: nil, material: nil}}
    ],
    metadata_schema: {
      material: nil,
      support_level: nil
    }
  },
  {
    parent: "Jackets & Coats",
    subcategories: [
      {name: "Blazers & Suit Jackets", metadata_schema: {material: nil, closure_type: nil}},
      {name: "Bomber Jackets", metadata_schema: {material: nil, closure_type: "zipper"}},
      {name: "Capes", metadata_schema: {length: nil, material: nil}},
      {name: "Jean Jackets", metadata_schema: {material: "denim", closure_type: nil}},
      {name: "Leather Jackets", metadata_schema: {material: "leather", closure_type: "zipper"}},
      {name: "Pea Coats", metadata_schema: {material: nil, closure_type: nil, length: nil}},
      {name: "Puffers", metadata_schema: {insulation_type: nil, length: nil}},
      {name: "Ski & Snow Jackets", metadata_schema: {insulation_type: nil, waterproof_level: nil}},
      {name: "Teddy Jackets", metadata_schema: {material: "faux fur", closure_type: nil}},
      {name: "Trench Coats", metadata_schema: {material: nil, closure_type: "belt"}},
      {name: "Utility Jackets", metadata_schema: {material: nil, closure_type: "zipper"}},
      {name: "Vests", metadata_schema: {material: nil, closure_type: nil, length: nil}}
    ],
    metadata_schema: {
      closure_type: nil,
      material: nil,
      length: nil
    }
  },
  {
    parent: "Jeans",
    subcategories: [
      {name: "Ankle & Cropped", metadata_schema: {length: "cropped"}},
      {name: "Boot Cut", metadata_schema: {leg_style: "boot_cut"}},
      {name: "Boyfriend", metadata_schema: {fit: "relaxed"}},
      {name: "Flare & Wide Leg", metadata_schema: {leg_style: "flare"}},
      {name: "High Rise", metadata_schema: {waist_rise: "high"}},
      {name: "Jeggings", metadata_schema: {stretch_level: "high"}},
      {name: "Overalls", metadata_schema: {closure_type: nil, material: nil}},
      {name: "Skinny", metadata_schema: {leg_style: "skinny", stretch_level: nil}},
      {name: "Straight Leg", metadata_schema: {leg_style: "straight"}}
    ],
    metadata_schema: {
      waist_rise: nil,
      fit: nil,
      length: nil
    }
  },
  {
    parent: "Jewelry",
    subcategories: [
      {name: "Bracelets", metadata_schema: {material: nil, closure_type: nil}},
      {name: "Brooches", metadata_schema: {material: nil, gem_type: nil}},
      {name: "Earrings", metadata_schema: {material: nil, closure_type: nil}},
      {name: "Necklaces", metadata_schema: {material: nil, length: nil}},
      {name: "Rings", metadata_schema: {material: nil, gemstone: nil}}
    ],
    metadata_schema: {
      material: nil
    }
  },
  {
    parent: "Pants & Jumpsuits",
    subcategories: [
      {name: "Ankle & Cropped", metadata_schema: {length: "cropped"}},
      {name: "Boot Cut & Flare", metadata_schema: {leg_style: "flare"}},
      {name: "Capris", metadata_schema: {length: "capri"}},
      {name: "Jumpsuits & Rompers", metadata_schema: {closure_type: nil, material: nil}},
      {name: "Leggings", metadata_schema: {material: nil, stretch_level: nil}},
      {name: "Pantsuits", metadata_schema: {fit: nil, material: nil}},
      {name: "Skinny", metadata_schema: {leg_style: "skinny", stretch_level: nil}},
      {name: "Straight Leg", metadata_schema: {leg_style: "straight"}},
      {name: "Track Pants & Joggers", metadata_schema: {fit: "relaxed", material: nil}},
      {name: "Trousers", metadata_schema: {fit: nil, material: nil}},
      {name: "Wide Leg", metadata_schema: {leg_style: "wide_leg"}}
    ],
    metadata_schema: {
      waist_rise: nil,
      length: nil,
      fit: nil
    }
  },
  {
    parent: "Shoes",
    subcategories: [
      {name: "Ankle Boots & Booties", metadata_schema: {shaft_height: "ankle", heel_height: nil}},
      {name: "Athletic Shoes", metadata_schema: {sole_type: nil, material: nil}},
      {name: "Combat & Moto Boots", metadata_schema: {material: nil, sole_type: nil}},
      {name: "Espadrilles", metadata_schema: {material: "canvas", sole_type: nil}},
      {name: "Flats & Loafers", metadata_schema: {toe_shape: nil, material: nil}},
      {name: "Heeled Boots", metadata_schema: {heel_type: nil, heel_height: nil}},
      {name: "Heels", metadata_schema: {heel_height: nil, heel_type: nil}},
      {name: "Lace Up Boots", metadata_schema: {shaft_height: nil, closure_type: "lace_up"}},
      {name: "Mules & Clogs", metadata_schema: {material: nil, toe_shape: nil}},
      {name: "Over the Knee Boots", metadata_schema: {shaft_height: "over_the_knee"}},
      {name: "Platforms", metadata_schema: {platform_height: nil, material: nil}},
      {name: "Sandals", metadata_schema: {strap_type: nil, sole_type: nil}},
      {name: "Slippers", metadata_schema: {material: nil}},
      {name: "Sneakers", metadata_schema: {sole_type: nil, material: nil}},
      {name: "Wedges", metadata_schema: {heel_type: "wedge", material: nil}},
      {name: "Winter & Rain Boots", metadata_schema: {waterproof_level: nil, shaft_height: nil}}
    ],
    metadata_schema: {
      heel_type: nil,
      toe_shape: nil,
      material: nil
    }
  },
  {
    parent: "Shorts",
    subcategories: [
      {name: "Athletic Shorts", metadata_schema: {material: nil, fit: "relaxed", length: nil}},
      {name: "Bermudas", metadata_schema: {length: "knee_length"}},
      {name: "Bike Shorts", metadata_schema: {stretch_level: nil, length: "mid_thigh"}},
      {name: "Cargos", metadata_schema: {pockets: "multiple", fit: "loose"}},
      {name: "High Waist", metadata_schema: {waist_rise: "high"}},
      {name: "Jean Shorts", metadata_schema: {material: "denim", length: "short"}},
      {name: "Skorts", metadata_schema: {length: "short", material: nil}}
    ],
    metadata_schema: {
      waist_rise: nil,
      length: nil,
      fit: nil
    }
  },
  {
    parent: "Skirts",
    subcategories: [
      {name: "A-Line or Full", metadata_schema: {skirt_shape: "a-line", waistline: "natural"}},
      {name: "Asymmetrical", metadata_schema: {skirt_shape: "asymmetrical", hem_detail: nil}},
      {name: "Circle & Skater", metadata_schema: {skirt_shape: "circle", length: "short"}},
      {name: "High Low", metadata_schema: {hem_detail: "high_low", length: nil}},
      {name: "Maxi", metadata_schema: {skirt_length: "maxi", material: nil}},
      {name: "Midi", metadata_schema: {skirt_length: "midi", material: nil}},
      {name: "Mini", metadata_schema: {skirt_length: "mini", material: nil}},
      {name: "Pencil", metadata_schema: {fit: "slim", length: nil}},
      {name: "Skirt Sets", metadata_schema: {set_items: "2-piece", material: nil}}
    ],
    metadata_schema: {
      waistline: nil,
      skirt_length: nil,
      fit: nil
    }
  },
  {
    parent: "Sweaters",
    subcategories: [
      {name: "Cardigans", metadata_schema: {closure_type: nil, material: nil, sleeve_length: nil}},
      {name: "Cowl & Turtlenecks", metadata_schema: {neckline: "turtleneck", material: nil}},
      {name: "Crew & Scoop Necks", metadata_schema: {neckline: nil, material: nil, sleeve_length: nil}},
      {name: "Off-the-Shoulder Sweaters", metadata_schema: {neckline: "off-the-shoulder", material: nil}},
      {name: "Shrugs & Ponchos", metadata_schema: {fit: "loose", material: nil, length: nil}},
      {name: "V-Necks", metadata_schema: {neckline: "v_neck", material: nil}}
    ],
    metadata_schema: {
      material: nil,
      sleeve_length: nil,
      neckline: nil
    }
  },
  {
    parent: "Swim",
    subcategories: [
      {name: "Bikinis", metadata_schema: {coverage: nil, padding: nil, top_type: nil, bottom_type: nil}},
      {name: "Coverups", metadata_schema: {material: nil, length: nil}},
      {name: "One Pieces", metadata_schema: {coverage: nil, padding: nil, material: nil}},
      {name: "Sarongs", metadata_schema: {material: nil, length: nil, closure_type: nil}}
    ],
    metadata_schema: {
      material: nil,
      coverage: nil,
      padding: nil
    }
  },
  {
    parent: "Tops",
    subcategories: [
      {name: "Blouses", metadata_schema: {material: nil, sleeve_length: nil, neckline: nil}},
      {name: "Bodysuits", metadata_schema: {closure_type: "snap", material: nil}},
      {name: "Button Down Shirts", metadata_schema: {closure_type: "buttons", material: nil, sleeve_length: nil}},
      {name: "Camisoles", metadata_schema: {material: nil, strap_type: nil}},
      {name: "Crop Tops", metadata_schema: {length: "cropped", sleeve_length: nil, material: nil}},
      {name: "Jerseys", metadata_schema: {material: "jersey", fit: "loose"}},
      {name: "Muscle Tees", metadata_schema: {sleeve_length: "sleeveless", material: nil}},
      {name: "Sweatshirts & Hoodies", metadata_schema: {closure_type: "pullover", sleeve_length: "long", material: "fleece"}},
      {name: "Tank Tops", metadata_schema: {sleeve_length: "sleeveless", material: nil, strap_type: nil}},
      {name: "Tees - Long Sleeve", metadata_schema: {sleeve_length: "long", material: nil}},
      {name: "Tees - Short Sleeves", metadata_schema: {sleeve_length: "short", material: nil}},
      {name: "Tunics", metadata_schema: {length: "long", sleeve_length: nil, material: nil}}
    ],
    metadata_schema: {
      sleeves: nil,
      neckline: nil,
      fit: nil
    }
  },
  {
    parent: "Global & Traditional Wear",
    subcategories: [
      {name: "Ao Dais", metadata_schema: {material: nil, fit: "slim", length: "long"}},
      {name: "Cheongsams & Qipaos", metadata_schema: {material: nil, fit: "slim", neckline: nil}},
      {name: "Dirdls", metadata_schema: {material: nil, length: "knee_length", embellishment: nil}},
      {name: "Hanboks", metadata_schema: {material: nil, set_items: "2-piece"}},
      {name: "Harem Pants", metadata_schema: {fit: "loose", material: nil}},
      {name: "Hijabs", metadata_schema: {material: nil, length: nil}},
      {name: "Huipils", metadata_schema: {material: nil, fit: "loose", embellishment: nil}},
      {name: "Kaftans", metadata_schema: {material: nil, fit: "loose", length: nil}},
      {name: "Kimonos & Yukatas", metadata_schema: {material: nil, fit: "loose", length: nil, sleeve_length: nil}},
      {name: "Kurta Bottoms", metadata_schema: {material: nil, fit: nil}},
      {name: "Kurtas", metadata_schema: {material: nil, length: nil, sleeve_length: nil}},
      {name: "Lehengas", metadata_schema: {material: nil, fit: nil, embellishment: nil}},
      {name: "Palazzo Pants", metadata_schema: {fit: "loose", material: nil, length: "long"}},
      {name: "Patiala Pants", metadata_schema: {fit: "loose", material: nil}},
      {name: "Salwars", metadata_schema: {fit: "loose", material: nil, length: "long"}},
      {name: "Saree Blouses", metadata_schema: {material: nil, fit: "tailored", embellishment: nil}},
      {name: "Sarees", metadata_schema: {material: nil, embellishment: nil}},
      {name: "Treggings", metadata_schema: {fit: "slim", material: "stretch"}}
    ],
    metadata_schema: {
      material: nil
    }
  }
]

global_categories.each do |category|
  cat = Category.create(global: true, name: category[:parent], metadata_schema: category[:metadata_schema])
  cat.save
  category[:subcategories].each do |subc|
    Category.create(global: true, name: subc[:name], parent: cat, metadata_schema: subc[:metadata_schema])
  end
end

# WardrobeItem.create([
#   {
#     name: "Black Leather Jacket",
#     category: "Outerwear",
#     color: "Black",
#     season: "Fall",
#     occasion: "Casual",
#     cost: 200.00,
#     condition: "Like New",
#     account: account
#   },
#   {
#     name: "White Cotton T-Shirt",
#     category: "Tops",
#     color: "White",
#     season: "Summer",
#     occasion: "Casual",
#     cost: 20.00,
#     condition: "Good",
#     account: account
#   },
#   {
#     name: "Blue Denim Jeans",
#     category: "Bottoms",
#     color: "Blue",
#     season: "All-Season",
#     occasion: "Casual",
#     cost: 60.00,
#     condition: "Worn",
#     account: account
#   },
#   {
#     name: "Red Cocktail Dress",
#     category: "Dresses",
#     color: "Red",
#     season: "Spring",
#     occasion: "Evening",
#     cost: 150.00,
#     condition: "New",
#     account: account
#   },
#   {
#     name: "Tan Trench Coat",
#     category: "Outerwear",
#     color: "Tan",
#     season: "Spring",
#     occasion: "Work",
#     cost: 250.00,
#     condition: "Like New",
#     account: account
#   },
#   {
#     name: "Black Ankle Boots",
#     category: "Shoes",
#     color: "Black",
#     season: "Fall",
#     occasion: "Casual",
#     cost: 120.00,
#     condition: "Good",
#     account: account
#   },
#   {
#     name: "Grey Wool Scarf",
#     category: "Accessories",
#     color: "Grey",
#     season: "Winter",
#     occasion: "Casual",
#     cost: 35.00,
#     condition: "Like New",
#     account: account
#   },
#   {
#     name: "Blue Denim Jacket",
#     category: "Outerwear",
#     color: "Blue",
#     season: "Fall",
#     occasion: "Casual",
#     cost: 80.00,
#     condition: "Worn",
#     account: account
#   },
#   {
#     name: "Black Silk Blouse",
#     category: "Tops",
#     color: "Black",
#     season: "All-Season",
#     occasion: "Work",
#     cost: 100.00,
#     condition: "Good",
#     account: account
#   },
#   {
#     name: "Brown Leather Belt",
#     category: "Accessories",
#     color: "Brown",
#     season: "All-Season",
#     occasion: "Casual",
#     cost: 40.00,
#     condition: "New",
#     account: account
#   },
#   {
#     name: "White Sneakers",
#     category: "Shoes",
#     color: "White",
#     season: "Summer",
#     occasion: "Casual",
#     cost: 75.00,
#     condition: "Good",
#     account: account
#   },
#   {
#     name: "Floral Maxi Dress",
#     category: "Dresses",
#     color: "Multicolor",
#     season: "Summer",
#     occasion: "Casual",
#     cost: 90.00,
#     condition: "New",
#     account: account
#   },
#   {
#     name: "Black Formal Pants",
#     category: "Bottoms",
#     color: "Black",
#     season: "All-Season",
#     occasion: "Work",
#     cost: 60.00,
#     condition: "Like New",
#     account: account
#   }
# ])
