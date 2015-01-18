Category.where(name: "Supercar").first_or_create
Category.where(name: "Roadster").first_or_create
Category.where(name: "Full-size SUV").first_or_create

Category.where(name: "Supercar").take.products << [
Product.where(title: "Bugatti Veyron", description: "The Bugatti Veyron EB 16.4 is a mid-engined supercar, designed and developed by the Volkswagen Group and manufactured in Molsheim, France, by Bugatti Automobiles S.A.S. The original version had a top speed of 407.12 km/h (252.97 mph). It was named Car of the Decade (2000–2009) by the BBC television programme Top Gear. The standard Bugatti Veyron also won Top Gear's Best Car Driven All Year award in 2005.").first_or_create,
Product.where(title: "Pagani Zonda", description: "The Pagani Zonda is a supercar built by the Italian manufacturer Pagani. It debuted in 1999, and production ended in 2011, with three special edition cars, the Zonda 760RS, Zonda 760LH and the Zonda 764 Passione, being produced in 2012. By June 2009, 135 Zondas had been built, including development mules. Both 2-door coupé and roadster versions have been produced. Construction is mainly of carbon fiber.").first_or_create,
Product.where(title: "LaFerrari", description: "LaFerrari (also known by its project name, F150) is a limited production hybrid sports car built by Ferrari. The car and its name were officially unveiled at the 2013 Geneva Auto Show. It is based on findings from testing of the Ferrari FXX and on research being conducted by the Millechili Project at the University of Modena. Association with the Millechili Project led to speculation during development that the car would weigh under 1,000 kg (2,205 lb), but a dry weight of 1,255 kg (2,767 lb) was claimed. Only 499 units will be built, and each will cost more than £1 million ($1.69 million).").first_or_create,
Product.where(title: "Lamborghini Aventador", description: "The Lamborghini Aventador is a mid-engined sports car produced by the Italian manufacturer Automobili Lamborghini. Launched on 28 February 2011 at the Geneva Motor Show, five months after its initial unveiling in Sant'Agata Bolognese, the vehicle, internally codenamed LB834, was designed to replace the ten-year-old Murciélago as the new flagship model.").first_or_create
]

Category.where(name: "Roadster").take.products << [
Product.where(title: "Audi TT", description: "The Audi TT is a small two-door sports car marketed by Volkswagen Group subsidiary Audi since 1998, both assembled by the Audi subsidiary Audi Hungaria Motor Kft. in Győr, Hungary, using bodyshells manufactured and painted at Audi's Ingolstadt plant. This changed with the third generation model that uses parts made entirely by the Hungarian factory.").first_or_create,
Product.where(title: "BMW Z4", description: "The BMW Z4 is a rear-wheel drive sports car by the German car maker BMW. It follows a line of past BMW roadsters such as the BMW Z1, BMW 507, BMW Z8, and the BMW Z3. The Z4 replaces the Z3. First generation production started in 2002 at BMW USA's Greer, South Carolina plant, with production of both roadster and coupe forms. When debuted, it won Automobile Magazine 'Design of the Year Award'. Starting with the 2009 model year, the second-generation Z4 is built at BMW's Regensburg, Germany plant as a retractable hardtop roadster. In 2009, the BMW Z4 won the Red Dot Design Award.").first_or_create,
Product.where(title: "Porsche Boxster", description: "The Porsche Boxster is a mid-engined two-seater roadster built by Porsche. The Boxster is Porsche's first road vehicle to be originally designed as a roadster since the 550 Spyder.").first_or_create,
Product.where(title: "Lotus Elise", description: "The Lotus Elise is a two seat, rear-wheel drive, mid-engined roadster conceived in early 1994 and released in September 1996 by the British manufacturer Lotus Cars. The car has a hand-finished fibreglass body shell atop its bonded extruded aluminium chassis that provides a rigid platform for the suspension, while keeping weight and production costs to a minimum. The roadster is capable of speeds up to 240 km/h (150 mph). The Elise was named after Elisa, the granddaughter of Romano Artioli who was chairman of Lotus and Bugatti at the time of the car's launch. The car represented a return by Lotus to simple and lightweight sports cars, after several years producing the increasingly heavy and luxurious Lotus Esprit, which had evolved into a supercar.").first_or_create,
Product.where(title: "Mazda MX-5", description: "The MX-5, released as the MX-5 Miata /miˈɑːtə/ in North America and as the Roadster in Japan, is a lightweight two-seater roadster with a front-engine, rear-wheel-drive layout. Manufactured by Mazda in Hiroshima, Japan, the model debuted in 1989 at the Chicago Auto Show. The MX-5 was conceived as a small roadster – with light weight and minimal mechanical complexity limited only by legal and safety requirements; technologically modern and reliable. The MX-5 is conceptually an evolution of the small British and Italian sports roadsters of the 1960s such as the Triumph Spitfire, MG MGB, Datsun 2000, Fiat 124 Sport Spider, Alfa Romeo Spider, and particularly the Lotus Elan.").first_or_create
]

Category.where(name: "Full-size SUV").take.products << [
Product.where(title: "Cadillac Escalade ESV", description: "The MX-5, released as the MX-5 Miata /miˈɑːtə/ in North America and as the Roadster in Japan, is a lightweight two-seater roadster with a front-engine, rear-wheel-drive layout. Manufactured by Mazda in Hiroshima, Japan, the model debuted in 1989 at the Chicago Auto Show. The MX-5 was conceived as a small roadster – with light weight and minimal mechanical complexity limited only by legal and safety requirements; technologically modern and reliable. The MX-5 is conceptually an evolution of the small British and Italian sports roadsters of the 1960s such as the Triumph Spitfire, MG MGB, Datsun 2000, Fiat 124 Sport Spider, Alfa Romeo Spider, and particularly the Lotus Elan.").first_or_create,
Product.where(title: "Chevrolet Suburban", description: "The Chevrolet Suburban is a full-size sport utility vehicle from Chevrolet. It is the longest continuous use automobile nameplate in production in the world, starting from 1934 for the 1935 U.S. model year, and has traditionally been one of General Motors' most profitable vehicles. The Suburban has been produced under the Chevrolet, Holden, and GMC marques until the GMC version was rebranded as the GMC Yukon XL. For most of its recent history, the Suburban has been a station wagon-bodied version of the Chevrolet pickup truck, including the Chevrolet C/K and Silverado series of truck-based vehicles. Cadillac offers a version called the Escalade ESV.").first_or_create,
Product.where(title: "Ford Explorer", description: "The Ford Explorer is a sport utility vehicle produced by the American manufacturer Ford since 1990. The Ford Explorer went on to become one of the most popular sport utility vehicles on the road. The model years through 2010 were traditional body-on-frame, mid-size SUVs. For the 2011 model year, Ford moved the Explorer to a more modern unibody, full-size crossover SUV/crossover utility vehicle platform, the same Volvo-derived platform the Ford Flex and Ford Taurus use. It is slotted between the traditional body-on-frame, full-size Ford Expedition and the mid-size CUV Ford Edge. Although outwardly similar, the fifth generation Explorer, Ford Edge and Ford Escape do not share platforms. The fifth generation Explorer does, however, share platforms with the Ford Flex and Lincoln MKT.").first_or_create,
Product.where(title: "Range Rover", description: "The Range Rover is a large luxury four-wheel drive sport utility vehicle (SUV) produced by British car maker Land Rover, a subsidiary of Jaguar Land Rover, and serves as its flagship model. The model, launched in 1970, is now in its fourth generation. Land Rover has expanded the Range Rover model line to include two entirely different designs: the Range Rover Evoque and the Range Rover Sport that derive core styling, brand identity and breadth of capability from the current Range Rover model.").first_or_create,
Product.where(title: "Toyota Land Cruiser", description: "The Toyota Land Cruiser (Japanese: トヨタ ランドクルーザー Toyota Rando-kurūzā?) is a series of four-wheel drive vehicles produced by the Japanese car maker Toyota. It is Toyota's longest running series.").first_or_create
]