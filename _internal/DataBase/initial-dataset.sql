USE [BookShop]
GO
/****** Object:  Table [dbo].[Author]    Script Date: 19/03/2024 10:43:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Author](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Author] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Basket]    Script Date: 19/03/2024 10:43:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Basket](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [int] NOT NULL,
	[IsPayed] [bit] NULL,
	[DatePayed] [datetime] NULL,
 CONSTRAINT [PK_Basket] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BasketItem]    Script Date: 19/03/2024 10:43:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BasketItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[BasketId] [int] NOT NULL,
	[BookId] [int] NOT NULL,
	[Count] [int] NOT NULL,
 CONSTRAINT [PK_BasketItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 19/03/2024 10:43:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NOT NULL,
	[AuthorId] [int] NOT NULL,
	[Title] [nvarchar](50) NOT NULL,
	[Year] [int] NULL,
	[ISBN] [nvarchar](13) NULL,
	[Summary] [nvarchar](max) NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Discount] [decimal](18, 2) NULL,
	[Image] [nvarchar](50) NULL,
	[IsReccomended] [bit] NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 19/03/2024 10:43:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Images]    Script Date: 19/03/2024 10:43:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Images](
	[Id] [int] NOT NULL,
	[Image] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 19/03/2024 10:43:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Password] [nvarchar](50) NOT NULL,
	[DeliveryAddress] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Author] ON 

INSERT [dbo].[Author] ([Id], [FirstName], [LastName]) VALUES (1, N'Jane', N'Austen')
INSERT [dbo].[Author] ([Id], [FirstName], [LastName]) VALUES (2, N'J.K.', N'Rowling')
INSERT [dbo].[Author] ([Id], [FirstName], [LastName]) VALUES (3, N'Mark', N'Twain')
INSERT [dbo].[Author] ([Id], [FirstName], [LastName]) VALUES (4, N'George R. R.', N'Martin')
INSERT [dbo].[Author] ([Id], [FirstName], [LastName]) VALUES (5, N'Douglas', N'Adams')
INSERT [dbo].[Author] ([Id], [FirstName], [LastName]) VALUES (6, N'B. T.', N'Schmidt')
INSERT [dbo].[Author] ([Id], [FirstName], [LastName]) VALUES (7, N'Vernor', N'Vinge')
INSERT [dbo].[Author] ([Id], [FirstName], [LastName]) VALUES (8, N'Oscar', N'Wilde')
INSERT [dbo].[Author] ([Id], [FirstName], [LastName]) VALUES (9, N'Roald', N'Dahl')
INSERT [dbo].[Author] ([Id], [FirstName], [LastName]) VALUES (10, N'Stephen', N'King')
INSERT [dbo].[Author] ([Id], [FirstName], [LastName]) VALUES (11, N'Lucy', N'Foley')
SET IDENTITY_INSERT [dbo].[Author] OFF
GO
SET IDENTITY_INSERT [dbo].[Basket] ON 

INSERT [dbo].[Basket] ([Id], [UserId], [IsPayed], [DatePayed]) VALUES (3, 1, 0, NULL)
INSERT [dbo].[Basket] ([Id], [UserId], [IsPayed], [DatePayed]) VALUES (1003, 2, 0, NULL)
INSERT [dbo].[Basket] ([Id], [UserId], [IsPayed], [DatePayed]) VALUES (1004, 3, 0, NULL)
INSERT [dbo].[Basket] ([Id], [UserId], [IsPayed], [DatePayed]) VALUES (1006, 1017, 0, NULL)
INSERT [dbo].[Basket] ([Id], [UserId], [IsPayed], [DatePayed]) VALUES (1007, 1019, 1, CAST(N'2024-02-29T10:14:21.513' AS DateTime))
INSERT [dbo].[Basket] ([Id], [UserId], [IsPayed], [DatePayed]) VALUES (1008, 1019, 1, CAST(N'2024-02-29T10:32:52.387' AS DateTime))
INSERT [dbo].[Basket] ([Id], [UserId], [IsPayed], [DatePayed]) VALUES (1009, 1019, 1, CAST(N'2024-02-29T10:33:59.587' AS DateTime))
INSERT [dbo].[Basket] ([Id], [UserId], [IsPayed], [DatePayed]) VALUES (1010, 1019, 1, CAST(N'2024-03-01T13:38:27.220' AS DateTime))
INSERT [dbo].[Basket] ([Id], [UserId], [IsPayed], [DatePayed]) VALUES (1011, 1019, 0, NULL)
SET IDENTITY_INSERT [dbo].[Basket] OFF
GO
SET IDENTITY_INSERT [dbo].[BasketItem] ON 

INSERT [dbo].[BasketItem] ([Id], [BasketId], [BookId], [Count]) VALUES (1083, 3, 20, 1)
INSERT [dbo].[BasketItem] ([Id], [BasketId], [BookId], [Count]) VALUES (1084, 3, 24, 4)
INSERT [dbo].[BasketItem] ([Id], [BasketId], [BookId], [Count]) VALUES (1085, 3, 13, 1)
INSERT [dbo].[BasketItem] ([Id], [BasketId], [BookId], [Count]) VALUES (1086, 3, 21, 1)
INSERT [dbo].[BasketItem] ([Id], [BasketId], [BookId], [Count]) VALUES (1088, 1003, 38, 1)
INSERT [dbo].[BasketItem] ([Id], [BasketId], [BookId], [Count]) VALUES (1089, 3, 19, 1)
INSERT [dbo].[BasketItem] ([Id], [BasketId], [BookId], [Count]) VALUES (1090, 1004, 45, 1)
INSERT [dbo].[BasketItem] ([Id], [BasketId], [BookId], [Count]) VALUES (1095, 1006, 37, 1)
INSERT [dbo].[BasketItem] ([Id], [BasketId], [BookId], [Count]) VALUES (1099, 1007, 34, 1)
INSERT [dbo].[BasketItem] ([Id], [BasketId], [BookId], [Count]) VALUES (1105, 1007, 2, 2)
INSERT [dbo].[BasketItem] ([Id], [BasketId], [BookId], [Count]) VALUES (1108, 1008, 24, 1)
INSERT [dbo].[BasketItem] ([Id], [BasketId], [BookId], [Count]) VALUES (1110, 1008, 25, 1)
INSERT [dbo].[BasketItem] ([Id], [BasketId], [BookId], [Count]) VALUES (1111, 1009, 26, 1)
INSERT [dbo].[BasketItem] ([Id], [BasketId], [BookId], [Count]) VALUES (1112, 1009, 2, 1)
INSERT [dbo].[BasketItem] ([Id], [BasketId], [BookId], [Count]) VALUES (1113, 1010, 13, 1)
INSERT [dbo].[BasketItem] ([Id], [BasketId], [BookId], [Count]) VALUES (1115, 1011, 1, 1)
INSERT [dbo].[BasketItem] ([Id], [BasketId], [BookId], [Count]) VALUES (1116, 1011, 2, 1)
INSERT [dbo].[BasketItem] ([Id], [BasketId], [BookId], [Count]) VALUES (1118, 1011, 39, 1)
SET IDENTITY_INSERT [dbo].[BasketItem] OFF
GO
SET IDENTITY_INSERT [dbo].[Book] ON 

INSERT [dbo].[Book] ([Id], [CategoryId], [AuthorId], [Title], [Year], [ISBN], [Summary], [Price], [Discount], [Image], [IsReccomended]) VALUES (1, 1, 2, N'Harry Potter and the Goblet of Fire', 2000, N'9788498386698', N'The Triwizard Tournament is to be held at Hogwarts. Only wizards who are over seventeen are allowed to enter – but that doesn’t stop Harry dreaming that he will win the competition. Then at Hallowe’en, when the Goblet of Fire makes its selection, Harry is amazed to find his name is one of those that the magical cup picks out. He will face death-defying tasks, dragons and Dark wizards, but with the help of his best friends, Ron and Hermione, he might just make it through – alive!', CAST(12.00 AS Decimal(18, 2)), NULL, N'images/HP-and-goblet-of-fire.jpg', NULL)
INSERT [dbo].[Book] ([Id], [CategoryId], [AuthorId], [Title], [Year], [ISBN], [Summary], [Price], [Discount], [Image], [IsReccomended]) VALUES (2, 1, 2, N'Harry Potter and the Chamber of Secrets', 1998, N'9865736097235', N'Harry Potter’s summer has included the worst birthday ever, doomy warnings from a house-elf called Dobby, and rescue from the Dursleys by his friend Ron Weasley in a magical flying car! Back at Hogwarts School of Witchcraft and Wizardry for his second year, Harry hears strange whispers echo through empty corridors – and then the attacks start. Students are found as though turned to stone … Dobby’s sinister predictions seem to be coming true.', CAST(10.00 AS Decimal(18, 2)), NULL, N'images/HP-and-chamber-of-secrets.jpg', NULL)
INSERT [dbo].[Book] ([Id], [CategoryId], [AuthorId], [Title], [Year], [ISBN], [Summary], [Price], [Discount], [Image], [IsReccomended]) VALUES (3, 1, 2, N'Harry Potter and the Philosopher’s Stone
', 1997, N'4870639509854', N'Harry Potter has never even heard of Hogwarts when the letters start dropping on the doormat at number four, Privet Drive. Addressed in green ink on yellowish parchment with a purple seal, they are swiftly confiscated by his grisly aunt and uncle. Then, on Harry’s eleventh birthday, a great beetle-eyed giant of a man called Rubeus Hagrid bursts in with some astonishing news: Harry Potter is a wizard, and he has a place at Hogwarts School of Witchcraft and Wizardry. An incredible adventure is about to begin!', CAST(9.00 AS Decimal(18, 2)), CAST(8.00 AS Decimal(18, 2)), N'images/HP-and-philosophers-stone.jpg', 1)
INSERT [dbo].[Book] ([Id], [CategoryId], [AuthorId], [Title], [Year], [ISBN], [Summary], [Price], [Discount], [Image], [IsReccomended]) VALUES (4, 1, 2, N'Harry Potter and the Prisoner of Azkaban', 1999, N'2350515114096', N'When the Knight Bus crashes through the darkness and screeches to a halt in front of him, it’s the start of another far from ordinary year at Hogwarts for Harry Potter. Sirius Black, escaped mass-murderer and follower of Lord Voldemort, is on the run – and they say he is coming after Harry. In his first ever Divination class, Professor Trelawney sees an omen of death in Harry’s tea leaves … But perhaps most terrifying of all are the Dementors patrolling the school grounds, with their soul-sucking kiss.', CAST(12.00 AS Decimal(18, 2)), NULL, N'images/HP-and-prisoner-of-azkaban.jpg', NULL)
INSERT [dbo].[Book] ([Id], [CategoryId], [AuthorId], [Title], [Year], [ISBN], [Summary], [Price], [Discount], [Image], [IsReccomended]) VALUES (5, 1, 2, N'Harry Potter and the Half-Blood Prince', 2005, N'7856376458765', N'When Dumbledore arrives at Privet Drive one summer night to collect Harry Potter, his wand hand is blackened and shrivelled, but he does not reveal why. Secrets and suspicion are spreading through the wizarding world, and Hogwarts itself is not safe. Harry is convinced that Malfoy bears the Dark Mark: there is a Death Eater amongst them. Harry will need powerful magic and true friends as he explores Voldemort’s darkest secrets, and Dumbledore prepares him to face his destiny.', CAST(15.00 AS Decimal(18, 2)), NULL, N'images/HP-and-half-blood-prince.jpg', NULL)
INSERT [dbo].[Book] ([Id], [CategoryId], [AuthorId], [Title], [Year], [ISBN], [Summary], [Price], [Discount], [Image], [IsReccomended]) VALUES (6, 1, 2, N'Harry Potter and the Deathly Hallows', 2007, N'8723346511786', N'As he climbs into the sidecar of Hagrid’s motorbike and takes to the skies, leaving Privet Drive for the last time, Harry Potter knows that Lord Voldemort and the Death Eaters are not far behind. The protective charm that has kept Harry safe until now is now broken, but he cannot keep hiding. The Dark Lord is breathing fear into everything Harry loves, and to stop him Harry will have to find and destroy the remaining Horcruxes. The final battle must begin – Harry must stand and face his enemy.', CAST(15.00 AS Decimal(18, 2)), NULL, N'images/HP-and-the-deathly-hallows.jpg', NULL)
INSERT [dbo].[Book] ([Id], [CategoryId], [AuthorId], [Title], [Year], [ISBN], [Summary], [Price], [Discount], [Image], [IsReccomended]) VALUES (7, 1, 2, N'Harry Potter and the Order of the Phoenix', 2003, N'7644879028734', N'Dark times have come to Hogwarts. After the Dementors’ attack on his cousin Dudley, Harry Potter knows that Voldemort will stop at nothing to find him. There are many who deny the Dark Lord’s return, but Harry is not alone: a secret order gathers at Grimmauld Place to fight against the Dark forces. Harry must allow Professor Snape to teach him how to protect himself from Voldemort’s savage assaults on his mind. But they are growing stronger by the day and Harry is running out of time.', CAST(12.00 AS Decimal(18, 2)), NULL, N'images/HP-and-the-order-of-the-phoenix.jpg', NULL)
INSERT [dbo].[Book] ([Id], [CategoryId], [AuthorId], [Title], [Year], [ISBN], [Summary], [Price], [Discount], [Image], [IsReccomended]) VALUES (13, 1, 4, N'A Game of Thrones', 2011, N'9780007448036', N'Summers span decades. Winter can last a lifetime. And the struggle for the Iron Throne has begun. As Warden of the north, Lord Eddard Stark counts it a curse when King Robert bestows on him the office of the Hand. His honour weighs him down at court where a true man does what he will, not what he must … and a dead enemy is a thing of beauty. The old gods have no power in the south, Stark’s family is split and there is treachery at court. Worse, the vengeance-mad heir of the deposed Dragon King has grown to maturity in exile in the Free Cities. He claims the Iron Throne.', CAST(11.00 AS Decimal(18, 2)), CAST(9.00 AS Decimal(18, 2)), N'images/GoT-1.jpg', 1)
INSERT [dbo].[Book] ([Id], [CategoryId], [AuthorId], [Title], [Year], [ISBN], [Summary], [Price], [Discount], [Image], [IsReccomended]) VALUES (14, 1, 4, N'A Dance With Dragons: Part 1', 2012, N'9780007466061', N'In the aftermath of a colossal battle, new threats are emerging from every direction. Tyrion Lannister, having killed his father, and wrongfully accused of killing his nephew, King Joffrey, has escaped from King’s Landing with a price on his head. To the north lies the great Wall of ice and stone – a structure only as strong as those guarding it. Eddard Stark’s bastard son Jon Snow has been elected 998th Lord Commander of the Night’s Watch. But Jon has enemies both inside and beyond the Wall. And in the east Daenerys Targaryen struggles to hold a city built on dreams and dust.', CAST(11.00 AS Decimal(18, 2)), NULL, N'images/GoT-5.jpg', NULL)
INSERT [dbo].[Book] ([Id], [CategoryId], [AuthorId], [Title], [Year], [ISBN], [Summary], [Price], [Discount], [Image], [IsReccomended]) VALUES (15, 1, 4, N'A Feast for Crows', 2011, N'9780007447862', N'The war in the Seven Kingdoms has burned itself out, but in its bitter aftermath new conflicts spark to life. The Martells of Dorne and the Starks of Winterfell seek vengeance for their dead. Euron Crow’s Eye, as black a pirate as ever raised a sail, returns from the smoking ruins of Valyria to claim the Iron Isles. From the icy north, where Others threaten the Wall, apprentice Maester Samwell Tarly brings a mysterious babe in arms to the Citadel. As plots, intrigue and battle threaten to engulf Westeros, victory will go to the men and women possessed of the coldest steel and the coldest hearts.', CAST(11.00 AS Decimal(18, 2)), NULL, N'images/GoT-4.jpg', NULL)
INSERT [dbo].[Book] ([Id], [CategoryId], [AuthorId], [Title], [Year], [ISBN], [Summary], [Price], [Discount], [Image], [IsReccomended]) VALUES (16, 1, 4, N'A Clash of Kings', 2011, N'9780007447831', N'Throughout Westeros, the cold winds are rising. From the ancient citadel of Dragonstone to the forbidding lands of Winterfell, chaos reigns as pretenders to the Iron Throne of the Seven Kingdoms stake their claims through tempest, turmoil and war. As a prophecy of doom cuts across the sky – a comet the colour of blood and flame – five factions struggle for control of a divided land. Brother plots against brother and the dead rise to walk in the night.', CAST(10.00 AS Decimal(18, 2)), NULL, N'images/GoT-4.jpg', NULL)
INSERT [dbo].[Book] ([Id], [CategoryId], [AuthorId], [Title], [Year], [ISBN], [Summary], [Price], [Discount], [Image], [IsReccomended]) VALUES (18, 1, 4, N'A Storm of Swords: Part 2', 2011, N'9780007447855', N'The Starks are scattered. Robb Stark may be King in the North, but he must bend to the will of the old tyrant Walder Frey if he is to hold his crown. And while his youngest sister, Arya, has escaped the clutches of the depraved Cersei Lannister and her son, the capricious boy-king Joffrey, Sansa Stark remains their captive. Meanwhile, across the ocean, Daenerys Stormborn, the last heir of the Dragon King, delivers death to the slave-trading cities of Astapor and Yunkai as she approaches Westeros with vengeance in her heart.', CAST(10.00 AS Decimal(18, 2)), NULL, N'images/GoT-3.jpg', NULL)
INSERT [dbo].[Book] ([Id], [CategoryId], [AuthorId], [Title], [Year], [ISBN], [Summary], [Price], [Discount], [Image], [IsReccomended]) VALUES (19, 2, 5, N'The Hitchhiker''s Guide to the Galaxy', 2009, N'9675834425109', N'Go on a galactic adventure with the last human on Earth, his alien best friend, and a depressed android. Introducing younger readers to The Hitchhiker''s Guide to the Galaxy , this YA edition of the funny sci-fi classic includes an introduction from Artemis Fowl author Eoin Colfer. One Thursday lunchtime the Earth gets unexpectedly demolished to make way for a new hyperspace bypass. It''s the final straw for Arthur Dent, who has already had his house bulldozed that morning. But for Arthur, that is only the beginning . . . In the seconds before global obliteration, Arthur is plucked from the planet by his friend Ford Prefect - and together the pair venture out across the galaxy on the craziest, strangest road trip of all time! Totally hilarious, The Hitchhiker''s Guide to the Galaxy has been a radio show, TV show, stage play, comic book and film, and is and a work of utter comic genius from Douglas Adams. ', CAST(8.00 AS Decimal(18, 2)), NULL, N'images/Hitchhikers-guide.jpg', 1)
INSERT [dbo].[Book] ([Id], [CategoryId], [AuthorId], [Title], [Year], [ISBN], [Summary], [Price], [Discount], [Image], [IsReccomended]) VALUES (20, 2, 5, N'The Restaurant at the End of the Universe', 2002, N'7456334890789', N'Following the smash-hit sci-fi comedy The Hitchhiker''s Guide to the Galaxy , The Restaurant at the End of the Universe is the second part in Douglas Adams'' multi-media phenomenon and cult classic series. If you''ve done six impossible things this morning, why not round it off with breakfast at Milliaways, the Restaurant at the end of the Universe? Which is exactly what the crew of the Heart of Gold plan to do. There''s just the small matter of escaping the Vogans, avoiding being taken to the most totally evil world in the Galaxy and teaching a spaceship how to make a proper cup of tea. And did anyone actually make a reservation? Follow Arthur Dent''s galactic (mis)adventures in the rest of the trilogy with five parts: Life, the Universe and Everything, So Long, and Thanks for All the Fish, and Mostly Harmless. ', CAST(7.00 AS Decimal(18, 2)), CAST(5.00 AS Decimal(18, 2)), N'images/Restaurant-at-the-end-of-the-universe.jpg', NULL)
INSERT [dbo].[Book] ([Id], [CategoryId], [AuthorId], [Title], [Year], [ISBN], [Summary], [Price], [Discount], [Image], [IsReccomended]) VALUES (21, 2, 6, N'Dark Frontiers', 2019, N'8657456734876', N'Continuing the definitive space opera anthology series. Today''s most popular writers produce new stories in their most famous universes, alongside essential and seminal short fiction from past masters. The definitive collection of explorers and soldiers, charting the dark frontiers of our expanding universe. Amongst the infinite stars we find epic sagas of wars, tales of innermost humanity, and the most powerful of desires - our need to create a better world. The second volume of seminal short science fiction, featuring twenty-six new stories from series such as Wayfarers, Confederation, The Lost Fleet, Waypoint Kangaroo, Ender, Dream Park, the Polity and more.', CAST(23.00 AS Decimal(18, 2)), NULL, N'images/Dark-frontiers.jpg', NULL)
INSERT [dbo].[Book] ([Id], [CategoryId], [AuthorId], [Title], [Year], [ISBN], [Summary], [Price], [Discount], [Image], [IsReccomended]) VALUES (22, 2, 6, N'Infinite Stars', 2017, N'6758453675876', N'The seductive thrill of uncharted worlds, of distant galaxies. and the unknown threats that lurk in the vastness of the cosmos. From Foundation to Lensman, Star Wars to Guardians of the Galaxy, space opera continues to exert its magnetic pull on us all. INFINITE STARS This is the definitive collection of original short stories by many of today''s finest authors, writing brand new adventures set in their most famous series. Herein lie canonical tales of the Honorverse, the Lost Fleet, Dune, Vatta''s War, Ender Wiggin, the Legion of the Damned, the Imperium, and more. Also included are past masterpieces by authors whose works defined the genre, including a Miles Vorkosigan adventure, a story from the author of the Dragonriders of Pern, and a rare tale co-authored by the screenwriter for The Empire Strikes Back.', CAST(22.00 AS Decimal(18, 2)), CAST(19.00 AS Decimal(18, 2)), N'images/Infinite-stars.jpg', 1)
INSERT [dbo].[Book] ([Id], [CategoryId], [AuthorId], [Title], [Year], [ISBN], [Summary], [Price], [Discount], [Image], [IsReccomended]) VALUES (23, 2, 6, N'If it bleeds', 2017, N'7869587630981', N'Over the centuries, extraterrestrial hunters of the Yautja race-also known as the Predators-have encountered (and stalked) humans on Earth and in the depths of space. Offered here are sixteen all-new stories of such hunts, written by many of today''s most extraordinary authors: Kevin J. Anderson Jennifer Brozek Larry Correia Mira Grant Tim Lebbon Jonathan Maberry Andrew Mayne Weston Ochse S. D. Perry Steve Perry Jeremy Robinson John Shirley Bryan Thomas Schmidt and Holly Roberds Peter J. Wacks and David Boop Wendy N. Wagner Dayton Ward Inspired by the events of the original Predator movies, graphic novels, and novels, these adventures pit hunter against prey in life-and-death struggles where there can be only one victor.   ', CAST(12.00 AS Decimal(18, 2)), NULL, N'images/If-it-bleeds.jpg', NULL)
INSERT [dbo].[Book] ([Id], [CategoryId], [AuthorId], [Title], [Year], [ISBN], [Summary], [Price], [Discount], [Image], [IsReccomended]) VALUES (24, 2, 7, N'A Deepness In the Sky', 2016, N'8567743295764', N'This is science fiction on the grandest of scales - a cast of thousands set across hundreds of years and in the farthest reaches of Human Space. A prequel to his earlier novel A Fire Upon the Deep, this new novel is epic in scope and a thoroughly riveting read. A Deepness In the Sky is the story of Pham Nuwen, a small cog in the interstellar trading fleet of the Queng Ho. Both they and the Emergents are orbiting Arachna, a dormant planet which will shortly wake up when its On/Off star relights after decades of darkness. Both groups hope to exploit the coming age of technology and commerce on Arachna. But while the Queng Ho seek only to trade aggressively, the Emergents plans are far more sinister, amounting to little short of genocide . . . ', CAST(15.00 AS Decimal(18, 2)), NULL, N'images/A-deepness-in-the-sky.jpg', 1)
INSERT [dbo].[Book] ([Id], [CategoryId], [AuthorId], [Title], [Year], [ISBN], [Summary], [Price], [Discount], [Image], [IsReccomended]) VALUES (25, 2, 7, N'Zones of Thought', 2010, N'6573452983409', N'One human colony has been experimenting to find a path to the "Transcend", where intelligence and power are so great as to seem godlike. Instead they release the Blight, an evil power, from a billion-year captivity.'' Publisher''s Weekly In DEEPNESS, ''the story has the same sense of epic vastness despite happening mostly in one isolated solar system. Here there''s a world of intelligent spider creatures who traditionally hibernate through the "Deepest Darkness" of their strange variable sun''s long "off" periods, when even the atmosphere freezes. Now, science offers them an alternative. Meanwhile, attracted by spider radio transmissions, two human starfleets come exploring - merchants hoping for customers and tyrants who want slaves. Their inevitable clash leaves both fleets crippled, with the power in the wrong hands, which leads to a long wait in space until the spiders develop exploitable technology.', CAST(24.00 AS Decimal(18, 2)), NULL, N'images/zones-of-thought.jpg', NULL)
INSERT [dbo].[Book] ([Id], [CategoryId], [AuthorId], [Title], [Year], [ISBN], [Summary], [Price], [Discount], [Image], [IsReccomended]) VALUES (26, 3, 1, N'Sense and Sensibility', 2003, N'6574819245378', N'The wit of Jane Austen has for partner the perfection of her taste'' Virginia Woolf Jane Austen''s subtle and witty novel of secrets and suppression, lies and seduction, brilliantly portrays a world where rigid social convention clashes with the impulses of the heart. It tells the story of two very different sisters who find themselves thrown into an unkind world when their father dies. Marianne, wild and impulsive, falls dangerously in love, while Elinor suffers her own private heartbreak but conceals her true feelings, even from those closest to her.', CAST(11.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), N'images/sense-and-sensibility.jpg', NULL)
INSERT [dbo].[Book] ([Id], [CategoryId], [AuthorId], [Title], [Year], [ISBN], [Summary], [Price], [Discount], [Image], [IsReccomended]) VALUES (27, 3, 1, N'Emma', 2019, N'7683456612954', N'Jane Austen has great fun with this novel, teasing at the social mores of her time, where the hunting of a suitable partner is an all-consuming game. Emma Woodhouse is a confident, elitist young woman, whose self-belief leads to a series of romantic misunderstandings as she makes and breaks engagements for her companion Harriet Smith. Emma assumes that Elton desires to marry Harriet, but actually Elton really wants Emma. Frank Churchill too tries to win her, but Emma falls for Mr. Knightley, whom everyone thinks is in love Jane Fairfax. In the end, everything all is mended, as Emma and Mr. Knightley finally get engaged, and Harriet and Robert Martin are brought back together again. ', CAST(13.00 AS Decimal(18, 2)), NULL, N'images/Emma.jpg', NULL)
INSERT [dbo].[Book] ([Id], [CategoryId], [AuthorId], [Title], [Year], [ISBN], [Summary], [Price], [Discount], [Image], [IsReccomended]) VALUES (28, 3, 1, N'Pride and Prejudice', 2016, N'6398270195327', N'One of BBC''s 100 Novels That Shaped Our World. Jane Austen''s best-loved novel is an unforgettable story about the inaccuracy of first impressions, the power of reason, and above all the strange dynamics of human relationships and emotions. Part of the Macmillan Collector''s Library; a series of stunning, clothbound, pocket sized classics with gold foiled edges and ribbon markers. These beautiful books make perfect gifts or a treat for any book lover. This edition is illustrated by Hugh Thomson and features an afterword by author and critic, Henry Hitchings. A tour de force of wit and sparkling dialogue, Pride and Prejudice shows how the headstrong Elizabeth Bennet and the aristocratic Mr Darcy must have their pride humbled and their prejudices dissolved before they can acknowledge their love for each other.   ', CAST(14.00 AS Decimal(18, 2)), NULL, N'images/pride-and-prejudice.jpg', 1)
INSERT [dbo].[Book] ([Id], [CategoryId], [AuthorId], [Title], [Year], [ISBN], [Summary], [Price], [Discount], [Image], [IsReccomended]) VALUES (29, 3, 1, N'Persuasion', 2016, N'7834265016387', N'Jane Austen''s most mature and wickedly satirical final novel with gorgeous illustrations. Part of the Macmillan Collector''s Library; a series of stunning, clothbound, pocket sized classics with gold foiled edges and ribbon markers. These beautiful books make perfect gifts or a treat for any book lover. This edition features gorgeous illustrations by Hugh Thomson and an afterword by author and critic Henry Hitchings. Persuasion follows the story of Anne Elliott, who as a teenager was engaged to a seemingly ideal man, Frederick Wentworth. But after being persuaded by her friend Lady Russell that he is too poor to be a suitable match, Anne ends their engagement. When they are reacquainted eight years later, their circumstances are transformed: Frederick is returning triumphantly from the Napoleonic War, while Anne''s fortunes are floundering. Will their past regrets prevent them from finding future happiness?', CAST(14.00 AS Decimal(18, 2)), CAST(12.00 AS Decimal(18, 2)), N'images/persuasion.jpg', NULL)
INSERT [dbo].[Book] ([Id], [CategoryId], [AuthorId], [Title], [Year], [ISBN], [Summary], [Price], [Discount], [Image], [IsReccomended]) VALUES (30, 4, 3, N'Adventures of Huckleberry Finn', 2016, N'6581132650934', N'Widely considered one of the greatest American novels, Adventures of Huckleberry Finn tells the story of Huck Finn and his companion, the slave Jim, as they journey down the Mississippi river after running away from Huck''s alcoholic father and Jim''s owners. As they travel, they encounter a floating house, feuding families and cunning grifters, but more importantly Huck gets to know Jim and regard him as a friend and equal, overcoming the racial prejudices of the time, in a landmark narrative which poignantly addresses the issues of growing up and finding freedom.   ', CAST(7.00 AS Decimal(18, 2)), NULL, N'images/huckleberry-finn.jpg', NULL)
INSERT [dbo].[Book] ([Id], [CategoryId], [AuthorId], [Title], [Year], [ISBN], [Summary], [Price], [Discount], [Image], [IsReccomended]) VALUES (31, 4, 3, N'Adventures of Tom Sawyer', 2008, N'9435287619065', N'In this enduring and internationally popular novel, Mark ogaincombines social satire and dime-novel sensation with a rhapsody on boyhood and on America''s pre-industrial past. Tom Sawyer is resilient, enterprising, and vainglorious. In a series of adventures along the banks of the Mississippi, he usually manages to come out on top. From petty triumphs over his friends and over his long-suffering Aunt Polly, to his intervention in a murder trial, Tom engages readers of all ages. He has long been a defining figure in the American cultural imagination. Alongside the charm and the excitement, Twain raises serious questions about community, race, and the past. Above all, the book invites discussion of the way in which childhood is invoked to counter the uncomfortable truths of the adult world.', CAST(10.00 AS Decimal(18, 2)), NULL, N'images/tom-sawyer.jpg', NULL)
INSERT [dbo].[Book] ([Id], [CategoryId], [AuthorId], [Title], [Year], [ISBN], [Summary], [Price], [Discount], [Image], [IsReccomended]) VALUES (32, 3, 3, N'Mark Twain Collection', 2018, N'3298409158273', N'This six-volume collection features many of Mark Twain''s best-loved novels, including ''The Adventures of Tom Sawyer'', ''The Adventures of Huckleberry Finn'' and ''The Prince and the Pauper''.', CAST(60.00 AS Decimal(18, 2)), CAST(52.00 AS Decimal(18, 2)), N'images/mark-twain-collection.jpg', 1)
INSERT [dbo].[Book] ([Id], [CategoryId], [AuthorId], [Title], [Year], [ISBN], [Summary], [Price], [Discount], [Image], [IsReccomended]) VALUES (33, 3, 8, N'The Importance of being Earnest', 2000, N'8236748129365', N'Witty and buoyant comedy of manners is brilliantly plotted from its effervescent first act to its hilarious denouement, and filled with some of literature''s most famous epigrams. Widely considered Wilde''s most perfect work, the play is reprinted here from an authoritative early British edition. Note to the Dover Edition.', CAST(3.00 AS Decimal(18, 2)), NULL, N'images/earnest.jpg', NULL)
INSERT [dbo].[Book] ([Id], [CategoryId], [AuthorId], [Title], [Year], [ISBN], [Summary], [Price], [Discount], [Image], [IsReccomended]) VALUES (34, 3, 8, N'The Happy Prince', 2019, N'3417820984378', N'High above the city, on a tall column, stood the statue of the Happy Prince. He was gilded all over with thin leaves of fine gold, for eyes he had two bright sapphires, and a large red ruby glowed on his sword-hilt. The Happy Prince and Other Tales is a collection of five stories: ''The Happy Prince'', ''The Nightingale and the Rose'', ''The Selfish Giant'', ''The Devoted Friend'', and ''The Remarkable Rocket''. The Happy Prince stars the statue of the Prince, who persuades a swallow to deliver his gold and jewels to the poor and needy in his city. Liberty of London and Faber & Faber both offer peerless quality and unrivalled originality. Liberty of London''s patterned, print and floral fabrics are world famous. This partnership brings together the best writers with one of the foremost design teams to create books that will be coveted by artistic shoppers and book lovers the world over. ', CAST(11.00 AS Decimal(18, 2)), CAST(10.00 AS Decimal(18, 2)), N'images/happy-prince.jpg', 1)
INSERT [dbo].[Book] ([Id], [CategoryId], [AuthorId], [Title], [Year], [ISBN], [Summary], [Price], [Discount], [Image], [IsReccomended]) VALUES (35, 3, 8, N'The Complete Short Stories', 2010, N'6743989231067', N'''Wilde did not converse - he told tales.'' Oscar Wilde was already famous as a brilliant wit and raconteur when he first began to publish his short stories in the late 1880s. They have never lacked readers and admirers, George Orwell and W. B. Yeats among them. The stories give free rein to Wilde''s originality, literary skill, and sophistication. They include poignant fairy-tales such as ''The Happy Prince'' and ''The Selfish Giant'', and the extravagant comedy and social observation of ''Lord Arthur Savile''s Crime'' and ''The Canterville Ghost''. They also encompass the daring narrative experiments of ''The Portrait of Mr. W. H.'', Wilde''s fictional investigation into the identity of the dedicatee of Shakespeare''s sonnets, and the ''Poems in Prose'', based on the Gospel stories. This edition demonstrates the centrality of Wilde''s shorter fiction in his literary career, and his continuing development and experimentation with the short story format. Combining myth, romance, and irony, Wilde''s stories enthral and challenge the reader. ABOUT THE SERIES: For over 100 years Oxford World''s Classics has made available the widest range of literature from around the globe. Each affordable volume reflects Oxford''s commitment to scholarship, providing the most accurate text plus a wealth of other valuable features, including expert introductions by leading authorities, helpful notes to clarify the text, up-to-date bibliographies for further study, and much more.   ', CAST(10.00 AS Decimal(18, 2)), NULL, N'images/short-stories-wilde.jpg', NULL)
INSERT [dbo].[Book] ([Id], [CategoryId], [AuthorId], [Title], [Year], [ISBN], [Summary], [Price], [Discount], [Image], [IsReccomended]) VALUES (37, 3, 8, N'An Ideal Husband', 2001, N'2342765989145', N'Wilde''s scintillating drawing-room comedy revolves around a blackmail scheme that forces a married couple to reexamine their moral standards. A supporting cast of young lovers, society matrons, and a formidable femme fatale exchange sparkling repartee, keeping the action of the play at a lively pace.', CAST(3.00 AS Decimal(18, 2)), NULL, N'images/ideal-husband.jpg', NULL)
INSERT [dbo].[Book] ([Id], [CategoryId], [AuthorId], [Title], [Year], [ISBN], [Summary], [Price], [Discount], [Image], [IsReccomended]) VALUES (38, 3, 8, N'The Picture of Dorian Gray', 2003, N'5483821956492', N'A triumph of execution ... one of the best narratives of the "double life" of a Victorian gentleman'' Peter Ackroyd Oscar Wilde''s alluring novel of decadence and sin was a succès de scandale on publication. It follows Dorian Gray who, enthralled by his own exquisite portrait, exchanges his soul for eternal youth and beauty. Influenced by his friend Lord Henry Wotton, he is drawn into a corrupt double life, indulging his desires in secret while remaining a gentleman in the eyes of polite society. Only his portrait bears the traces of his depravity. This definitive edition includes a selection of contemporary reviews condemning the novel''s immorality.', CAST(6.00 AS Decimal(18, 2)), NULL, N'images/dorian-gray.jpg', NULL)
INSERT [dbo].[Book] ([Id], [CategoryId], [AuthorId], [Title], [Year], [ISBN], [Summary], [Price], [Discount], [Image], [IsReccomended]) VALUES (39, 4, 9, N'Fantastic Mr Fox', 2016, N'5774832293565', N'"A true genius . . . Roald Dahl is my hero" - David Walliams Boggis is an enormously fat chicken farmer who only eats boiled chickens smothered in fat. Bunce is a duck-and-goose farmer whose dinner gives him a beastly temper. Bean is a turkey-and-apple farmer who only drinks gallons of strong cider. Mr Fox is so clever that every evening he creeps down into the valley and helps himself to food from their farms - and those GHASTLY farmers can''t catch him! Now the farmers have hatched a plan to BANG-BANG-BANG shoot Mr Fox dead! But, just when they think Mr Fox can''t possibly escape, he makes a FANTASTIC plan of his own . . . Listen to FANTASTIC MR FOX and other Roald Dahl audiobooks read by some very famous voices, including Kate Winslet, David Walliams and Steven Fry - plus there are added squelchy sound-effects from Pinewood Studios! Look out for new Roald Dahl apps in the App store and Google Play- including the disgusting TWIT OR MISS! and HOUSE OF TWITS inspired by the revolting Twits. ', CAST(8.00 AS Decimal(18, 2)), NULL, N'images/mr-fox.jpg', 1)
INSERT [dbo].[Book] ([Id], [CategoryId], [AuthorId], [Title], [Year], [ISBN], [Summary], [Price], [Discount], [Image], [IsReccomended]) VALUES (40, 4, 9, N'Matilda', 2016, N'9556473342767', N'"A true genius . . . Roald Dahl is my hero" - David Walliams "So Matilda''s strong young mind continued to grow, nurtured by the voices of all those authors who had sent their books out into the world like ships on the sea. These books gave her a hopeful and comforting message: You are not alone." She is the world''s most famous bookworm, no thanks to her ghastly parents. Her father thinks she''s a little scab. Her mother spends all afternoon playing bingo. And her headmistress, Miss Trunchbull? She''s the worst of all. She''s a big bully, who thinks all her pupils are rotten and locks them in the dreaded Chokey. Despite these beastly grownups trying to push her down, Matilda is an extraordinary girl with a magical mind. And she''s had enough. So all the terrible adults had better watch out, because she''s going to teach them a lesson they''ll never forget! Now you can listen toRoald Dahl audiobooks read by some very famous voices, including Kate Winslet, David Walliams and Steven Fry - plus there are added squelchy soundeffects from Pinewood Studios!', CAST(9.00 AS Decimal(18, 2)), CAST(8.00 AS Decimal(18, 2)), N'images/matilda.jpg', NULL)
INSERT [dbo].[Book] ([Id], [CategoryId], [AuthorId], [Title], [Year], [ISBN], [Summary], [Price], [Discount], [Image], [IsReccomended]) VALUES (41, 4, 9, N'The Twits', 2016, N'7685993415287', N'Phizzwhizzing new cover look and branding for the World''s NUMBER ONE Storyteller! Mr Twit is a foul and smelly man with bits of cornflake and sardine in his beard. Mrs Twit is a horrible old hag with a glass eye. Together they make the nastiest couple you could ever hope not to meet. Down in their garden, the Twits keep Muggle-Wump the monkey and his family locked in a cage. But not for much longer, because the monkeys are planning to trick the terrible Twits and make their escape, once and for all . . . And now you can listen to THE TWITS and other Roald Dahl audiobooks read by some very famous voices, including Kate Winslet, David Walliams and Steven Fry - plus there are added squelchy soundeffects from Pinewood Studios! Also look out for new Roald Dahl apps in the App store and Google Play- including the disgusting TWIT OR MISS! and HOUSE OF TWITS inspired by the revolting Twits. ', CAST(8.00 AS Decimal(18, 2)), NULL, N'images/twits.jpg', NULL)
INSERT [dbo].[Book] ([Id], [CategoryId], [AuthorId], [Title], [Year], [ISBN], [Summary], [Price], [Discount], [Image], [IsReccomended]) VALUES (42, 4, 9, N'Boy', 2016, N'5677483927573', N'Phizzwhizzing new cover look and branding for the World''s NUMBER ONE Storyteller! BOY, Roald Dahl''s bestselling autobiography, is full of hilarious anecdotes about his childhood and school days, illustrated by Quentin Blake. As a boy, all sorts of unusual things happened to Roald Dahl. There was the time he and four school friends got their revenge on beastly Mrs Prachett in her sweet shop. There are stories of holidays in fishing boats, African adventures and the days of tasting chocolate for Cadbury''s. You''ll hear tales of horrible school bullies and the motor-car accident when Roald''s nose was nearly sliced clean off . . . Roald Dahl vividly shares his memories; some are funny. Some are painful. Some are unpleasant. All are true. You can listen to all of Roald Dahl''s stories on Puffin Audiobooks, read by some very famous voices, including Kate Winslet, David Walliams and Steven Fry - plus there are added squelchy sound effects from Pinewood Studios! Also look out for new Roald Dahl apps in the App store and Google Play- including the disgusting TWIT OR MISS! and HOUSE OF TWITS inspired by the revolting Twits. ', CAST(9.00 AS Decimal(18, 2)), CAST(7.00 AS Decimal(18, 2)), N'images/boy.jpg', NULL)
INSERT [dbo].[Book] ([Id], [CategoryId], [AuthorId], [Title], [Year], [ISBN], [Summary], [Price], [Discount], [Image], [IsReccomended]) VALUES (43, 5, 10, N'The Institute', 2019, N'3647509112875', N'Deep in the woods of Maine, there is a dark state facility where kids, abducted from across the United States, are incarcerated. In the Institute they are subjected to a series of tests and procedures meant to combine their exceptional gifts – telepathy, telekinesis – for concentrated effect. Luke Ellis is the latest recruit. He’s just a regular 12-year-old, except he’s not just smart, he’s super-smart. And he has another gift which the Institute wants to use… Far away in a small town in South Carolina, former cop Tim Jamieson has taken a job working for the local sheriff. He’s basically just walking the beat. But he’s about to take on the biggest case of his career. Back in the Institute’s downtrodden playground and corridors where posters advertise ‘just another day in paradise’, Luke, his friend Kalisha and the other kids are in no doubt that they are prisoners, not guests. And there is no hope of escape. But great events can turn on small hinges and Luke is about to team up with a new, even younger recruit, Avery Dixon, whose ability to read minds is off the scale. While the Institute may want to harness their powers for covert ends, the combined intelligence of Luke and Avery is beyond anything that even those who run the experiments – even the infamous Mrs Sigsby – suspect.', CAST(14.00 AS Decimal(18, 2)), NULL, N'images/institute-king.jpg', NULL)
INSERT [dbo].[Book] ([Id], [CategoryId], [AuthorId], [Title], [Year], [ISBN], [Summary], [Price], [Discount], [Image], [IsReccomended]) VALUES (44, 5, 10, N'It', 2011, N'6759481124789', N't is a group of children who see – and feel – what makes Derry so horribly different. In the storm drains, in the sewers, IT lurks, taking on the shape of every nightmare, each one’s deepest dread. Sometimes is appears as an evil clown named Pennywise and sometimes IT reaches up, seizing, tearing, killing . . . Time passes and the children grow up, move away and forget. Until they are called back, once more to confront IT as IT stirs and coils in the sullen depths of their memories, emerging again to make their past nightmares a terrible present reality.', CAST(12.00 AS Decimal(18, 2)), NULL, N'images/it-king.jpg', NULL)
INSERT [dbo].[Book] ([Id], [CategoryId], [AuthorId], [Title], [Year], [ISBN], [Summary], [Price], [Discount], [Image], [IsReccomended]) VALUES (45, 5, 10, N'The Shining', 2013, N'3245409678532', N'Danny is only five years old, but in the words of old Mr Hallorann he is a ‘shiner’, aglow with psychic voltage. When his father becomes caretaker of the Overlook Hotel, Danny’s visions grow out of control. As winter closes in and blizzards cut them off, the hotel seems to develop a life of its own. It is meant to be empty. So who is the lady in Room 217 and who are the masked guests going up and down in the elevator? And why do the hedges shaped like animals seem so alive? Somewhere, somehow, there is an evil force in the hotel – and that, too, is beginning to shine …', CAST(11.00 AS Decimal(18, 2)), NULL, N'images/shining-king.jpg', NULL)
INSERT [dbo].[Book] ([Id], [CategoryId], [AuthorId], [Title], [Year], [ISBN], [Summary], [Price], [Discount], [Image], [IsReccomended]) VALUES (46, 5, 11, N'The Guest List', 2020, N'4988596253075', N'On an island off the windswept Irish coast, guests gather for the wedding of the year – the marriage of Jules Keegan and Will Slater. The wedding cake has barely been cut when one of the guests is found dead. And as a storm unleashes its fury on the island, everyone is trapped.', CAST(13.00 AS Decimal(18, 2)), NULL, N'images/guest-list.jpg', NULL)
INSERT [dbo].[Book] ([Id], [CategoryId], [AuthorId], [Title], [Year], [ISBN], [Summary], [Price], [Discount], [Image], [IsReccomended]) VALUES (47, 5, 11, N'The Hunting Party', 2019, N'7384162038451', N'In a remote hunting lodge, deep in the Scottish wilderness, old friends gather. The beautiful one
. The golden couple
. The volatile one
. The new parents. 
The quiet one. 
The city boy.
The outsider.

The victim.

Not an accident – a murder among friends.', CAST(8.00 AS Decimal(18, 2)), NULL, N'images/hunting-party.jpg', NULL)
SET IDENTITY_INSERT [dbo].[Book] OFF
GO
SET IDENTITY_INSERT [dbo].[Category] ON 

INSERT [dbo].[Category] ([Id], [CategoryName]) VALUES (1, N'Fantasy')
INSERT [dbo].[Category] ([Id], [CategoryName]) VALUES (2, N'Science Fiction')
INSERT [dbo].[Category] ([Id], [CategoryName]) VALUES (3, N'Classics')
INSERT [dbo].[Category] ([Id], [CategoryName]) VALUES (4, N'Children''s')
INSERT [dbo].[Category] ([Id], [CategoryName]) VALUES (5, N'Thriller')
SET IDENTITY_INSERT [dbo].[Category] OFF
GO
INSERT [dbo].[Images] ([Id], [Image]) VALUES (1, N'images/logo-purple.png')
INSERT [dbo].[Images] ([Id], [Image]) VALUES (2, N'images/free-book-library.jpg')
INSERT [dbo].[Images] ([Id], [Image]) VALUES (3, N'images/bookstore-location.jpg')
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [Password], [DeliveryAddress]) VALUES (1, N'John', N'Smith', N'smith@gmail.com', N'168ba62056a59717a773abe538dd6677', N'test address')
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [Password], [DeliveryAddress]) VALUES (2, N'Bob', N'Miller', N'miller@gmail.com', N'f0af962ddbc82430e947390b2f3f6e49', N'test address')
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [Password], [DeliveryAddress]) VALUES (3, N'Sandra', N'Brown', N'brown@gmail.com', N'6ff47afa5dc7daa42cc705a03fca8a9b', N'test address')
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [Password], [DeliveryAddress]) VALUES (4, N'Pete', N'Stuart', N'stuart@gmail.com', N'407cb3436f86acc235172e57027af714', N'test address')
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [Password], [DeliveryAddress]) VALUES (10, N'Tomislav', N'Duric', N'tomislav.djuric@gmail.com', N'a280ed9f52d6c1978608271b7d51f7a3', N'15 Curragh Birin')
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [Password], [DeliveryAddress]) VALUES (1017, N'Lili', N'Parsons', N'parsons@gmail.com', N'4119ddd04b8b7a0c2791a10536aac3cc', N'test')
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [Password], [DeliveryAddress]) VALUES (1018, N'Pero', N'Peric', N'petar1990@hotmail.com', N'c4ca4238a0b923820dcc509a6f75849b', N'Kura Birin')
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [Password], [DeliveryAddress]) VALUES (1019, N'Klara', N'Duric', N'masumi88@gmail.com', N'098f6bcd4621d373cade4e832627b4f6', N'Vincenta iz Kastva 10')
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [Password], [DeliveryAddress]) VALUES (1020, N'test', N'tester', N't@t.t', N'32bf0e6fcff51e53bd74e70ba1d622b2', N'test address')
INSERT [dbo].[User] ([Id], [FirstName], [LastName], [Email], [Password], [DeliveryAddress]) VALUES (1021, N'new web api test', N'xdg', N'xdfg@xdrfg.xdf', N'098f6bcd4621d373cade4e832627b4f6', N'fcbhn')
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Basket]  WITH CHECK ADD  CONSTRAINT [FK_Basket_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Basket] CHECK CONSTRAINT [FK_Basket_User]
GO
ALTER TABLE [dbo].[BasketItem]  WITH CHECK ADD  CONSTRAINT [FK_BasketItem_Basket] FOREIGN KEY([BasketId])
REFERENCES [dbo].[Basket] ([Id])
GO
ALTER TABLE [dbo].[BasketItem] CHECK CONSTRAINT [FK_BasketItem_Basket]
GO
ALTER TABLE [dbo].[BasketItem]  WITH CHECK ADD  CONSTRAINT [FK_BasketItem_Book] FOREIGN KEY([BookId])
REFERENCES [dbo].[Book] ([Id])
GO
ALTER TABLE [dbo].[BasketItem] CHECK CONSTRAINT [FK_BasketItem_Book]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_Author] FOREIGN KEY([AuthorId])
REFERENCES [dbo].[Author] ([Id])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_Author]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_Category] FOREIGN KEY([CategoryId])
REFERENCES [dbo].[Category] ([Id])
GO
ALTER TABLE [dbo].[Book] CHECK CONSTRAINT [FK_Book_Category]
GO
