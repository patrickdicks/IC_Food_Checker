--
--  Name: Patrick Dicks
--  Title: IC Food Checker
--  Objectives: 
--      Create database
--      Write CREATE queries to build tables
--      Write INSERT queries to populate tables with data from ICN food list
--      Write SELECT queries to return foods appearing from the ICN food list with information about their bladder-friendliness rating
--  License: MIT
--  IC_queries.sql
--

INSERT INTO food (`foodName`, `comfortRating`, `origin`) VALUES
-- Apples
("Apples - sweet, mild (i e Gala, Fuji, Pink Lady)", 1, "ICN List"), 
("Apples - jam", 1, "ICN List"), 
("Apples - jelly", 1, "ICN List"), 
("Apples - pies", 1, "ICN List"), 
("Apples - tarts", 1, "ICN List"), 
("Apples - juice", 1, "ICN List"), 
("Apples - sweet Red", 2, "ICN List"),
("Apples - Green Delicous", 2, "ICN List"),
("Apples - sour or very tart (i e Granny Smith)", 3, "ICN List"),

-- Applesauce
("Applesauce - homemade with Gala, Fuji or Pink Lady apples", 1, "ICN List"),
("Applesauce - brand name", 3, "ICN List"),
("Applesauce - baby", 3, "ICN List"),

-- Bananas
("Bananas - fresh", 2, "ICN List"),
("Bananas - bread", 2, "ICN List"),
("Bananas - fritters", 2, "ICN List"),
("Bananas - ice cream", 2, "ICN List"),
("Bananas - chocalate covered", 3, "ICN List"),
("Bananas - chips treated with sulfur", 3, "ICN List"),

-- Beer
("Beer - light lagers", 2, "ICN List"),
("Beer - light hybrid", 2, "ICN List"),
("Beer - light ales", 2, "ICN List"),
("Beer - brown ales", 3, "ICN List"),
("Beer - stout", 3, "ICN List"),
("Beer - hard cider", 3, "ICN List"),
("Beer - german white or rye", 3, "ICN List"),
("Beer - belgian or french ale", 3, "ICN List"),
("Beer - brown ales", 3, "ICN List"),

-- Candy
("Candy - carob", 1, "ICN List"),
("Candy - caramel", 1, "ICN List"),
("Candy - mint", 1, "ICN List"),
("Candy - butterscotch", 1, "ICN List"),
("Candy - divinity", 1, "ICN List"),
("Candy - licorice", 2, "ICN List"),
("Candy - white chocolate", 2, "ICN List"),
("Candy - cotton", 2, "ICN List"),
("Candy - mild gums (sugar or xylitol based)", 2, "ICN List"),
("Candy - red hot-type cinnamons", 3, "ICN List"),
("Candy - sour", 3, "ICN List"),
("Candy - most sugar-free and gums", 3, "ICN List"),

-- Cheese
("Cheese - American", 1, "ICN List"),
("Cheese - mozzarella", 1, "ICN List"),
("Cheese - cheddar (mild)", 1, "ICN List"),
("Cheese - feta", 1, "ICN List"),
("Cheese - ricotta", 1, "ICN List"),
("Cheese - string", 1, "ICN List"),
("Cheese - blue", 2, "ICN List"),
("Cheese - brie", 2, "ICN List"),
("Cheese - brick parmesan", 2, "ICN List"),
("Cheese - camembert", 2, "ICN List"),
("Cheese - cheddar (sharp)", 2, "ICN List"),
("Cheese - edam", 2, "ICN List"),
("Cheese - emmenthaler", 2, "ICN List"),
("Cheese - gruyere hard jack", 2, "ICN List"),
("Cheese - Monterey Jack", 2, "ICN List"),
("Cheese - parmesan (fresh & canned)", 2, "ICN List"),
("Cheese - Roquefort", 2, "ICN List"),
("Cheese - stilton", 2, "ICN List"),
("Cheese - Swiss", 2, "ICN List"),
("Cheese - processed", 3, "ICN List"),
("Cheese - heavily spiced", 3, "ICN List"),
("Cheese - can products", 3, "ICN List"),

-- Dates
("Dates - organic", 1, "ICN List"),
("Dates - fresh", 1, "ICN List"),
("Dates - dried", 1, "ICN List"),

-- Drink Powders
("Drink Powders - white hot chocolate mixes", 2, "ICN List"),
("Drink Powders - Kool-aid", 3, "ICN List"),
("Drink Powders - lemonade", 3, "ICN List"),
("Drink Powders - orange", 3, "ICN List"),
("Drink Powders - chocolate", 3, "ICN List"),
("Drink Powders - sweet tea", 3, "ICN List"),

-- Eggplant
("Eggplant - baked", 1, "ICN List"),
("Eggplant - sauteed", 1, "ICN List"),
("Eggplant - eggplant parmigiana with tomato sauce", 3, "ICN List"),

-- Eggs
("Eggs - artificial-stimulant-free and veggie-fed", 1, "ICN List"),
("Eggs - dried", 1, "ICN List"),
("Eggs - pasteurized whites", 1, "ICN List"),
("Eggs - Egg Beaters", 2, "ICN List"),

-- Fish Oil
("Fish Oil - capsules", 1, "ICN List"),
("Fish Oil - liquid without citrus", 1, "ICN List"),
("Fish Oil - using lemon or other citrus flavors ", 3, "ICN List"),

-- Folic Acid
("Folic Acid - capsules", 2, "ICN List"),

-- Garlic
("Garlic - fresh", 1, "ICN List"),
("Garlic - dried", 1, "ICN List"),
("Garlic - powder", 1, "ICN List"),
("Garlic - infused oil", 1, "ICN List"),
("Garlic - salt", 2, "ICN List"),

-- Gum
("Gum - sugar based", 1, "ICN List"),
("Gum - mint", 1, "ICN List"),
("Gum - licorice flavors", 1, "ICN List"),
("Gum - sweetened with xylitol", 2, "ICN List"),
("Gum - mint flavor", 2, "ICN List"),
("Gum - licorice flavor", 2, "ICN List"),
("Gum - with most artificial sweeteners", 3, "ICN List"),
("Gum - hot spicy flavors", 3, "ICN List"),
("Gum - citrus flavors", 3, "ICN List"),

-- Horseradish
("Horseradish - grated", 3, "ICN List"),
("Horseradish - flakes", 3, "ICN List"),
("Horseradish - powder", 3, "ICN List"),

-- Hydrolyzed Protein
("Hydrolyzed Protein - may be hidden MSG", 3, "ICN List"),

-- Ice Cream
("Ice Cream - peppermint", 1, "ICN List"),
("Ice Cream - vanilla", 1, "ICN List"),
("Ice Cream - caramel", 2, "ICN List"),
("Ice Cream - coconut", 2, "ICN List"),
("Ice Cream - mango", 2, "ICN List"),
("Ice Cream - peppermint", 2, "ICN List"),
("Ice Cream - almond", 2, "ICN List"),
("Ice Cream - butter pecan", 2, "ICN List"),
("Ice Cream - chocolate", 3, "ICN List"),
("Ice Cream - coffee", 3, "ICN List"),
("Ice Cream - rocky road", 3, "ICN List"),
("Ice Cream - citrus flavors", 3, "ICN List"),

-- Italian Sodas
("Italian Sodas - blueberry", 1, "ICN List"),
("Italian Sodas - coconut", 1, "ICN List"),
("Italian Sodas - pear made with low sodium mineral water", 1, "ICN List"),
("Italian Sodas - raspberry", 2, "ICN List"),
("Italian Sodas - blackberry", 2, "ICN List"),
("Italian Sodas - strawberry", 2, "ICN List"),
("Italian Sodas - root beer", 2, "ICN List"),
("Italian Sodas - peach", 2, "ICN List"),
("Italian Sodas - watermelon", 2, "ICN List"),
("Italian Sodas - cola", 3, "ICN List"),
("Italian Sodas - lemon", 3, "ICN List"),
("Italian Sodas - lime", 3, "ICN List"),
("Italian Sodas - orange", 3, "ICN List"),
("Italian Sodas - chocolate", 3, "ICN List"),
("Italian Sodas - coffee using high sodium mineral waters", 3, "ICN List"),

-- Juices
("Juices - blueberry", 1, "ICN List"),
("Juices - pear (i.e. Knudsen’s Organic Pear)", 1, "ICN List"),
("Juices - baby apple", 2, "ICN List"),
("Juices - grape", 2, "ICN List"),
("Juices - low acid orange", 2, "ICN List"),
("Juices - some “organic” adult apple", 2, "ICN List"),
("Juices - cranberry", 3, "ICN List"),
("Juices - grapefruit", 3, "ICN List"),
("Juices - regular orange", 3, "ICN List"),
("Juices - tomato", 3, "ICN List"),
("Juices - acai", 3, "ICN List"),

-- Kiwi Fruit
("Kiwi fruit - fresh", 3, "ICN List"),
("Kiwi fruit - preserved", 3, "ICN List"),
("Kiwi fruit - jams", 3, "ICN List"),
("Kiwi fruit - jelly", 3, "ICN List"),

-- Lamb
("Lamb - fresh", 1, "ICN List"),
("Lamb - frozen", 1, "ICN List"),
("Lamb - heavily spiced", 3, "ICN List"),
("Lamb - preserved", 3, "ICN List"),
("Lamb - prepacked products", 3, "ICN List"),

-- Lard
("Lard - lard", 1, "ICN List"),

-- Maple Syrup
("Maple Syrup - homemade", 1, "ICN List"),
("Maple Syrup - store bought authentic", 1, "ICN List"),
("Maple Syrup - all imitation - regular, lite or sugar free", 3, "ICN List"),

-- Mayonnaise
("Mayonnaise - regular", 2, "ICN List"),
("Mayonnaise - olive oil", 2, "ICN List"),

-- Nectarines
("Nectarines - fresh", 2, "ICN List"),
("Nectarines - very sweet", 2, "ICN List"),
("Nectarines - sour", 3, "ICN List"),
("Nectarines - tart", 3, "ICN List"),

-- Nut Butters
("Nut Butters - almond", 1, "ICN List"),
("Nut Butters - peanut that are lower in salt and hydrogenated oils (i e Zinke Farms)", 1, "ICN List"),

-- Oils
("Oils - almond", 1, "ICN List"),
("Oils - canola", 1, "ICN List"),
("Oils - coconut", 1, "ICN List"),
("Oils - corn", 1, "ICN List"),
("Oils - olive", 1, "ICN List"),
("Oils - peanut", 1, "ICN List"),
("Oils - safflower", 1, "ICN List"),
("Oils - sesame", 1, "ICN List"),
("Oils - herb infused", 1, "ICN List"),
("Oils - Soybean can bother some patients Try it cautiously!", 2, "ICN List"),

-- Onions
("Onions - white", 2, "ICN List"),
("Onions - red", 2, "ICN List"),
("Onions - green", 2, "ICN List"),
("Onions - pearl", 2, "ICN List"),
("Onions - scallions", 2, "ICN List"),
("Onions - chives", 2, "ICN List"),
("Onions - raw bulb", 3, "ICN List"),

-- Papaya
("Papaya - fresh", 2, "ICN List"),
("Papaya - preserved products", 2, "ICN List"),

-- Paprikia
("Paprika - made from bell peppers", 2, "ICN List"),
("Paprika - made from chili peppers", 3, "ICN List"),
("Paprika - made from oleoresin", 3, "ICN List"),

-- Quinoa
("Quinoa - flour", 1, "ICN List"),
("Quinoa - pasta", 1, "ICN List"),
("Quinoa - bread", 1, "ICN List"),
("Quinoa - cereal", 1, "ICN List"),

-- Radishes
("Radishes - fresh", 1, "ICN List"),

-- Rosemary
("Rosemary - fresh", 1, "ICN List"),
("Rosemary - dried", 1, "ICN List"),

-- Seeds
("Seeds - organic", 2, "ICN List"),
("Seeds - unsalted", 2, "ICN List"),
("Seeds - lightly salted sunflower", 2, "ICN List"),
("Seeds - pumpkin", 2, "ICN List"),
("Seeds - sesame", 2, "ICN List"),
("Seeds - heavily seasoned", 3, "ICN List"),
("Seeds - hot spiced", 3, "ICN List"),
("Seeds - salty", 3, "ICN List"),

-- Squash
("Squash - summer (zucchini)", 1, "ICN List"),
("Squash - summer (patty pan)", 1, "ICN List"),
("Squash - summer (crookneck)", 1, "ICN List"),
("Squash - summer (yellow)", 1, "ICN List"),
("Squash - winter (acorn)", 1, "ICN List"),
("Squash - winter (butternut)", 1, "ICN List"),
("Squash - winter (patty pan)", 1, "ICN List"),
("Squash - winter (spaghetti)", 1, "ICN List"),

-- Tomatoes
("Tomatoes - homegrown", 2, "ICN List"),
("Tomatoes - yellow", 2, "ICN List"),
("Tomatoes - low acid varieties", 2, "ICN List"),
("Tomatoes - sauce", 3, "ICN List"),
("Tomatoes - paste", 3, "ICN List"),
("Tomatoes - juice", 3, "ICN List"),

-- Tortillas
("Tortillas - corn", 1, "ICN List"),
("Tortillas - flour", 1, "ICN List"),

-- Vanilla
("Vanilla - extract", 1, "ICN List"),
("Vanilla - bean pods", 1, "ICN List"),

-- Vinegar
("Vinegar - white", 3, "ICN List"),
("Vinegar - apple cider", 3, "ICN List"),
("Vinegar - red wine", 3, "ICN List"),
("Vinegar - balsamic", 3, "ICN List"),
("Vinegar - spirit", 3, "ICN List"),

-- Vitamins
("Vitamins - A", 1, "ICN List"),
("Vitamins - B1", 1, "ICN List"),
("Vitamins - B2", 1, "ICN List"),
("Vitamins - B12", 1, "ICN List"),
("Vitamins - D", 1, "ICN List"),
("Vitamins - E", 1, "ICN List"),
("Vitamins - K", 1, "ICN List"),
("Vitamins - low acid Ester C", 2, "ICN List"),
("Vitamins - Vitamin C", 3, "ICN List"),
("Vitamins - Vitamin B6", 3, "ICN List"),

-- Watercress
("Watercress - fresh", 2, "ICN List"),

-- Watermelon
("Watermelon - fresh", 2, "ICN List"),
("Watermelon - pickles", 3, "ICN List"),

-- Whipped Cream
("Whipped Cream - fresh", 1, "ICN List"),
("Whipped Cream - Cool Whip", 1, "ICN List"),

-- Yogurt
("Yogurt - plain", 2, "ICN List"),
("Yogurt - vanilla flavor", 2, "ICN List"),
("Yogurt - blueberry flavor", 2, "ICN List"),
("Yogurt - raspberry flavor", 2, "ICN List"),
("Yogurt - peach flavor", 2, "ICN List"),
("Yogurt - prune flavor", 2, "ICN List"),
("Yogurt - lemon flavor", 1, "ICN List"),
("Yogurt - lime flavor", 1, "ICN List"),
("Yogurt - orange flavor", 1, "ICN List"),
("Yogurt - chocolate flavor", 1, "ICN List"),
("Yogurt - mocha flavor", 1, "ICN List"),
("Yogurt - yogurts that use aspartame or other artificial sugars", 1, "ICN List");