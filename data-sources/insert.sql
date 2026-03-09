USE University;

INSERT INTO Faculty (FacultyName, Website, Email) VALUES 
('Faculty of Lore and History', 'http://lore.middleearth.edu', 'contact@lore.middleearth.edu'),
('Faculty of Magic and Craft', 'http://magic.middleearth.edu', 'contact@magic.middleearth.edu'),
('Faculty of Natural Sciences', 'http://nature.middleearth.edu', 'contact@nature.middleearth.edu'),
('Faculty of Warfare and Strategy', 'http://warfare.middleearth.edu', 'contact@warfare.middleearth.edu'),
('Faculty of Agriculture and Animal Care', 'http://agriculture.middleearth.edu', 'contact@agriculture.middleearth.edu'),
('Faculty of Art and Social Science', 'http://art.middleearth.edu', 'contact@art.middleearth.edu'),
('Faculty of Materials Science and Craftsmanship', 'http://materials.middleearth.edu', 'contact@materials.middleearth.edu');


-- Insert into Department table
INSERT INTO Department (DepartmentName, FacultyName) VALUES
-- Faculty of Lore and History
('Department of Ancient History', 'Faculty of Lore and History'),
('Department of Elven Language and Literature', 'Faculty of Lore and History'),
('Department of Legendary Creatures', 'Faculty of Lore and History'),

-- Faculty of Magic and Craft
('Department of Chaos Magic', 'Faculty of Magic and Craft'),
('Department of Elven Magic', 'Faculty of Magic and Craft'),
('Department of Wizardry and Sorcery', 'Faculty of Magic and Craft'),

-- Faculty of Natural Sciences
('Department of Ent Studies', 'Faculty of Natural Sciences'),
('Department of Flora and Fauna', 'Faculty of Natural Sciences'),
('Department of Geography and Ecosystems', 'Faculty of Natural Sciences'),

-- Faculty of Warfare and Strategy
('Department of Military Tactics', 'Faculty of Warfare and Strategy'),
('Department of Leadership and Command', 'Faculty of Warfare and Strategy'),
('Department of Combat Fighting', 'Faculty of Warfare and Strategy'),

-- Faculty of Agriculture and Animal Care
('Department of Farm Animals', 'Faculty of Agriculture and Animal Care'),
('Department of Agricultural Techniques', 'Faculty of Agriculture and Animal Care'),
('Department of Sustainable Farming', 'Faculty of Agriculture and Animal Care'),

-- Faculty of Art and Social Science
('Department of Music and Song', 'Faculty of Art and Social Science'),
('Department of Storytelling and Poetry', 'Faculty of Art and Social Science'),
('Department of Social Studies and Culture', 'Faculty of Art and Social Science'),

-- Faculty of Materials Science and Craftsmanship
('Department of Craftsmanship', 'Faculty of Materials Science and Craftsmanship'),
('Department of Weaponry', 'Faculty of Materials Science and Craftsmanship'),
('Department of Materials Science', 'Faculty of Materials Science and Craftsmanship');




-- Insert into Major table
INSERT INTO Major (MajorName, [Language], Duration, TypeOfGraduation, [Description], FacultyName) VALUES
-- Faculty of Lore and History Majors
('History of Middle-Earth', 'Common Tongue', 6, 'Bachelors degree', 'Study of the historical events that shaped Middle-Earth.', 'Faculty of Lore and History'),
('Elven Culture and Language', 'Elvish', 9, 'Masters degree', 'Study of the languages and cultures of Elvenkind.', 'Faculty of Lore and History'),
('Dwarven Art and Architecture', 'Khuzdul', 9, 'Masters degree', 'Study of the dwarven art, culture, and architecture.', 'Faculty of Lore and History'),
('Mythical Creatures and Beasts', 'Common Tongue', 6, 'Bachelors degree', 'Research into the mythical creatures of Middle-earth.', 'Faculty of Lore and History'),
('Ancient Languages and Scripts', 'Elvish', 9, 'Masters degree', 'Study of ancient languages, scripts, and their meanings.', 'Faculty of Lore and History'),
('Middle-Earth Geography', 'Common Tongue', 6, 'Bachelors degree', 'Research into the lands, regions, and ecosystems of Middle-earth.', 'Faculty of Lore and History'),

-- Faculty of Magic and Craft Majors
('Chaos Magic and Sorcery', 'Elvish', 9, 'Masters degree', 'Study of forbidden and chaotic magical practices.', 'Faculty of Magic and Craft'),
('Elven Magic', 'Elvish', 9, 'Masters degree', 'Study of the ancient and subtle magic of the Elves.', 'Faculty of Magic and Craft'),
('Alchemy and Potion Making', 'Common Tongue', 6, 'Bachelors degree', 'Focuses on the creation and uses of magical potions and elixirs.', 'Faculty of Magic and Craft'),
('Elemental Magic', 'Common Tongue', 9, 'Masters degree', 'Study of the manipulation of the elements (fire, water, earth, air).', 'Faculty of Magic and Craft'),
('Magical Creatures and Care', 'Elvish', 9, 'Masters degree', 'Study of magical creatures and their care, handling, and training.', 'Faculty of Magic and Craft'),

-- Faculty of Natural Sciences Majors
('Ent Studies', 'Entish', 7, 'Engineering degree', 'Study of the ancient and mysterious race of Ents.', 'Faculty of Natural Sciences'),
('Flora and Fauna', 'Common Tongue', 6, 'Bachelors degree', 'Research on the plants and animals of Middle-earth.', 'Faculty of Natural Sciences'),
('Geography and Ecosystems', 'Common Tongue', 6, 'Bachelors degree', 'Research on Middle-earth’s geography and diverse ecosystems.', 'Faculty of Natural Sciences'),
('Mineralogy and Gemstones', 'Khuzdul', 9, 'Masters degree', 'Study of the precious stones and minerals found throughout Middle-Earth.', 'Faculty of Natural Sciences'),

-- Faculty of Warfare and Strategy Majors
('Military Tactics', 'Common Tongue', 6, 'Bachelors degree', 'Study of the strategic principles behind military engagements.', 'Faculty of Warfare and Strategy'),
('Leadership and Command', 'Common Tongue', 9, 'Masters degree', 'Focus on leadership techniques in military settings.', 'Faculty of Warfare and Strategy'),
('Combat Training', 'Common Tongue', 6, 'Bachelors degree', 'Training in various forms of combat and strategy.', 'Faculty of Warfare and Strategy'),

-- Faculty of Agriculture and Animal Care Majors
('Agricultural Techniques', 'Common Tongue', 6, 'Bachelors degree', 'Research on farming techniques used in Middle-earth.', 'Faculty of Agriculture and Animal Care'),
('Animal Husbandry', 'Common Tongue', 6, 'Bachelors degree', 'Study of the care and breeding of animals in Middle-earth.', 'Faculty of Agriculture and Animal Care'),
('Sustainable Farming Practices', 'Common Tongue', 9, 'Masters degree', 'Focus on creating sustainable farming practices for Middle-earth.', 'Faculty of Agriculture and Animal Care'),

-- Faculty of Art and Social Science Majors
('Music and Song', 'Elvish', 6, 'Bachelors degree', 'Study of music, songs, and ballads of Middle-earth.', 'Faculty of Art and Social Science'),
('Storytelling and Poetry', 'Common Tongue', 9, 'Masters degree', 'Study of the rich oral tradition and poetry of Middle-earth.', 'Faculty of Art and Social Science'),
('Cultural Studies', 'Common Tongue', 9, 'Masters degree', 'Research into the diverse cultures of Middle-earth.', 'Faculty of Art and Social Science'),

-- Faculty of Materials Science and Craftsmanship Majors
('Craftsmanship and Blacksmith', 'Khuzdul', 7, 'Engineering degree', 'Study of Dwarven craftsmanship and smithing techniques.', 'Faculty of Art and Social Science'),
('Weaponry and Armor', 'Khuzdul', 7, 'Engineering degree', 'Focus on the study of weaponry and armor in Middle-earth.', 'Faculty of Art and Social Science'),
('Materials Science', 'Common Tongue', 7, 'Engineering degree', 'Study of the materials used for crafting and construction.', 'Faculty of Art and Social Science');



INSERT INTO [Subject] (SubjectName, ECTS, NumberOfHours, ExaminationType) VALUES
-- Lore and History
('Ancient Elven Manuscripts', 10, 30, 'exam'),
('Dwarven Ruins and Archaeology', 6, 45, 'project'),
('History of Númenor', 8, 60, 'exam'),
('The Rise and Fall of Sauron', 5, 45, 'exam'),
('Languages of Middle-Earth', 7, 30, 'pass'),
('Tales and Legends of Middle-Earth', 4, 15, 'laboratories'),

-- Magic and Craft
('Alchemy and Potion Brewing', 6, 30, 'laboratories'),
('Elven Enchantments', 8, 45, 'project'),
('Necromancy and Dark Arts', 4, 15, 'exam'),
('Runes and Ancient Spells', 10, 45, 'exam'),
('Magical Creatures and Their Habitats', 5, 30, 'pass'),
('Elemental Magic Control', 5, 45, 'laboratories'),

-- Natural Sciences
('Ent Botany', 10, 60, 'exam'),
('Middle-Earth Geology', 5, 45, 'exam'),
('Ecology of the Shire', 4, 30, 'pass'),
('Animal Behavior in Middle-Earth', 8, 60, 'laboratories'),
('Herbalism and Healing Plants', 6, 45, 'project'),
('Natural Disasters in Middle-Earth', 7, 30, 'exam'),

-- Warfare and Strategy
('Tactics of Gondorian Warfare', 5, 45, 'exam'),
('Siege Warfare in Middle-Earth', 10, 60, 'laboratories'),
('Duel Techniques of the Elves', 5, 45, 'pass'),
('Orcish Battle Strategies', 4, 30, 'exam'),
('Rohan Cavalry Tactics', 8, 30, 'project'),
('Battle Formations and Leadership', 6, 45, 'exam'),

-- Agriculture and Animal Care
('Sustainable Hobbit Farming', 5, 30, 'project'),
('Breeding of Giant Eagles', 10, 60, 'laboratories'),
('Fishing Techniques of Númenor', 4, 30, 'pass'),
('Livestock Management in Middle-Earth', 8, 45, 'exam'),
('Elven Gardening and Agriculture', 6, 45, 'project'),
('Orcish Food Production Methods', 4, 30, 'exam'),

-- Art and Social Science
('Elven Poetry and Music', 5, 30, 'pass'),
('History of Middle-Earth Art', 4, 30, 'exam'),
('Dwarven Smithing Songs', 10, 60, 'laboratories'),
('Theatrical Performance in Middle-Earth', 5, 45, 'project'),
('Ballads of the Bards', 9, 30, 'exam'),
('Social Structure of Middle-Earth Races', 5, 30, 'exam'),

-- Materials Science and Craftsmanship
('Forging Mithril Armor', 10, 60, 'laboratories'),
('Crafting Magical Artifacts', 5, 30, 'project'),
('Woodworking and Shipbuilding', 4, 30, 'pass'),
('Gemstones and Their Magical Properties', 6, 45, 'exam'),
('Metalwork of the Dwarves', 8, 45, 'laboratories'),
('Runic Engraving Techniques', 5, 30, 'exam');