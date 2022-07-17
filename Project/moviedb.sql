-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 17, 2022 at 10:58 AM
-- Server version: 5.7.36
-- PHP Version: 7.4.26

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `moviedb`
--

-- --------------------------------------------------------

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
CREATE TABLE IF NOT EXISTS `brand` (
  `brand_id` int(10) NOT NULL,
  `brand_name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`brand_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `brand`
--

INSERT INTO `brand` (`brand_id`, `brand_name`) VALUES
(1, 'Disney'),
(2, 'Warner Bros.'),
(3, 'Sony Pictures Entertainment'),
(4, 'Universal Studios'),
(5, 'Lions Gate Entertainment'),
(6, '20th Century Studios'),
(7, 'Paramount Pictures');

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
CREATE TABLE IF NOT EXISTS `cart` (
  `cart_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) NOT NULL,
  `item_count` int(10) DEFAULT NULL,
  `total` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`cart_id`),
  KEY `fk_ca_users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `cartinfo`
--

DROP TABLE IF EXISTS `cartinfo`;
CREATE TABLE IF NOT EXISTS `cartinfo` (
  `cart_id` int(10) NOT NULL AUTO_INCREMENT,
  `movie_id` int(10) NOT NULL,
  `quantity` int(10) DEFAULT NULL,
  KEY `fk_ci_cart` (`cart_id`),
  KEY `fk_ci_movie` (`movie_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `genre`
--

DROP TABLE IF EXISTS `genre`;
CREATE TABLE IF NOT EXISTS `genre` (
  `genre_id` int(10) NOT NULL,
  `genre_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`genre_id`),
  UNIQUE KEY `genre_name` (`genre_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `genre`
--

INSERT INTO `genre` (`genre_id`, `genre_name`) VALUES
(1, 'Action'),
(2, 'Adventure'),
(3, 'Animation'),
(13, 'Comedy'),
(6, 'Drama'),
(5, 'Fantasy'),
(7, 'Horror'),
(8, 'Musical'),
(9, 'Romance'),
(4, 'Sci-Fi'),
(10, 'Sports'),
(11, 'War'),
(12, 'Westerns');

-- --------------------------------------------------------

--
-- Table structure for table `movie`
--

DROP TABLE IF EXISTS `movie`;
CREATE TABLE IF NOT EXISTS `movie` (
  `movie_id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `overview` varchar(1000) DEFAULT NULL,
  `bluray_img` varchar(255) DEFAULT NULL,
  `movie_trailer` varchar(255) DEFAULT NULL,
  `release_date` int(10) DEFAULT NULL,
  `price` decimal(5,2) DEFAULT NULL,
  `duration` int(10) DEFAULT NULL,
  `rating_average` decimal(4,2) DEFAULT NULL,
  `rating_count` int(10) DEFAULT NULL,
  `rated` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`movie_id`),
  UNIQUE KEY `title` (`title`)
) ENGINE=InnoDB AUTO_INCREMENT=51 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `movie`
--

INSERT INTO `movie` (`movie_id`, `title`, `overview`, `bluray_img`, `movie_trailer`, `release_date`, `price`, `duration`, `rating_average`, `rating_count`, `rated`) VALUES
(1, 'AVENGERS: INFINITY WAR', 'The Earth\'s Mightiest Heroes must protect the earth as they are confronted by their most powerful villain yet, the mad Titan Thanos, as he unleashes the power of the Infinity Gauntlet and its six stones upon the planet.\r\n', 'https://images.static-bluray.com/movies/covers/123471_large.jpg?t=1531229688', 'https://youtu.be/6ZfuNTqbHE8', 2018, '26.50', 149, '8.30', NULL, 'PG-13'),
(2, 'AVENGERS: ENDGAME', 'Adrift in space with no food or water, Tony Stark sends a message to Pepper Potts as his oxygen supply starts to dwindle. Meanwhile, the remaining Avengers -- Thor, Black Widow, Captain America and Bruce Banner -- must figure out a way to bring back their vanquished allies for an epic showdown with Thanos -- the evil demigod who decimated the planet and the universe.', 'https://images.static-bluray.com/movies/covers/117429_large.jpg?t=1561646316', 'https://youtu.be/TcMBFSGVi1c', 2019, '26.50', 181, '8.30', NULL, 'PG-13'),
(3, 'BLACK PANTHER', 'T\'Challa, after the death of his father, the King of Wakanda, returns home to the isolated, technologically advanced African nation to succeed to the throne and take his rightful place as king.', 'https://images.static-bluray.com/movies/covers/117437_large.jpg?t=1523368273', 'https://youtu.be/xjDjIWPwcPU', 2018, '39.99', 135, '7.10', NULL, 'PG-13'),
(4, 'AQUAMAN', 'Arthur Curry learns that he is the heir to the underwater kingdom of Atlantis, and must step forward to lead his people and to be a hero to the world.', 'https://images.static-bluray.com/movies/covers/227124_large.jpg?t=1549579555', 'https://youtu.be/WDkg3h8PCVU', 2018, '18.99', 143, '7.60', NULL, 'PG-13'),
(5, 'DEADPOOL 2', 'Foul-mouthed mutant mercenary Wade Wilson (aka Deadpool) brings together a team of fellow mutant rogues to protect a young boy with supernatural abilities from the brutal, time-traveling cyborg Cable.', 'https://images.static-bluray.com/movies/covers/216172_large.jpg?t=1539860446', 'https://youtu.be/D86RtevtfrA', 2018, '13.99', 119, '7.60', NULL, 'R'),
(6, 'JOKER', 'Failed comedian seeks connection as he walks the streets and begins a slow descent into madness.', 'https://images.static-bluray.com/movies/covers/254136_large.jpg?t=1584675974', 'https://youtu.be/zAGVQLHvwOY', 2019, '18.99', 122, '8.20', NULL, 'R'),
(7, 'READY PLAYER ONE', 'When the creator of a virtual reality world called the OASIS dies, he releases a video in which he challenges all OASIS users to find his Easter Egg, which will give the finder his fortune. Wade Watts finds the first clue and starts a race for the Egg, with the help (and sometimes competition) of his OASIS pals, Aech and Art3mis. They are opposed by ruthless corporate giant IOI, whose chief, Sorrento, will stop at nothing to capture control of the OASIS to exploit it for profit.', 'https://images.static-bluray.com/movies/covers/202290_large.jpg?t=1527027002', 'https://youtu.be/cSp1dM2Vj48', 2018, '14.99', 140, '7.90', NULL, 'PG-13'),
(8, 'SPIDER-MAN: FAR FROM HOME', 'After the events of Avengers: Endgame, Peter Parker and his friends go on summer vacation to Europe and there Peter finds himself trying to save his friends against a villain known as Mysterio.', 'https://images.static-bluray.com/movies/covers/246790_large.jpg?t=1567618510', 'https://youtu.be/DYYtuKyMtY8', 2019, '25.99', 129, '7.50', NULL, 'PG-13'),
(9, 'CAPTAIN MARVEL', 'Carol Danvers becomes one of the universe\'s most powerful heroes when Earth is caught in the middle of a galactic war between two alien races.', 'https://images.static-bluray.com/movies/covers/117434_large.jpg?t=1559617700', 'https://youtu.be/Z1BCujX3pw8', 2019, '26.50', 124, '6.70', NULL, 'PG-13'),
(10, 'ANT-MAN AND THE WASP', 'As Scott Lang balances being both a Super Hero and a father, Hope van Dyne and Dr. Hank Pym present an urgent new mission that finds the Ant-Man fighting alongside The Wasp to uncover secrets from their past.', 'https://images.static-bluray.com/movies/covers/209941_large.jpg?t=1536607126', 'https://youtu.be/UUkn-enk2RU', 2018, '26.50', 118, '6.80', NULL, 'PG-13'),
(11, 'SPIDER-MAN: INTO THE SPIDER-VERSE', 'Miles Morales takes up the Spider-Man mantle in order to help several other Spider-Men from other dimensions stop the Kingpin from destroying the universe with a super collider.', 'https://images.static-bluray.com/movies/covers/263728_large.jpg?t=1581472995', 'https://youtu.be/g4Hbz2jLxvQ', 2018, '25.99', 117, '8.40', NULL, 'PG'),
(12, 'SOLO: A STAR WARS STORY', 'During an adventure into a dark criminal underworld, Han Solo meets his future copilot Chewbacca and encounters Lando Calrissian years before joining the Rebellion.', 'https://images.static-bluray.com/movies/covers/247565_large.jpg?t=1570329618', 'https://youtu.be/jPEYpryMp2s', 2018, '26.50', 135, '6.60', NULL, 'PG13'),
(13, 'ONCE UPON A TIME IN HOLLYWOOD', 'A story that takes place in Los Angeles in 1969, at the height of hippy Hollywood. The two lead characters are Rick Dalton, former star of a western TV series, and his longtime stunt double Cliff Booth. Both are struggling to make it in a Hollywood they don’t recognize anymore. But Rick has a new next-door neighbor, who may be a rising star…Sharon Tate.', 'https://images.static-bluray.com/movies/covers/243141_large.jpg?t=1572739703', 'https://youtu.be/ELeMaP8EPAA', 2019, '19.99', 161, '8.10', NULL, 'R'),
(14, 'STAR WARS: THE RISE OF SKYWALKER', 'When it\'s discovered that the evil Emperor Palpatine did not die at the hands of Darth Vader, the rebels must race against the clock to find out his whereabouts. Finn and Poe lead the Resistance to put a stop to the First Order\'s plans to form a new Empire, while Rey anticipates her inevitable confrontation with Kylo Ren.', 'https://images.static-bluray.com/movies/covers/255606_large.jpg?t=1583078654', 'https://youtu.be/8Qn_spdM5Zg', 2020, '26.50', 142, '6.50', NULL, 'PG-13'),
(15, 'JURASSIC WORLD: FALLEN KINGDOM', 'When the island\'s dormant volcano begins roaring to life, Owen and Claire mount a campaign to rescue the remaining dinosaurs from this extinction-level event.', 'https://images.static-bluray.com/movies/covers/208164_large.jpg?t=1532462778', 'https://youtu.be/vn9mMeWcgoM', 2018, '19.98', 128, '6.90', NULL, 'PG-13'),
(16, 'A QUIET PLACE', 'A family lives an isolated existence in utter silence, for fear of an unknown threat that follows and attacks at any sound.', 'https://images.static-bluray.com/movies/covers/202647_large.jpg?t=1527850305', 'https://youtu.be/WR7cc5t7tv8', 2018, '11.99', 90, '7.90', NULL, 'PG-13'),
(17, 'VENOM', 'Journalist Eddie Brock is trying to take down Carlton Drake, the notorious and brilliant founder of the Life Foundation. While investigating one of Drake\'s experiments, Eddie\'s body merges with the alien Venom -- leaving him with superhuman strength and power. Twisted, dark and fueled by rage, Venom tries to control the new and dangerous abilities that Eddie finds so intoxicating.', 'https://images.static-bluray.com/movies/covers/217217_large.jpg?t=1542948090', 'https://youtu.be/u9Mv98Gr5pY', 2018, '25.99', 112, '6.70', NULL, 'PG-13'),
(18, 'JOHN WICK: CHAPTER 3 - PARABELLUM', 'John Wick is on the run after killing a member of the assassins\' guild, and with a $14 million price tag on his head, he is the target of hit men and women everywhere.', 'https://images.static-bluray.com/movies/covers/243123_large.jpg?t=1564477386', 'https://youtu.be/M7XM597XO94', 2019, '14.99', 131, '7.90', NULL, 'R'),
(19, 'SHAZAM!', 'We all have a superhero inside us, it just takes a bit of magic to bring it out. In Billy Batson\'s case, by shouting out one word - SHAZAM! - this streetwise 14-year-old foster kid can turn into the adult superhero Shazam.', 'https://images.static-bluray.com/movies/covers/240142_large.jpg?t=1616794226', 'https://youtu.be/go6GEIrcvFY', 2019, '18.94', 132, '7.50', NULL, 'PG-13'),
(20, 'GODZILLA: KING OF THE MONSTERS', 'Members of the crypto-zoological agency Monarch face off against a battery of god-sized monsters, including the mighty Godzilla, who collides with Mothra, Rodan, and his ultimate nemesis, the three-headed King Ghidorah. When these ancient super-species-thought to be mere myths-rise again, they all vie for supremacy, leaving humanity\'s very existence hanging in the balance.', 'https://images.static-bluray.com/movies/covers/244444_large.jpg?t=1563570061', 'https://youtu.be/QFxN2oDKk0E', 2019, '18.94', 132, '6.70', NULL, 'PG-13'),
(21, 'TENET', 'Set in “the afterlife” of a world of international espionage, “Tenet” follows Washington’s operative as he races against the clock to prevent World War III.', 'https://images.static-bluray.com/movies/covers/275504_large.jpg?t=1604957814', 'https://youtu.be/AZGcmvrTX9M', 2020, '22.98', 150, '7.50', NULL, 'PG-13'),
(22, 'SPIDER-MAN: NO WAY HOME', 'With Spider-Man\'s identity now revealed, Peter asks Doctor Strange for help. When a spell goes wrong, dangerous foes from other worlds start to appear, forcing Peter to discover what it truly means to be Spider-Man.', 'https://images.static-bluray.com/movies/covers/289848_large.jpg?t=1649750133', 'https://youtu.be/OB3g37GTALc', 2022, '38.99', 148, '8.20', NULL, 'PG-13'),
(23, 'BIRDS OF PREY', 'After splitting up with The Joker, Harley Quinn and three other female superheroes - Black Canary, Huntress and Renee Montoya - come together to save the life of a little girl from an evil crime lord.', 'https://images.static-bluray.com/movies/covers/262062_large.jpg?t=1586222195', 'https://youtu.be/kGM4uYZzfu0', 2020, '19.98', 109, '6.60', NULL, 'R'),
(24, 'WONDER WOMAN 1984', 'Fast forward to the 1980s as Wonder Woman\'s next big screen adventure finds her facing two all-new foes: Max Lord and The Cheetah.', 'https://images.static-bluray.com/movies/covers/207513_large.jpg?t=1612961141', 'https://youtu.be/sfM7_JLk-84', 2021, '11.26', 151, '6.10', NULL, 'PG-13'),
(25, 'DUNE', 'Paul Atreides, a brilliant and gifted young man born into a great destiny beyond his understanding, must travel to the most dangerous planet in the universe to ensure the future of his family and his people. As malevolent forces explode into conflict over the planet\'s exclusive supply of the most precious resource in existence-a commodity capable of unlocking humanity\'s greatest potential-only those who can conquer their fear will survive.', 'https://images.static-bluray.com/movies/covers/295801_large.jpg?t=1651965229', 'https://youtu.be/8g18jFHCLXk', 2022, '22.98', 155, '8.10', NULL, 'PG-13'),
(26, 'NO TIME TO DIE', 'Bond has left active service. His peace is short-lived when his old friend Felix Leiter from the CIA turns up asking for help, leading Bond onto the trail of a mysterious villain armed with dangerous new technology.', 'https://images.static-bluray.com/movies/covers/259721_large.jpg?t=1637093553', 'https://youtu.be/BIhNsAtPbPI', 2021, '22.98', 163, '7.60', NULL, 'PG-13'),
(27, 'BLACK WIDOW', 'Natasha Romanoff aka Black Widow confronts the darker parts of her ledger when a dangerous conspiracy with ties to her past arises. Pursued by a force that will stop at nothing to bring her down, Natasha must deal with her history as a spy and the broken relationships left in her wake long before she became an Avenger.', 'https://images.static-bluray.com/movies/covers/258563_large.jpg?t=1627913790', 'https://youtu.be/ybji16u608U', 2021, '26.50', 134, '6.90', NULL, 'PG-13'),
(28, 'GODZILLA VS KONG', 'Legends collide as Godzilla and Kong, the two most powerful forces of nature, clash on the big screen in a spectacular battle for the ages. As a squadron embarks on a perilous mission into fantastic uncharted terrain, unearthing clues to the Titans\' very origins and mankind\'s survival, a conspiracy threatens to wipe the creatures, both good and bad, from the face of the earth forever.', 'https://images.static-bluray.com/movies/covers/289698_large.jpg?t=1619457876', 'https://youtu.be/odM92ap8_c0', 2021, '22.98', 113, '7.10', NULL, 'PG-13'),
(29, 'THE INVISIBLE MAN', 'When a woman\'s abusive ex takes his own life and leaves her fortune, she suspects his death was a hoax.', 'https://images.static-bluray.com/movies/covers/256612_large.jpg?t=1586359798', 'https://youtu.be/WO_FJdiY9dA', 2020, '6.99', 124, '7.40', NULL, 'R'),
(30, 'THE BATMAN', 'Batman ventures into Gotham City\'s underworld when a sadistic killer leaves behind a trail of cryptic clues. As the evidence begins to lead closer to home and the scale of the perpetrator\'s plans become clear, he must forge new relationships, unmask the culprit and bring justice to the abuse of power and corruption that has long plagued the metropolis.', 'https://images.static-bluray.com/movies/covers/312831_large.jpg?t=1649667721', 'https://youtu.be/mqqft2x_Aa4', 2022, '39.98', 176, '8.00', NULL, 'PG-13'),
(31, 'ZACK SNYDER\'S JUSTICE LEAGUE', 'Determined to ensure Superman\'s ultimate sacrifice was not in vain, Bruce Wayne aligns forces with Diana Prince with plans to recruit a team of metahumans to protect the world from an approaching threat of catastrophic proportions. The task proves more difficult than Bruce imagined, as each of the recruits must face the demons of their own pasts to transcend that which has held them back, allowing them to come together, finally forming an unprecedented league of heroes. Now united, Batman, Wonder Woman, Aquaman, Cyborg and The Flash may be too late to save the planet from Steppenwolf, DeSaad and Darkseid and their dreadful intentions.', 'https://images.static-bluray.com/movies/covers/288127_large.jpg?t=1624574232', 'https://youtu.be/vM-Bja2Gy04', 2021, '22.98', 242, '8.20', NULL, 'R'),
(32, 'THE SUICIDE SQUAD', 'Super-Villains Harley Quinn, Bloodsport, Peacemaker and a collection of cons at Belle Reve prison join the super-secret, super-shady Task Force X where they are heavily-armed and dropped off at the remote, enemy-infused island of Corto Maltese.', 'https://images.static-bluray.com/movies/covers/297688_large.jpg?t=1631125624', 'https://youtu.be/eg5ciqQzmK0', 2021, '22.98', 132, '7.60', NULL, 'R'),
(33, 'SHANG-CHI AND THE LEGEND OF THE TEN RINGS', 'Shang-Chi must confront the past he thought he left behind when he is drawn into the web of the mysterious Ten Rings organization.', 'https://images.static-bluray.com/movies/covers/289850_large.jpg?t=1633167947', 'https://youtu.be/giWIr7U1deA', 2021, '26.50', 132, '7.40', NULL, 'PG-13'),
(34, 'SONIC THE HEDGEHOG', 'Sonic tries to navigate the complexities of life on Earth with his newfound best friend -- a human named Tom Wachowski. They must soon join forces to prevent the evil Dr. Robotnik from capturing Sonic and using his powers for world domination.', 'https://images.static-bluray.com/movies/covers/257584_large.jpg?t=1606015093', 'https://youtu.be/szby7ZHLnkA', 2020, '13.99', 99, '6.80', NULL, 'PG'),
(35, 'BAD BOYS FOR LIFE', 'Miami detectives Mike Lowrey and Marcus Burnett must face off against a mother-and-son pair of drug lords who wreak vengeful havoc on their city.', 'https://images.static-bluray.com/movies/covers/261202_large.jpg?t=1584494854', 'https://youtu.be/jKCj3XuPG8M', 2020, '19.99', 124, '7.10', NULL, 'R'),
(36, 'VENOM: LET THERE BE CARNAGE', 'Investigative journalist Eddie Brock struggles to adjust to life as the host of the alien symbiote Venom, which grants him super-human abilities in order to be a lethal vigilante. Brock attempts to reignite his career by interviewing serial killer Cletus Kasady, who becomes the host of the symbiote Carnage and escapes prison after a failed execution.', 'https://images.static-bluray.com/movies/covers/302482_large.jpg?t=1635803612', 'https://youtu.be/-ezfi6FQ8Ds', 2021, '38.99', 97, '6.30', NULL, 'PG-13'),
(37, 'ETERNALS', 'The Eternals, a race of immortal beings with superhuman powers who have secretly lived on Earth for thousands of years, reunite to battle the evil Deviants.', 'https://images.static-bluray.com/movies/covers/268267_large.jpg?t=1652036972', 'https://youtu.be/x_me3xsvDgk', 2022, '34.99', 156, '6.20', NULL, 'PG-13'),
(38, 'SOUL', 'A musician who has lost his passion for music is transported out of his body and must find his way back with the help of an infant soul learning about herself.', 'https://images.static-bluray.com/movies/covers/257585_large.jpg?t=1612780312', 'https://youtu.be/xOsLIiBStEs', 2021, '26.50', 101, '8.10', NULL, 'PG'),
(39, 'HALLOWEEN KILLS', 'Minutes after Laurie Strode, her daughter Karen, and granddaughter Allyson left masked monster Michael Myers caged and burning in Laurie\'s basement, Laurie is rushed to the hospital with life-threatening injuries, believing she finally killed her lifelong tormentor. But when Michael manages to free himself from Laurie\'s trap, his ritual bloodbath resumes. As Laurie fights her pain and prepares to defend herself against him, she inspires all of Haddonfield to rise up against their unstoppable monster.', 'https://images.static-bluray.com/movies/covers/293679_large.jpg?t=1638998658', 'https://youtu.be/hL6R3HmQfPc', 2022, '22.98', 109, '6.30', NULL, 'R'),
(40, 'ONWARD', 'Set in a suburban fantasy world, two teenage elf brothers embark on a quest to discover if there is still magic out there.', 'https://images.static-bluray.com/movies/covers/258619_large.jpg?t=1586658905', 'https://youtu.be/gn5QmllRCn4', 2020, '26.50', 103, '7.40', NULL, 'PG'),
(41, 'SCREAM', 'Twenty-five years after a streak of brutal murders shocked the quiet town of Woodsboro, a new killer has donned the Ghostface mask and begins targeting a group of teenagers to resurrect secrets from the town\'s deadly past.', 'https://images.static-bluray.com/movies/covers/303105_large.jpg?t=1644978845', 'https://youtu.be/beToTslH17s', 2022, '31.99', 114, '6.70', NULL, 'R'),
(42, 'UNCHARTED', 'Street-smart Nathan Drake is recruited by seasoned treasure hunter Victor \"Sully\" Sullivan to recover a fortune amassed by Ferdinand Magellan and lost 500 years ago by the House of Moncada.', 'https://images.static-bluray.com/movies/covers/114470_large.jpg?t=1648529143', 'https://youtu.be/eHp3MbsCbMg', 2022, '38.99', 116, '6.50', NULL, 'PG-13'),
(43, 'DOCTOR STRANGE IN THE MULTIVERSE OF MADNESS', 'Dr. Stephen Strange casts a forbidden spell that opens the door to the multiverse, including an alternate version of himself, whose threat to humanity is too great for the combined forces of Strange, Wong, and Wanda Maximoff.', 'https://images.static-bluray.com/movies/covers/307926_large.jpg?t=1654865649', 'https://youtu.be/Rt_UqUm38BI', 2022, '39.99', 126, '7.30', NULL, 'PG-13'),
(44, 'TOP GUN: MAVERICK', 'After more than thirty years of service as one of the Navy’s top aviators, Pete “Maverick” Mitchell (Tom Cruise) is where he belongs, pushing the envelope as a courageous test pilot and dodging the advancement in rank that would ground him. When he finds himself training a detachment of Top Gun graduates for a specialized mission the likes of which no living pilot has ever seen, Maverick encounters Lt. Bradley Bradshaw (Miles Teller), call sign: “Rooster,” the son of Maverick’s late friend and Radar Intercept Officer Lt. Nick Bradshaw, aka “Goose.”', 'https://images.static-bluray.com/movies/covers/258949_large.jpg?t=1653694714', 'https://youtu.be/giXco2jaZ_4', 2022, '31.99', 131, '8.50', NULL, 'PG-13'),
(45, 'THE NORTHMAN', 'From acclaimed director Robert Eggers, The Northman is an epic revenge thriller that explores how far a Viking prince will go to seek justice for his murdered father.', 'https://images.static-bluray.com/movies/covers/307682_large.jpg?t=1654073385', 'https://youtu.be/oMSdFM12hOw', 2022, '34.98', 137, '7.70', NULL, 'R'),
(46, 'DEATH ON THE NILE', 'Whilst on vacation on the Nile, Hercule Poirot must investigate the murder of a young heiress.', 'https://images.static-bluray.com/movies/covers/310900_large.jpg?t=1650134230', 'https://youtu.be/dZRqB0JLizw', 2022, '34.99', 127, '6.40', NULL, 'PG-13'),
(47, 'MOONFALL', 'When a powerful force knocks the moon off of its orbit, former astronaut and NASA executive Jo Fowler (Halle Berry) immediately jumps into action to save humankind. Unfortunately for her, only Brian Harper (Patrick Wilson), a figure from her past, and KC Houseman (John Bradley), a conspiracy theorist, believe that she holds the key to stopping the impending disaster. With only a few weeks until the displaced heavenly body crashes into Earth, the unlikely team heroically pursues their mission, only to find out that the moon is not what it seems to be.', 'https://images.static-bluray.com/movies/covers/304610_large.jpg?t=1647377355', 'https://youtu.be/ivIwdQBlS10', 2022, '39.99', 130, '6.20', NULL, 'PG-13'),
(48, 'TURNING RED', 'A 13-year-old girl turns into a giant red panda whenever she gets too excited.', 'https://images.static-bluray.com/movies/covers/308567_large.jpg?t=1649719633', 'https://youtu.be/XdKzUbAiswE', 2022, '34.99', 100, '7.30', NULL, 'PG'),
(49, 'MORBIUS', 'Biochemist Michael Morbius tries to cure himself of a rare blood disease, but he inadvertently infects himself with a form of vampirism instead.', 'https://images.static-bluray.com/movies/covers/304643_large.jpg?t=1651615993', 'https://youtu.be/oZ6iiRrz1SY', 2022, '38.99', 104, '5.50', NULL, 'PG-13'),
(50, 'X', 'At a secluded farmhouse in Texas, a film crew arrives to shoot an adult film. Their hosts, a reclusive elderly couple, take a special interest in their young guests. As night falls the couple\'s leering interest turns violent.', 'https://images.static-bluray.com/movies/covers/312907_large.jpg?t=1650694385', 'https://youtu.be/WsIQT6_60BI', 2022, '39.99', 105, '7.30', NULL, 'R');

-- --------------------------------------------------------

--
-- Table structure for table `moviebrand`
--

DROP TABLE IF EXISTS `moviebrand`;
CREATE TABLE IF NOT EXISTS `moviebrand` (
  `movie_id` int(10) NOT NULL,
  `brand_id` int(10) NOT NULL,
  KEY `fk_mb_movie` (`movie_id`),
  KEY `fk_mb_brand` (`brand_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `moviebrand`
--

INSERT INTO `moviebrand` (`movie_id`, `brand_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 2),
(5, 6),
(6, 2),
(7, 2),
(8, 1),
(9, 1),
(10, 1),
(11, 3),
(12, 1),
(15, 4),
(16, 7),
(17, 3),
(18, 5),
(19, 2),
(20, 2),
(21, 2),
(22, 1),
(23, 2),
(24, 2),
(25, 2),
(26, 4),
(27, 1),
(28, 2),
(29, 4),
(30, 2),
(31, 2),
(32, 2),
(33, 1),
(34, 7),
(35, 3),
(36, 3),
(37, 1),
(38, 1),
(39, 4),
(40, 1),
(41, 7),
(42, 3),
(43, 1),
(44, 7),
(45, 4),
(46, 1),
(47, 5),
(48, 1),
(49, 3),
(50, 5),
(13, 3),
(14, 1);

-- --------------------------------------------------------

--
-- Table structure for table `moviegenre`
--

DROP TABLE IF EXISTS `moviegenre`;
CREATE TABLE IF NOT EXISTS `moviegenre` (
  `movie_id` int(10) NOT NULL,
  `genre_id` int(10) NOT NULL,
  KEY `fk_mg_movie` (`movie_id`),
  KEY `fk_mg_genre` (`genre_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `moviegenre`
--

INSERT INTO `moviegenre` (`movie_id`, `genre_id`) VALUES
(1, 1),
(1, 2),
(1, 5),
(1, 4),
(2, 1),
(2, 2),
(2, 5),
(2, 4),
(3, 1),
(3, 2),
(3, 5),
(3, 4),
(5, 1),
(5, 2),
(5, 5),
(5, 4),
(5, 13),
(6, 1),
(6, 6),
(7, 1),
(7, 2),
(7, 5),
(7, 4),
(8, 1),
(8, 4),
(8, 13),
(4, 1),
(4, 2),
(4, 4),
(9, 1),
(9, 4),
(10, 1),
(10, 2),
(10, 4),
(10, 5),
(10, 13),
(11, 1),
(11, 2),
(11, 3),
(11, 4),
(11, 5),
(11, 13),
(12, 1),
(12, 2),
(12, 4),
(12, 12),
(13, 6),
(13, 13),
(14, 1),
(14, 4),
(14, 5),
(15, 1),
(15, 2),
(15, 4),
(16, 4),
(16, 6),
(16, 7),
(17, 1),
(17, 4),
(17, 7),
(18, 1),
(19, 1),
(19, 2),
(19, 4),
(19, 13),
(20, 1),
(20, 4),
(20, 5),
(21, 1),
(21, 4),
(21, 6),
(22, 1),
(22, 2),
(22, 4),
(22, 5),
(22, 13),
(23, 1),
(24, 1),
(24, 5),
(24, 6),
(25, 1),
(25, 2),
(25, 4),
(25, 5),
(25, 6),
(26, 1),
(26, 2),
(27, 1),
(27, 2),
(27, 4),
(27, 5),
(27, 6),
(28, 1),
(28, 2),
(28, 4),
(28, 5),
(29, 4),
(29, 6),
(29, 7),
(30, 1),
(30, 2),
(31, 1),
(31, 2),
(31, 4),
(31, 5),
(32, 1),
(32, 2),
(32, 5),
(33, 1),
(33, 2),
(33, 5),
(34, 1),
(34, 2),
(34, 4),
(34, 5),
(34, 1),
(34, 2),
(34, 4),
(34, 5),
(35, 1),
(36, 1),
(36, 2),
(36, 4),
(37, 1),
(37, 2),
(37, 4),
(38, 3),
(38, 5),
(39, 7),
(40, 2),
(40, 3),
(40, 5),
(40, 13),
(41, 6),
(42, 1),
(42, 2),
(43, 1),
(43, 2),
(43, 5),
(43, 7),
(44, 1),
(45, 1),
(45, 2),
(45, 6),
(46, 6),
(47, 1),
(47, 2),
(47, 4),
(47, 5),
(48, 2),
(48, 3),
(48, 12),
(48, 13),
(49, 1),
(49, 4),
(49, 5),
(49, 7),
(50, 6),
(50, 7);

-- --------------------------------------------------------

--
-- Table structure for table `movieimage`
--

DROP TABLE IF EXISTS `movieimage`;
CREATE TABLE IF NOT EXISTS `movieimage` (
  `img_id` int(10) NOT NULL AUTO_INCREMENT,
  `img_url` varchar(255) DEFAULT NULL,
  `movie_id` int(10) NOT NULL,
  PRIMARY KEY (`img_id`),
  KEY `fk_mi_movie` (`movie_id`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `movieimage`
--

INSERT INTO `movieimage` (`img_id`, `img_url`, `movie_id`) VALUES
(1, 'https://images.static-bluray.com/reviews/17328_1.jpg', 1),
(2, 'https://images.static-bluray.com/reviews/17328_3.jpg', 1),
(3, 'https://images.static-bluray.com/reviews/17328_7.jpg', 1),
(4, 'https://images.static-bluray.com/reviews/17328_10.jpg', 1),
(5, 'https://images.static-bluray.com/reviews/19217_2.jpg', 2),
(6, 'https://images.static-bluray.com/reviews/19217_10.jpg', 2),
(7, 'https://images.static-bluray.com/reviews/19217_18.jpg', 2),
(8, 'https://images.static-bluray.com/reviews/19217_29.jpg', 2),
(9, 'https://images.static-bluray.com/reviews/17427_1_tn.jpg', 5),
(10, 'https://images.static-bluray.com/reviews/17427_2_tn.jpg', 5),
(11, 'https://images.static-bluray.com/reviews/17427_3_tn.jpg', 5),
(12, 'https://images.static-bluray.com/reviews/17427_4_tn.jpg', 5),
(13, 'https://images.static-bluray.com/reviews/16926_1.jpg', 3),
(14, 'https://images.static-bluray.com/reviews/16926_2.jpg', 3),
(15, 'https://images.static-bluray.com/reviews/16926_9.jpg', 3),
(16, 'https://images.static-bluray.com/reviews/16926_16.jpg', 3),
(17, 'https://images.static-bluray.com/reviews/18405_1.jpg', 4),
(18, 'https://images.static-bluray.com/reviews/18405_2.jpg', 4),
(19, 'https://images.static-bluray.com/reviews/18405_4.jpg', 4),
(20, 'https://images.static-bluray.com/reviews/18405_19.jpg', 4),
(21, 'https://images.static-bluray.com/reviews/20140_1.jpg', 6),
(22, 'https://images.static-bluray.com/reviews/20140_2.jpg', 6),
(23, 'https://images.static-bluray.com/reviews/20140_7.jpg', 6),
(24, 'https://images.static-bluray.com/reviews/20140_5.jpg', 6),
(25, 'https://images.static-bluray.com/reviews/17279_1.jpg', 7),
(26, 'https://images.static-bluray.com/reviews/17279_4.jpg', 7),
(27, 'https://images.static-bluray.com/reviews/17279_12.jpg', 7),
(28, 'https://images.static-bluray.com/reviews/17279_23.jpg', 7),
(29, 'https://images.static-bluray.com/reviews/19543_1.jpg', 8),
(30, 'https://images.static-bluray.com/reviews/19543_4.jpg', 8),
(31, 'https://images.static-bluray.com/reviews/19543_5.jpg', 8),
(32, 'https://images.static-bluray.com/reviews/19543_12.jpg', 8),
(33, 'https://images.static-bluray.com/reviews/18804_1.jpg', 9),
(34, 'https://images.static-bluray.com/reviews/18804_4.jpg', 9),
(35, 'https://images.static-bluray.com/reviews/18804_18.jpg', 9),
(36, 'https://images.static-bluray.com/reviews/18804_5.jpg', 9),
(37, 'https://images.static-bluray.com/reviews/17681_1.jpg', 10),
(38, 'https://images.static-bluray.com/reviews/17681_19.jpg', 10),
(39, 'https://images.static-bluray.com/reviews/17681_13.jpg', 10),
(40, 'https://images.static-bluray.com/reviews/17681_9.jpg', 10),
(41, 'https://images.static-bluray.com/reviews/18416_1_tn.jpg', 11),
(42, 'https://images.static-bluray.com/reviews/18416_2_tn.jpg', 11),
(43, 'https://images.static-bluray.com/reviews/18416_3_tn.jpg', 11),
(44, 'https://images.static-bluray.com/reviews/18416_4_tn.jpg', 11),
(45, 'https://images.static-bluray.com/reviews/17544_1_tn.jpg', 12),
(46, 'https://images.static-bluray.com/reviews/17544_2_tn.jpg', 12),
(47, 'https://images.static-bluray.com/reviews/17544_3_tn.jpg', 12),
(48, 'https://images.static-bluray.com/reviews/17544_4_tn.jpg', 12),
(49, 'https://images.static-bluray.com/reviews/20002_6_tn.jpg', 13),
(50, 'https://images.static-bluray.com/reviews/20002_7_tn.jpg', 13),
(51, 'https://images.static-bluray.com/reviews/20002_8_tn.jpg', 13),
(52, 'https://images.static-bluray.com/reviews/20002_9_tn.jpg', 13),
(53, 'https://images.static-bluray.com/reviews/20596_2.jpg', 14),
(54, 'https://images.static-bluray.com/reviews/20596_4.jpg', 14),
(55, 'https://images.static-bluray.com/reviews/20596_8_tn.jpg', 14),
(56, 'https://images.static-bluray.com/reviews/20596_11.jpg', 14),
(57, 'https://images.static-bluray.com/reviews/17501_1.jpg', 15),
(58, 'https://images.static-bluray.com/reviews/17501_3.jpg', 15),
(59, 'https://images.static-bluray.com/reviews/17501_5.jpg', 15),
(60, 'https://images.static-bluray.com/reviews/17501_14.jpg', 15),
(61, 'https://images.static-bluray.com/reviews/17182_1.jpg', 16),
(62, 'https://images.static-bluray.com/reviews/17182_5.jpg', 16),
(63, 'https://images.static-bluray.com/reviews/17182_10.jpg', 16),
(64, 'https://images.static-bluray.com/reviews/17182_14.jpg', 16),
(65, 'https://images.static-bluray.com/reviews/17960_1.jpg', 17),
(66, 'https://images.static-bluray.com/reviews/17960_5.jpg', 17),
(67, 'https://images.static-bluray.com/reviews/17960_6.jpg', 17),
(68, 'https://images.static-bluray.com/reviews/17960_16.jpg', 17),
(69, 'https://images.static-bluray.com/reviews/19375_9.jpg', 18),
(70, 'https://images.static-bluray.com/reviews/19375_16.jpg', 18),
(71, 'https://images.static-bluray.com/reviews/19375_5.jpg', 18),
(72, 'https://images.static-bluray.com/reviews/19375_6.jpg', 18),
(73, 'https://images.static-bluray.com/reviews/19073_17.jpg', 19),
(74, 'https://images.static-bluray.com/reviews/19073_4.jpg', 19),
(75, 'https://images.static-bluray.com/reviews/19073_5.jpg', 19),
(76, 'https://images.static-bluray.com/reviews/19073_6.jpg', 19),
(77, 'https://images.static-bluray.com/reviews/19371_2.jpg', 20),
(78, 'https://images.static-bluray.com/reviews/19371_10.jpg', 20),
(79, 'https://images.static-bluray.com/reviews/19371_11.jpg', 20),
(80, 'https://images.static-bluray.com/reviews/19371_7.jpg', 20),
(81, 'https://images.static-bluray.com/reviews/22275_2.jpg', 21),
(82, 'https://images.static-bluray.com/reviews/22275_11.jpg', 21),
(83, 'https://images.static-bluray.com/reviews/22275_9.jpg', 21),
(84, 'https://images.static-bluray.com/reviews/22275_14.jpg', 21),
(85, 'https://images.static-bluray.com/reviews/25749_1.jpg', 22),
(86, 'https://images.static-bluray.com/reviews/25749_2.jpg', 22),
(87, 'https://images.static-bluray.com/reviews/25749_20.jpg', 22),
(88, 'https://images.static-bluray.com/reviews/25749_21.jpg', 22),
(89, 'https://images.static-bluray.com/reviews/20957_1.jpg', 23),
(90, 'https://images.static-bluray.com/reviews/20957_3.jpg', 23),
(91, 'https://images.static-bluray.com/reviews/20957_4.jpg', 23),
(92, 'https://images.static-bluray.com/reviews/20957_8.jpg', 23),
(93, 'https://images.static-bluray.com/reviews/23130_2.jpg', 24),
(94, 'https://images.static-bluray.com/reviews/23130_6.jpg', 24),
(95, 'https://images.static-bluray.com/reviews/23130_8.jpg', 24),
(96, 'https://images.static-bluray.com/reviews/23130_23.jpg', 24),
(97, 'https://images.static-bluray.com/reviews/24848_6_tn.jpg', 25),
(98, 'https://images.static-bluray.com/reviews/24848_7_tn.jpg', 25),
(99, 'https://images.static-bluray.com/reviews/24848_8_tn.jpg', 25),
(100, 'https://images.static-bluray.com/reviews/24848_9_tn.jpg', 25),
(101, 'https://images.static-bluray.com/reviews/24676_7_tn.jpg', 26),
(102, 'https://images.static-bluray.com/reviews/24676_1.jpg', 26),
(103, 'https://images.static-bluray.com/reviews/24676_8.jpg', 26),
(104, 'https://images.static-bluray.com/reviews/24676_14.jpg', 26),
(105, 'https://images.static-bluray.com/reviews/24138_4.jpg', 27),
(106, 'https://images.static-bluray.com/reviews/24138_2.jpg', 27),
(107, 'https://images.static-bluray.com/reviews/24138_3.jpg', 27),
(108, 'https://images.static-bluray.com/reviews/24138_5.jpg', 27),
(109, 'https://images.static-bluray.com/reviews/23570_1.jpg', 28),
(110, 'https://images.static-bluray.com/reviews/23570_2.jpg', 28),
(111, 'https://images.static-bluray.com/reviews/23570_16.jpg', 28),
(112, 'https://images.static-bluray.com/reviews/23570_13.jpg', 28),
(113, 'https://images.static-bluray.com/reviews/21019_6_tn.jpg', 29),
(114, 'https://images.static-bluray.com/reviews/21019_7_tn.jpg', 29),
(115, 'https://images.static-bluray.com/reviews/21019_8_tn.jpg', 29),
(116, 'https://images.static-bluray.com/reviews/21019_9_tn.jpg', 29),
(117, 'https://images.static-bluray.com/reviews/25951_2.jpg', 30),
(118, 'https://images.static-bluray.com/reviews/25951_17.jpg', 30),
(119, 'https://images.static-bluray.com/reviews/25951_24.jpg', 30),
(120, 'https://images.static-bluray.com/reviews/25951_34.jpg', 30),
(121, 'https://images.static-bluray.com/reviews/24069_1.jpg', 31),
(122, 'https://images.static-bluray.com/reviews/24069_4.jpg', 31),
(123, 'https://images.static-bluray.com/reviews/24069_5.jpg', 31),
(124, 'https://images.static-bluray.com/reviews/24069_18.jpg', 31),
(125, 'https://images.static-bluray.com/reviews/24404_1.jpg', 32),
(126, 'https://images.static-bluray.com/reviews/24404_4.jpg', 32),
(127, 'https://images.static-bluray.com/reviews/24404_14.jpg', 32),
(128, 'https://images.static-bluray.com/reviews/24404_24.jpg', 32),
(129, 'https://images.static-bluray.com/reviews/24549_1.jpg', 33),
(130, 'https://images.static-bluray.com/reviews/24549_2.jpg', 33),
(131, 'https://images.static-bluray.com/reviews/24549_7.jpg', 33),
(132, 'https://images.static-bluray.com/reviews/24549_16.jpg', 33),
(133, 'https://images.static-bluray.com/reviews/21032_6_tn.jpg', 34),
(134, 'https://images.static-bluray.com/reviews/21032_1.jpg', 34),
(135, 'https://images.static-bluray.com/reviews/21032_3.jpg', 34),
(136, 'https://images.static-bluray.com/reviews/21032_19.jpg', 34),
(137, 'https://images.static-bluray.com/reviews/20904_7_tn.jpg', 35),
(138, 'https://images.static-bluray.com/reviews/20904_8_tn.jpg', 35),
(139, 'https://images.static-bluray.com/reviews/20904_9_tn.jpg', 35),
(140, 'https://images.static-bluray.com/reviews/20904_1.jpg', 35),
(141, 'https://images.static-bluray.com/reviews/24689_1.jpg', 36),
(142, 'https://images.static-bluray.com/reviews/24689_2.jpg', 36),
(143, 'https://images.static-bluray.com/reviews/24689_8.jpg', 36),
(144, 'https://images.static-bluray.com/reviews/24689_6.jpg', 36),
(145, 'https://images.static-bluray.com/reviews/25395_1.jpg', 37),
(146, 'https://images.static-bluray.com/reviews/25395_4.jpg', 37),
(147, 'https://images.static-bluray.com/reviews/25395_9.jpg', 37),
(148, 'https://images.static-bluray.com/reviews/25395_12.jpg', 37),
(149, 'https://images.static-bluray.com/reviews/23105_1.jpg', 38),
(150, 'https://images.static-bluray.com/reviews/23105_6.jpg', 38),
(151, 'https://images.static-bluray.com/reviews/23105_11.jpg', 38),
(152, 'https://images.static-bluray.com/reviews/23105_14.jpg', 38),
(153, 'https://images.static-bluray.com/reviews/24869_1.jpg', 39),
(154, 'https://images.static-bluray.com/reviews/24869_10.jpg', 39),
(155, 'https://images.static-bluray.com/reviews/24869_12.jpg', 39),
(156, 'https://images.static-bluray.com/reviews/24869_17.jpg', 39),
(157, 'https://images.static-bluray.com/reviews/21092_7_tn.jpg', 40),
(158, 'https://images.static-bluray.com/reviews/21092_8_tn.jpg', 40),
(159, 'https://images.static-bluray.com/reviews/21092_1.jpg', 40),
(160, 'https://images.static-bluray.com/reviews/21092_9_tn.jpg', 40),
(161, 'https://images.static-bluray.com/reviews/25713_5.jpg', 41),
(162, 'https://images.static-bluray.com/reviews/25713_19.jpg', 41),
(163, 'https://images.static-bluray.com/reviews/25713_18.jpg', 41),
(164, 'https://images.static-bluray.com/reviews/25713_14.jpg', 41),
(165, 'https://images.static-bluray.com/reviews/25878_1.jpg', 42),
(166, 'https://images.static-bluray.com/reviews/25878_2.jpg', 42),
(167, 'https://images.static-bluray.com/reviews/25878_4.jpg', 42),
(168, 'https://images.static-bluray.com/reviews/25878_5.jpg', 42),
(169, 'https://static.wikia.nocookie.net/marvelcinematicuniverse/images/a/a6/Defender_Strange_stabbed.jpg/revision/latest/scale-to-width-down/1000?cb=20220622082236', 43),
(170, 'https://static.wikia.nocookie.net/marvelcinematicuniverse/images/c/c5/Illuminati_on_Titan.png/revision/latest/scale-to-width-down/1000?cb=20220623025204', 43),
(171, 'https://static.wikia.nocookie.net/marvelcinematicuniverse/images/4/4c/DSMoM_Trailer_%2811%29.png/revision/latest/scale-to-width-down/1000?cb=20220308104502', 43),
(172, 'https://static.wikia.nocookie.net/marvelcinematicuniverse/images/4/41/Things_Just_Got_Out_of_Hand.PNG/revision/latest/scale-to-width-down/1000?cb=20220414065524', 43),
(173, 'https://images.kinorium.com/movie/shot/551214/w1500_40049557.jpg', 44),
(174, 'https://images.kinorium.com/movie/shot/551214/w1500_40049576.jpg', 44),
(175, 'https://images.kinorium.com/movie/shot/551214/w1500_40049605.jpg', 44),
(176, 'https://images.kinorium.com/movie/shot/551214/w1500_50498277.jpg', 44),
(177, 'https://images.static-bluray.com/reviews/26098_1.jpg', 45),
(178, 'https://images.static-bluray.com/reviews/26098_3.jpg', 45),
(179, 'https://images.static-bluray.com/reviews/26098_5.jpg', 45),
(180, 'https://images.static-bluray.com/reviews/26098_7.jpg', 45),
(181, 'https://images.static-bluray.com/reviews/25695_1.jpg', 46),
(182, 'https://images.static-bluray.com/reviews/25695_2.jpg', 46),
(183, 'https://images.static-bluray.com/reviews/25695_4.jpg', 46),
(184, 'https://images.static-bluray.com/reviews/25695_11.jpg', 46),
(185, 'https://images.static-bluray.com/reviews/25789_6_tn.jpg', 47),
(186, 'https://images.static-bluray.com/reviews/25789_2.jpg', 47),
(187, 'https://images.static-bluray.com/reviews/25789_4.jpg', 47),
(188, 'https://images.static-bluray.com/reviews/25789_14.jpg', 47),
(189, 'https://images.static-bluray.com/reviews/25786_1.jpg', 48),
(190, 'https://images.static-bluray.com/reviews/25786_3.jpg', 48),
(191, 'https://images.static-bluray.com/reviews/25786_5.jpg', 48),
(192, 'https://images.static-bluray.com/reviews/25786_13.jpg', 48),
(193, 'https://images.static-bluray.com/reviews/26066_1.jpg', 49),
(194, 'https://images.static-bluray.com/reviews/26066_4.jpg', 49),
(195, 'https://images.static-bluray.com/reviews/26066_5.jpg', 49),
(196, 'https://images.static-bluray.com/reviews/26066_17.jpg', 49),
(197, 'https://images.static-bluray.com/reviews/25977_6_tn.jpg', 50),
(198, 'https://images.static-bluray.com/reviews/25977_4.jpg', 50),
(199, 'https://images.static-bluray.com/reviews/25977_11.jpg', 50),
(200, 'https://images.static-bluray.com/reviews/25977_7.jpg', 50);

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
CREATE TABLE IF NOT EXISTS `review` (
  `review_id` int(10) NOT NULL AUTO_INCREMENT,
  `movie_id` int(10) NOT NULL,
  `user_id` int(10) NOT NULL,
  `review_like` int(10) DEFAULT '0',
  `review_dislike` int(10) DEFAULT '0',
  `review_content` varchar(5000) CHARACTER SET utf32 COLLATE utf32_unicode_ci DEFAULT NULL,
  `rating` int(10) DEFAULT NULL,
  PRIMARY KEY (`review_id`),
  KEY `fk_mr_movie` (`movie_id`),
  KEY `fk_mr_user` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`review_id`, `movie_id`, `user_id`, `review_like`, `review_dislike`, `review_content`, `rating`) VALUES
(1, 5, 2, 15, 5, 'Sequels are tough. When I first saw this, I didn\'t think it quite lived up to the first but on rewatch that\'s flipped a bit. It\'s still a flawless Reynolds performance but now he has a solid supporting cast around him, a story that has some meat on it and, surprisingly some growth for the Merc with the Mouth. Still flawed, but so much fun. Also, much love for Domino and Cable here.', 9),
(2, 43, 2, 5, 15, 'The overall pacing is relentless and the sequel shows its hand a lot earlier than you\'d expect. There\'s been endless speculation from fans about the villain, which i won\'t spoil here, but it\'s revealed surprisingly quickly.\r\nYou can\'t help that feel somewhere in the multiverse, there\'s a better version of this movie that exists.', 6),
(3, 1, 2, 171, 29, 'This movie portrays a villain that by far has been the best out of all the other Marvel antagonists. It shows his personal conflicts, his purpose, as well as his cruelty. The heroes of this film are overshadowed by this, but the ending really makes a mark on the audience.', 9),
(4, 1, 2, 57, 4, 'Infinity war seemed much better than endgame to be honest.', 10),
(5, 10, 6, 8, 0, 'The movie is a lot of entertaiment and it surprised me how most of the screentime is action scenes (Not violent lol) with very funny ideas like the \"hotwheels\" and laughable comedy, not as other generic marvel jokes, the villain is confusing but it has a tragic story after all, it has his flaws like the physics are nonsense and sometimes the vfx is weak but still a really entertainment film, if you haven´t seen go watch it.', 8),
(6, 10, 7, 7, 1, 'Ant-Man and The Wasp is a fun adventure for the characters. The cast has great chemistry, which is assisted by the admirable comedic portions of the film. The visuals are well done, with great editing to help capture the different fight and other intense sequences. A little character development is lacking, but it doesn\'t take much away from the plot. The overall storyline is exciting and has a nice emotional depth, but does sometimes fall short of being completely eye grabbing. Otherwise, the movie is a worthy addition to the MCU.', 7),
(7, 4, 4, 111, 21, 'I was gonna give this a couple stars for effort, but then there was an octopus drumming. So nope. One star.', 1),
(8, 4, 5, 82, 13, 'Your usual style-over-substance comic book movie. Flimsy plot, really just a vehicle to move you from one action scene to another. Formulaic and cliched: change the characters and settings and you\'ve got pretty much the story of every comic book superhero. Good CGI, but that\'s a given nowadays.', 4),
(9, 16, 6, 100, 73, 'The precise is good, the acting is good, the writing is bad. There are many many major issues, but for me, the main one happened in first 10 minutes.\r\nAll I have to say is: if you have 3 young kids and you walk in a straight line, who goes first and last. I could not watch it after. That did it for me.', 1),
(10, 16, 3, 119, 108, '\'A Quiet Place\' is a somewhat post-apocalyptic thriller co-written, directed, and starring John Krasinski with his real-life wife Emily Blunt. The pair and their three kids (not-real life) are up against a villain who really doesn\'t like noise. The sound design is some of the best in recent time. The sound and sometimes (often) lack there of make this movie. Krasinski shoots to precision with a pretty good story to match. Are there a few inconsistencies? Yes, but there is never a time this movie lost my attention. Your nerve will be challenged and your skin may crawl, but don\'t let that stop you from watching this riveting feature. Final Score: 9/10', 9),
(11, 2, 7, 47, 12, 'This film is an emotional rollercoaster with some of the coolest superhero plot lines ever drawn up. It\'s straight up the most epic Marvel film that will probably ever be created. I don\'t see how Marvel could ever top this, but getting to see these characters all together at least one last time was a reward all on its own.', 10),
(12, 5, 8, 18, 6, 'This movie was GOLD! I enjoyed it so much, it was so pleasant!', 10),
(13, 3, 4, 1229, 679, 'I am between a 5 and a 6 on this. It was vastly overrated by the professional reviewers. I am sure their reviews were politically motivated. I loved the cast but I agree that characters were superficial and not defined as they should have been. I also feel more humor was needed in the movie. This can\'t compare to other Marvel movies. It\'s a one shot deal for us. We don\'t need to hear any more preaching.', 5),
(14, 23, 2, 25, 12, 'Only Margot Robbie saves herself from this rubbish. I wanted to like this film and I ended up hating it. Awful.', 1),
(15, 3, 6, 5, 1, '\"Black Panther\" may be the most overrated movie of my lifetime. I\'m truly shocked that people thought this movie deserved the Oscar for Best Picture. About half way through the movie I was seriously trying to figure out if it was an unfunny comedy or a failed parody of some kind. Correct me if I\'m wrong but this may be the first movie in history that after tons of murder and mayhem the hero actually agrees with the villain. Wow, this movie actually sides with the bad guy (but not his methods, of course). Yikes. Shame on Disney.', 2),
(16, 2, 5, 68, 54, 'After watching Infinity war, I was looking forward to much more this time, still a perfect ending.', 10),
(17, 6, 5, 1814, 679, 'I get why some people hate this . It\'s because of the political message and how some people think that you need get empathy for Arthur\'s madness. But come on that is not the point and it will never be. Enjoy this masterpiece because Joaquin Phoenix and Todd Phillips overdid themselves with this movie . The acting, music and cinematography are just amazing ! Please enjoy the movie without overthinking it.', 10),
(18, 49, 4, 357, 221, 'I collected comics, specifically Marvel/Spider-Man. Spidey was my favorite and this character, Morbius, was one of my favorite to battle Spider-Man. This aside, I won\'t bother presenting my detailed autopsy of this travesty. I will say that they strayed too far from the original story and made things convoluted. Why couldn\'t they just keep it simple. Instead they went off the rails with a ridiculous script. They took a rich and vibrant comic story and took a giant dump on it.', 1),
(19, 6, 2, 930, 466, 'The movie affects you in a way that makes it physically painful to experience, but in a good way.', 9),
(20, 6, 8, 75, 38, 'This is just my opinion but I loved the Joker, the performances, cinematography, directing, style, all build a great story. And the acting from Phoenix was incredible, he done a great take for the iconic character, and wow does he commit, with loosing the weight for the role, to developing the laugh.', 10),
(21, 7, 9, 364, 240, 'I\'ve noticed quite a few reviews here from book fans complaining that the movie wasn\'t true to the novel. As a fan of the book, let me just say that\'s true but it\'s fine. The overarching story is the same. The fact of the matter is with a nearly 400 page novel packed full of pop culture references, some things would have to be cut to make it onto the big screen. Partially it\'s an issue of length. Partially it\'s just the reality that the planets were never going to fully align to allow use of many of the properties from the novel. Yes, I loved the 2112, WarGames, D&D, Joust, et al references from the novel as much as the next person, but still I felt that Spielberg captured the wonder and fun and the story of the novel accurately, even if he did so using different references. The are actually some things I even think were an improvement from the book, especially the way they re-imagined I-R0k. The bottom line is, if you\'re a book reader, just take this movie for what it is, an alternate version of the story, written by the same person who wrote the novel.', 8),
(22, 50, 2, 135, 82, 'My expectations were quite high for this film ... After watching it , I just don\'t understand what\'s all the hype is about ? To call it mediocre is to make a compliment ! Slow , predictable , not very clever horror , which is not even a horror , just an unrealistic portrayal of mayhem based on sex... Highly not recommended !', 3),
(23, 8, 4, 67, 25, '\"Spider-Man: Far from Home\" is a typical film for youngsters or fans of Marvel, CGI and explosions. The storyline is silly, the screenplay is not as funny as the writer intended to be and the hero is annoying. Anyway entertains if the viewer has lower expectation and does not have a better option. The cliffhanger in the credits is one of the best scenes. My vote is six.', 6),
(24, 7, 4, 7, 3, 'I should\'ve reviewed sooner just was thrown my off from the negativity and didn\'t know what to say. Despite everything I love this movie for what it is maybe cause I\'m a gamer, Spielberg is incredible at his craft and don\'t mind Ready Player One for it\'s flaws! The movie is awesome, I like the way it was written, the Easter eggs, Soundtrack, cinematography, and story. I didn\'t read the book I\'m sure it\'s excellent too. Tye Sheridan, Mark Rylance, and Ben Mendelssohn are magnificent in my opinion! This film deserves more credit/appreciation.', 10),
(25, 43, 4, 341, 247, 'While this film has a more grim tone than its predecessors it\'s still a Marvel film at heart. Of course it would take Sam Raimi to find the perfect blend of comic-book-movie, horror, fantasy and slapstick. He might be working with a massive budget now, but the man stays true to his roots and sticking with what he knows pays off.\r\n\r\nThe pacing may seem disjointed or fragmented at times, but I feel that only reflects the complex nature of the multiverse within the film. Maybe it\'s not like other groundbreaking MCU films, but ultimately this is an entertaining feature.', 8),
(26, 8, 2, 75, 27, 'WOW! I just came back watching this film and it blew my mind away! I LOVE THIS FILM! All the action scenes made my mouth drop. Ned and Betty were funny in every scene. Of course, every Marvel film had to make the humor scenes. It\'s great that they had Mysterio for this film because I haven\'t seen him in the previous Spider-Man films. EXCELSIOR!', 10),
(27, 8, 5, 29, 9, 'Fun,fun,fun!!!I still like first Spiderman trilogy the most,but the new films really started to grow on me too)))Really well done and heaps of fun!Enjoy!', 8),
(28, 9, 6, 31, 16, 'I had low expectations going to see this movie because everyone was hating on it but it\'s not that bad I think it was a good superhero backstory and there is not a lot of feminism in the movie. The acting and the story lines were good.\r\n\r\nI think people did not like it because they don\'t like Brie Larson and her feminism views.', 8),
(29, 9, 7, 57, 39, 'It would be disrespectful to a cinema to call \"Captain Marvel\" (2019) a real cinema. Its a live action cartoon made for kids - that is it. But that is not what makes it pretty bad - its that during whole 2 hours i was bored out of my mind watching this. This \"movie\" has zero character building, zero real story and zero involvement - all you get here is just a colorful cartoon - you can\'t even say anything good about acting - it was wooden and dead on - it looked like no one had interesting in making it.\r\n\r\nOverall, if this \"movie\" wouldn\'t be a part of MCU, it would tank at box office. It contains nothing of what a motion picture should have. This is an empty and boring cartoon.', 4),
(30, 12, 2, 10, 0, 'Have so far been disappointed with the Star Wars revamp series. \"Solo\" is a refreshing exception. Stays true to characters, while introducing new ones that add to the Star Wars world, and genuinely enriches Han Solo\'s backstory. Well done! Also features a new score, and sets into motion important story events concerning the rebellion Han Solo would be a part of later. Recommended!\r\n\r\nA criticism though: the woman who plays Q\'ira is a bit too much like her role in Game of Thrones. At last though, there is a female in the new Disney revamp who isn\'t the typical Disney Princess heroine type. Kudos!', 9),
(31, 11, 4, 772, 174, 'A movie worthy of Stan Lee\'s approval. Incredible animation, great story, great message. This film lives up to the hype and honestly surpassed my expectations. The only reason I think there are some negative reviews is because you can never please everyone. However, for the vast majority of viewers, I believe you\'ll find this film to be great. Highly recommend seeing it in theaters just for the amazing animation style.', 10),
(32, 11, 5, 37, 12, 'So many have commented, so I will be brief. From an intriguing plot to wonderful characterizations using drop dead animation, this film works. About ten minutes into it it thought, \"This is just a kind of hip hop version of Spiderman.\" But the main character is suddenly thrust into a world which he must learn quickly to manage. The canon takes a turn here toward incredible creativity. I avoid mainstream animation, but this has restored my faith.', 10),
(33, 11, 6, 409, 158, 'Visually stunning. Great storyline. Great cast. Amazing soundtrack. Tear jerking cameo. Pop culture post credit scene of the decade. Thank you Marvel and Sony for making a Spidey movie everyone can love.', 10),
(34, 13, 9, 1698, 1065, 'If a no name writer came with such non-sense, their script would\'ve hit the bin within the first ten pages. The script mocks every theory on character and plot development. Yet, the same gurus who would trash a rookie script writer for bringing anything less then perfect, are bowing now in humble awe to the great QT. This in not about double standards, but about Hollywood having no standards at all.', 1),
(35, 21, 8, 227, 99, 'Clémence Poésy character says in the film \"Don\'t try to understand it. Feel it.\" And later Pattinson character ask to the main character \"Does your head hurt yet?\" While he is trying to explain part of the plot to The Protagonist and to us as an audience, this is basically the whole movie, visually is great, the score even being loud is also great, the concept of moving backwards is also a great idea that give a lot great scenes, but when you stop to realize, a lot of things don\'t make a lot of sense.', 7),
(36, 43, 12, 473, 192, 'I can\'t believe I am writing a bad Marvel review but I can\'t lie, this movie was really disappointing. A couple of surprises but I was expecting way more after watching No way home.... Didn\'t mind the horror side of the story, actually made me laugh. As for the music , I am a huge fan of Danny Elfman but even the music was bad.\r\n\r\nI won\'t watch this one again. Marvel we are used to greatness please don\'t do that again!', 4),
(37, 14, 11, 16, 35, 'Rise of skywalker is a great film in my opinion. yes there were some points i questioned but big picture wise, i loved it. i can also see why some wont like it. all you can do is go and see it for yourself and decide', 10),
(38, 14, 9, 44, 11, 'This movie was just straight-up painful to watch, with so many stupid scenes. The constant bathos and unearned character moments made me sick. It feels so on the nose the entire running time, and the plot is just completely absurd. This just felt like a bad joke.', 2),
(39, 15, 10, 74, 124, 'I happily saw this in IMAX last year which is always a great experience, I wasn\'t really into doing reviews until the last few months, so here we go! This really succeeded in the scares and I think the sound design is outstanding among other great things! J.A. Bayou really did something special; I think this is really epic & I don\'t understand the hate.', 9),
(40, 14, 10, 20, 5, 'In a galaxy far, far away ... so begins a couple of hours of a really poor portrayal of middle school level science or actually a good portrayal of failing m. s. science. For however far into the future we humans, if we\'re still here, will be exploring it might be to nearby stars w/robotics let alone the 100 billion of stars in our galaxy & further let alone some other galaxy. And, we won\'t be dressed, talking, behaving like early 20th century Americans. This film has the same predictable special effects CGI we\'ve been seeing for decades. Same old Earth life comically modified into alien life. Dialogue really dumbed down and made even more incongruous given the technical level of each character.', 3),
(41, 15, 5, 585, 429, 'Its as much of a non-film as I can remember. Somehow, Spielberg made a cup of water and the sound of footsteps far more suspenseful and engaging than anything in this movie. The dinosaurs are just sort of... there. Same goes for Chris Pratt, who features in scenes but only mildly forwarding the story with a few rescues or whatever. There are some cringe-worthy moments - firing a gun underwater to break glass, everyone being submersed but having perfect hair/makeup after, a horribly acted young girl who has the most shoe-horned and pointless subplot ever (as well as a nonsensical, cringe inducing climactic line). So much of the story makes no sense, a hybrid dino is basically produced and supposedly trained to follow laser sighting overnight. Yet has no buildup, suspense or point whatsoever. The whole thing is stranger than a David Lynch movie. Its like a string of bland cutscenes to a dull videogame.', 2),
(42, 18, 10, 912, 403, 'Hollow plot interspersed with the most boring fighting scenes ever. Dozens and dozens of inept villains, who are there just to be shoot. Gone are the fresh sequences of the first movie. Super-uninteresting main villain. Very poor climax. Twists, just for the sake of twists. It seems like there\'s nobody out there capable of writing a movie anymore.', 2),
(43, 18, 4, 271, 227, 'Fantastically choreographed action, especially in the first 30 minutes. After that, it drops off a bit in my opinion up until the final sequence.\r\n\r\nCertainly an enjoyable movie, but I wouldn\'t go near this unless I absolutly loved action movies. It\'s\' just straight up action. That\'s it. If you like that, you will love this.\r\n\r\nPersonally though, after about 60 minutes I got a bit tired of the movie, As much as the actions scenes are great, they lacked unqiue elements later on in the movie. There\'s only so many times someone getting headshotted can be entertaining.\r\n\r\nI gets a 7 from me, good cinematography, great choreography, average acting at best, okayish script (did not like the \'\'ending\'\')', 6),
(44, 18, 5, 21, 11, 'Another significant increase in body count contribution, not including the injured and\\or maimed, as John inserts his wickedness into the flesh and bones of those whose aim is unworthy of their role in organised crime, either that, or they\'ve never handled a weapon or are visually impaired or only shoot blanks or all three.', 7),
(45, 19, 6, 31, 4, 'Easy watching, some funny bits. Starts off well but then gets a bit muddled in its ideas and a bit \'seen it all before\'. I think the 7/10 is accurate but it a good seven.', 7),
(46, 20, 7, 595, 105, 'Great and Amazing battles/fights among giant monsters, epic and spectacular ones, what everybody was waiting for, if you want to enjoy good monsters and CGI this is you movie, go watch it on the best screen 8.5/10... But the plot is weak, people are stupid and make meaningless decisions. People\'s behavior is absurd, with a lot of boring drama that nobody cares, in addition the actors who are supposed to be the main ones have no time on screen. A Total disappointment.', 6),
(47, 20, 8, 513, 105, 'Ever since the perfection of CGI, Hollywood has come to the conclusion that if the special effects are good, then then movie is good. Thus, my 5 star rating. Half of the movie involved the monster battles and that gets 10 stars. The half of the movie where there is no monster presence gets 0. That averages out to a 5. Perhaps some day Hollywood will re-discover the lost art of screen writing and combine it with CGI to create a truly fantastic movie. But don\'t look for it to change soon. A lot of people came out of the theater visually dazzled by the special effects knowing that the story was awful but still thought it was a great movie. So they will continue make a lot of money creating these kind of movies and save on time & expense by not having to pay top dollar for a writer.', 5),
(48, 49, 3, 10, 3, 'The Godfather, The Green Mile, Schindlers List. They are all universally recognized as the few greatest movies of all time. However, Jared Leto has propelled his name into the history books with this movie, Morbius. It is hands down the greatest cinematic production ever. There is no equal. The acting is absolutely incredible. Leto\'s performance is almost as good as his Joker (which is the best joker all time). He perfectly blends the seriousness of the film and his natural humor. This movie will easily inspire generations of young minds and benefit society for years to come. The soundtrack and cinematography are S tier. And most of all, the lesson we learn from all of Leto\'s struggle is to never give up, and to always remind ourselves-it\'s morbin time.', 10),
(49, 49, 12, 5, 5, 'I pirated this nonsense, skipped through massive chunks of it and still feel I deserve my money back.\r\nWhy does this exist? It is pointless! It has nothing to say. It serves no purpose and it wastes resources. The fact that this media exists is criminal and people should be punished for its existence.\r\nThe cast and crew involved should hang their heads in shame.', 1),
(50, 19, 6, 131, 40, 'DC has had a rocky road, but shazam, aka captain marvel was an enjoyable film, silly yet fun, found a good medium, and the villain was great. Can\'t wait for Black Adam. See it if you just want some fun and nothing serious.', 8),
(51, 48, 4, 358, 328, 'This is the first Disney Pixar movie that I felt wasn\'t made for me whilst I was watching it. Their films usually have something for everyone and a very broad appeal.\r\nI felt like this film was aimed squarely at young female TikTok users going through hormonal changes.\r\nIt has some very important messages that I\'m glad to see getting some attention, but it was also very derivative and borrowed a lot of elements from a lot of other kids movies.', 5),
(52, 48, 10, 192, 135, 'This is not up to the usual high bar Pixar has set over the years. Characters were not endearing, it felt like they were trying too hard to be relatable and it just wasn\'t entertaining for a wide range of viewers. Very disappointing as most Pixar movies have universal themes & characters that reach all generations with positive messages and engaging plots.', 2),
(53, 1, 6, 6, 0, 'I enjoyed the movie. Its still the same line story. The Avengers fight against the Vilain and try to win. Tanos is very well made and very impressive to see. The end is pretty surprising and make us wonder what happened to the Heroes in the next movie.', 8),
(54, 22, 5, 549, 373, 'Superhero extravaganza! Spider-Man NWH didn\'t meet my expectations, it exceeded them. The most emotionally resonant MCU film so far. This movie is worth every excruciating moment we had to wait. The visuals, the score, the emotions, the story, and ofc the fan-service. This film understands spider-man fans like no other spider-man film before it. Truly a celebration of the most beloved character in the best way possible!', 9),
(55, 22, 6, 140, 84, 'I really do NOT understand the high score for this movie.\r\nThe storyline is idiotic and childish with monsters and spider-men coming from different dimensions all because some spell from dr. Strange went bad.\r\nMy God, what a piece of crap this movie... The special effects are as expected great but the rest is really a bunch of nonsense!\r\nI love Spider-man, Batman, the Hulk etc but this movie is really terrible and I wasted 148minutes precious time.\r\nTake my word for it: the best thing to do is to skip this movie and wait for something better to watch, which is not hard as there are not many movies as dumb as this one!', 5),
(56, 17, 8, 184, 144, 'This is probably the most underrated film I have ever seen. The CGI, graphics everything was perfect, except the final fight\'s ending. Still its a great story.\r\nStand ovation to TOM HARDY. He wraps up into perfection. Its a must watch movie.', 10),
(57, 17, 7, 47, 20, '\"Venom\" is a funny and entertaining film based on a Marvel antihero Venom with reasonable storyline, awesome special effects and weak and annoying villain performed by the awful Riz Ahmed. However, Tom Hardy has good performance in the role of the clumsy loser Eddie Brock and Michelle Williams complete the lead cast. This film is also the chance to see Stan Lee in his last cameo. My vote is seven.\r\nTitle (Brazil): \"Venom\"', 7),
(58, 17, 4, 201, 46, 'Venom is about the symbiotic relationship of man and alien, with the latter being the gross one. Funny at times, with a lovely performance from Tom Hardy -if you are a fan of mr Hardy, this is going to be entertaining for you. First half goes very well in terms of setting the story and the venom universe, second part is more about action and there it has a few flaws but it is still fun and interesting to watch. It is a cool view on the \"almost anti-hero\" venom/eddie character that kept my attention. I had a good time watching this in the theaters and i ll definitely have a second view when it comes out in bray or dvd. So, all in all its def not the best action film of all times or even of 2018...but dont have too high expectations and you will definitely like it. 8/10.', 8),
(59, 25, 3, 601, 459, 'Having read the book a hundred years ago, it took some time to begin to understand what was going on. If there is a criticism that many share, it is the pacing of the first part of the film. It needed something to set the scene for us, to show us who the strong and the weak were. I\'m not much for narration (show me, don\'t tell me), but it may not have been a bad idea. The scenes are magnificent with special effects off the chart. Many desert travel scenes are quite endless. How do you spruce up a desert. I thought the sand worms were a little one dimensional. I know there is another film down the road.', 8),
(60, 26, 8, 711, 305, 'Producers will blame the poor box office of \"No Time to Die\" on COVID but that\'s not why it\'s bombing. The movie is failing because there is no audience for it. It certainly wasn\'t made for fans of the Bond films (like me). The movie looks great with terrific location photography, the title is cool and Bond girls Lea Seydoux and Ana de Armas are wildly dreamy. Other than that, this movie has little to offer. The story isn\'t that interesting and the villain is weak. If there wasn\'t a lady in the theater (AMC Westbury, NY) laughing once in a while, I wouldn\'t have even noticed the jokes. It\'s also about twenty minutes too long. \"No Time to Die\" bites the hand that feeds it. It is, hands down, the worst movie of Daniel Craig\'s not-so-hot tenure as James Bond.', 4),
(61, 39, 10, 46, 16, 'For Halloween yesterday I watched the new Candyman and Halloween Kills. Both movies have been done repeatedly and to be honest at one point enough should be enough. Candyman wasn\'t bad though but it\'s nothing like the first movie when it was all a surprise. Halloween Kills on the other hand is just another movie too much. Nothing new, Michael Myers can\'t be killed, it doesn\'t matter if you stab him, shoot him, set him on fire, he just can\'t be killed nor injured. It\'s getting lame to be honest. Jamie Lee Curtis hasn\'t a huge role and that was maybe best like that. I hope this one was finally the last one because there\'s no milk to be milked anymore here.', 4),
(62, 39, 7, 119, 65, 'Halloween Kills is a mindless splatter movie, and that\'s already all that the movie got for you - some well staged killings. The rest is a rather tiresome affair, including characters who I can\'t related to and don\'t care for. The story? Just filler time till Michael does his next job. Is it the worst Halloween movie? I don\'t know, because all those new additions of the late 90s and after 2k I watched only once and are hidden behind a dense cloud named oblivion. To be honest, I can\'t remember anything of those movies. Verdict: Halloween Kills won\'t get a recommendation, but if you just need some dose of splatter, you may give it a try. This one is for sure just made to milk an almost dead cow.', 3),
(63, 24, 4, 2037, 333, 'The first one was fun and well played out. This sequel is a total misfire. Not because it follows the trend of having women being the alpha characters and portraying men as either weak or stupid, but simply because it\'s a lazy effort. Except a couple of scenes, and hilarious over-the-top acting by Pedro Pascal, I found nothing here. It has \"straight-to-DVD\" written all over it.', 4),
(64, 24, 5, 320, 109, 'Very colorful, lots of money spent. Kristin Wiig was a masterpiece of miscasting. She wasn\'t funny; she wasn\'t scary, but great costume. The whole plot was a vehicle to resurrect Chris Pine, but there was no real chemistry between them. It made the lines of endearment quite awkward and the embraces seemed forced. All the usual tropes: WW loses some of her powers, so there can be suspense; she plays Spiderman and holds two vehicles apart. Just nothing new and Gad Gadot proves again that she\'s a glamour model and poses well. She can\'t act. Still - entertainment in a vacuum of good movies, so watch it and be distracted for TWO AND A HALF hours.', 5),
(65, 47, 6, 177, 70, '6/10 - with the visuals of a true space blockbuster, this B movie features nonsensical dialogue, many many charcaters that serve absolutely no purpose, and an absolutely insane third act...but nonetheless, it\'s fun.', 6),
(66, 47, 8, 329, 149, 'Another Emmerich mess. A Big budget wasted in a sloppy execution and a handful of stars acting by paycheck won\'t save a hollow script. I wonder how many professional or talented amateur writers found their work denied and how on Earth (or Moon if you like) scripts like this are produced. Rubbish! And I\'m not insulting anyone, I\'m just judging what I saw.', 1),
(67, 47, 7, 67, 26, 'In 2011, astronaut Brian Harper (Patrick Wilson) is able to save a space shuttle mission from an alien swarm. Back on earth, he is betrayed by fellow astronaut Jocinda Fowler (Halle Berry) and gets blamed for human error. It\'s ten years later. Brian is a shell of himself. Conspiracy theorist KC Houseman (John Bradley) discovers that the moon\'s orbit is deteriorating and headed for earth. He tries to recruit Brian to contact NASA.\r\nDirector Roland Emmerich has woven a conspiracy theory into his brand of action sci-fi thriller. I like the potential. I even like the outlandish concept. The first half is a little clunky but I\'m willing to go with it. The problematic writing does build up over time. It\'s his never-ending close calls and melodramas. It\'s the awkward sci-fi. The second half stumbles here and there until it falls flat. Roland is no longer that guy anymore. He\'s not making the big budget action thriller hits.', 5),
(68, 45, 5, 436, 277, 'I wanted to like this movie. I really did. Anything novel and not Marvel. But, unfortunately, this movie was dark, slow and not engaging. It started off with the harsh power of humanity to endure hardship and to impose it, but then went flat with the story. Nothing to learn, no one to love or hate, nothing to make you a character. Not intending the ultimate insult, but perhaps it is: you never forget you\'re watching a movie. You don\'t become one with it. However, it could win an Academy award for the production or costumes, but none of that makes up for a dark, slow and non-engaging story.', 6),
(69, 46, 11, 338, 74, 'Alone the first scene is a fine example that many of today\'s movie producers, writers and directors too many times don\'t understand much about what they write about or produce (or they just don\'t care - I don\'t know what\'s worse): take the first scene, the attack in the war of the trenches. The French use gas to hide themselves and instead of putting on their gas masks (well, gas is dangerous, isn\' it?) and taking preparation for an attack (the use of gas almost always indicated an immediate attack), the Germans just say, hey, I can\'t see a thing, just lets stare around a little bit more or just keep on eating your soup. Next scene, we get some Blues tunes that are fine but, well, the movie plays in 1937, but the first electrical guitar ever build was a Rickenbacker in 1936, and the Blues style played belongs to the 40s and 50s... I just give you that two little examples to illustrate why the whole movie just feels wrong and even dumb sometimes - the characters of course behave and talk also out of time and place. Anyway, watchable, if you like the starred actors but compared to the movie of 1978, this one looks weak.', 4),
(70, 36, 5, 523, 169, 'Much like the protagonist in Venom: Let There Be Carnage, I feel like there were two different screenwriters battling about what this movie should be, and they didn\'t really communicate with each other. This sequel is a loud and frantic mess, where superpowers can do whatever the plot demands, characters don\'t care about consistency, and the same jokes are repeated a dozen times. If you liked the first Venom movie, you\'ll probably like this one. I didn\'t, so I don\'t.', 4),
(71, 36, 4, 74, 74, 'I\'m soooooooo tired of WOODY Harrelson in every fricking movie especially when he plays the villain. Hes just not intimidating he doesn\'t look like a villian come on hes made for zombieland. Those movies he is great but hes absolutely HORRIBLE in venom he is out of place his lines aren\'t villainous at all he is not intimidating or just plane old doesn\'t fit the part. Tom hardy is as always PHENOMENAL but this is venon it needs to be like deadpool it HAS TO BE R RATED!!!! It was just ok wait for it to stream see 007 instead.', 8),
(72, 44, 12, 976, 85, 'I was reluctantly dragged into the theater, thinking that they didn\'t need to make a Top Gun 2 and that the first one was where that story needed to end.\r\n\r\nI could write a couple paragraphs to summarize my feelings after walking out of the theater, but I\'m going to leave it with just one sentence.\r\n\r\nI was wrong.', 10),
(73, 44, 3, 497, 49, 'If there\'s any movie that deserves to be seen in the theaters with big screens and booming speakers. It\'s :Top Gun Maverick.\r\n\r\nOne of my best experiences in years!', 10),
(74, 40, 7, 104, 41, 'WOW, Pixar is really moving onward with creativity and originality. While the story itself and plotting may suffer a few issues like predictibility at times, amazing animation and stunning visuals, along with beautifully designed characters and great chemistry beetween actors who voiced those characters perfectly, make this movie great, enjoyable and worth watching. The way they\'ve used a mixture of real life elements and fantasy elements from Dungeons and Dragons universe is also great and worth mentioning. While, at first look it doesn\'t feel like a Pixar movie, the more time you spend watching it, you will get all feelings and heart you expect from your average Pixar movie. Dan Scanlon did a great job this time.', 9),
(75, 40, 8, 136, 18, 'This movie is pretty fast paced. The characters are always trying to get out of some kind of mess they created, so in other words you\'re never bored. I recommend you watch this film with your siblings. I\'m a grown man and this film had me tearing up lol. Another great film by Pixar.', 8),
(76, 44, 11, 378, 69, 'This is one of the best theatrical experiences I\'ve had and I\'m so happy someone has taken the practical route rather than throwing everyone into a green screen. I watched the first one many times and I can\'t believe this just topped it by a huge margin. Tom Cruise will be written as the most passionate filmmaker in history. I mean to put a whole cast in a bunch of f-18 jets and act in a jet as well as film yourself is a huge deal. If this movie does not cross a billion then there is something wrong with taste that people have these days. So called marvel fans. This is what you call a cinematic experience. Not some cropped cgi scenes.', 9),
(77, 42, 4, 414, 204, 'Obvious cgi, plot holes, and lack of character depth made uncharted fall in the kind of lame category. Some funny moments between Wahlberg and Holland and decent sets. It was just too unbelievable.', 5),
(78, 42, 6, 53, 24, 'I\'m being really generous with 6 stars, because this movie is neither really funny, nor really exciting.\r\nNot any good? The CGI effects are pretty special, but personally I often get bored when the CGI effects are the only thing keeping a movie afloat. And there are basically only 2 CGI spectacle scenes that are noteworthy and even those I found somewhat overkill and boring.\r\nLet\'s forget about the story. This is merely another adventure movie, like the Pirates of the Carribean meets National Treasure. It\'ll do if there is nothing else to watch, but dont expect any originality, dont expect many laughs and dont expect much thrillling action either...', 6),
(79, 42, 2, 135, 85, 'There\'s nothing to see here that is fun, turn away, lock the door, make a run; the CGI\'s poor, acting\'s amateur, all threads have frayed apart, become unspun.\r\n\r\n... and to think this might only be part 1!', 1),
(80, 41, 4, 332, 177, 'Well, you know those remakes that are basically the same thing as the first movie, only remove all plot, all elements of satire, and dumb down what is left while inserting a healthy dose of politics minus the dark satire that came with the original film?\r\n\r\nYou know, like Ghostbusters 2016, Robocop, Matrix 4, The Force Awakens.... yadda yadda yadda?\r\n\r\nWell, this is one of those movies. It\'s one of those movies that you knew was going to suck when you walked in and you only saw it because you are married to a Millennial?\r\n\r\nYeah, it\'s one of those.', 1),
(81, 41, 5, 56, 30, 'I don\'t know where the hype is coming from. Its not that i hate the movie or anything, but its just more of the same thing. Its a bloody slasher film, the acting is average, the killings are predictable, and the story is the same. Its a rehash of every other scream movie, its not bad, its just nothing new and frankly that makes it a little on the boring side.', 5),
(82, 27, 7, 165, 71, 'Black Widow ( Scarlett Johansson) must deal with a villain from her past and her long-absent family.\r\n\r\nLOUD, confusing and far too long. It starts off OK but quickly falls apart and becomes confusing and convoluted. The film is also way too long--it doesn\'t need to run over 2 hours. There\'s also tons of CGI at the end--way too much. The acting is OK. In short a long forgettable MCU movie.', 6),
(83, 27, 5, 29, 9, 'After all these years, Black Widow finally gets her own standalone movie and... it\'s okay. I actually found Florence Pugh, David Harbour, and Rachel Weisz to be entertaining additions, but the story felt cobbled together and it was riddled with plot holes. I know Natasha is a very skilled assassin, for instance, but she\'s almost invulnerable in this. It probably would have been better to give Black Widow her solo film a year or two after Iron Man 2 came out.', 6),
(84, 30, 3, 1051, 732, 'Detective Batman at its peak! Great storyline. Just as dark a universe as we\'ve come to expect from DC. The gloomy, gritty, dark tone of this film is exactly what I wanted. When you think the movie is over, there\'s more. Beautiful cinematography. Great score.', 9),
(85, 30, 9, 1463, 979, 'Everything about this movie is trying too hard - the over dramatic score, the long shots on characters faces, the overacting, the complex crime story - it all feels like it\'s trying to get an Oscar in every moment.\r\n\r\nIt\'s overly long, drawn out, and the story feels like a generic crime saga that has the Batman universe shoehorned into it.\r\n\r\nThis movie is not a masterpiece, but it spends a lot of effort making you think it is!', 5),
(86, 27, 12, 83, 35, 'You can see they made less effort with this one, it\'s pretty boring and slow paced too and gets tedius really fast. After about 20 minutes I was looking for something else to do while it played out.\r\n\r\nGetting really bored of assassin\'s fighting in the street and everyone still going about their business and no police ever seem to turn up.', 2),
(87, 28, 4, 262, 97, 'I am glad I watched this film for 3 reasons: 1-good runtime of 1h 50m, 2-never gets boring, 3-relentless impressive action sequences. Don\'t expect much from the plot but prepare yourselves for some epic monster fight scenes and some great ideas on visuals. If you have seen the previous kong and godzilla films then you will like this a tad more. But if you haven\'t, it doesn\'t matter; it will keep you invested throughout. Its at least a 7 because they kept it relevant to what it is. Its just a fun movie 7/10.', 7),
(88, 28, 6, 605, 297, 'This is a mindless, plotless action flick with great action and effects but not much else. The plot is mundane, ridiculous and predictable. Much of it didn\'t even make any sense, because nothing is adequately explained. The acting is mostly awful. The editing made it difficult to follow what little plot there was. Actually the whole series of movies in this rebirth have all been really bad and this just continues that tradition. I am at a complete loss to explain the high ratings some people have given it and cannot recommend it all. Seriously don\'t bother with this.', 5),
(89, 29, 2, 18, 8, 'The previous versions of this movie left me not expecting much but what a difference a talented director makes. In this story of the man who discovers a way to render himself invisible the tension is kept taut all the way. I was roped in immediately. The cast is spot on - both the casting and acting is great. While the special effects are beautifully fluid they are not overwhelming. A great ride.', 7),
(90, 31, 6, 1676, 539, 'Zack Snyder delivers by far his best film with Justice League. The film has an engaging story with a lot of heart and a great cast of characters who all have good chemistry together standouts being Ezra Millers Flash and Ray Fishers Cyborg. The film also has many easter eggs and cameos fans of the comics will recognize. Honestly as a big fan of DC this is my favorite DCEU film.', 10),
(91, 32, 5, 72, 97, 'The first time I watched The Suicide Squad it was with a number of other people and I have to admit that I really didn\'t get much from it. It was just OKAY to me.\r\nA couple of months later, my husband and I watched it and I really listened and paid attention, and I thought it was excellent - apart from the dumb / gratuitous harm to the birds (what the heck was that about, anyway?) and the ridiculous villainous \"thing\" (I won\'t say more in order to avoid a Spoiler tag). The \'twist\' early on, and the comedic flow, especially between Elba and Cena, was fantastic.\r\nThe thing is, although I normally do not find many movies to be rewatchable, we just got through watching it (for me, a third time) with family, and if anything, I found it even funnier than the last time! My rating of 9, is for the times I laughed just today.', 9),
(92, 31, 8, 184, 53, 'Zach Snyder\'s original version is 1000 x\'s better than the one Joss Whedon put in theaters. DC made a huge mistake not trusting Synder.', 8),
(93, 33, 4, 86, 44, 'Let\'s agree that it is a bad movie from multiple points of view. It depends a lot on the visual effects, its main characters can be funny but not nice, the story does not generate much interest and we have seen the fights many times and in a better way in almost any film produced in Hong Kong, Indonesia or Thailand of the last twenty years. The only thing that saves this film is the karaoke scene that is unexpectedly welcome. The rest is routine, mediocre, tiring and bland.', 5),
(94, 33, 5, 121, 67, 'Shang-Chi is a boring film. The characters were okay, but the story was choppy and confusing. The song choices were odd. Plus, this movie was way too long. And the scene at the end had me practically falling asleep.', 2),
(95, 33, 11, 39, 15, 'Everything comes in it beautiful science fiction and beautiful mythical creatures. Sometimes you have creatures that don\'t seem real, but these just seemed real. Well done! There was a bit of avatar feeling in it. Fighting for the safekeeping of peace. Really beautiful. And self-acceptance was also nicely incorporated.', 8),
(96, 32, 10, 111, 90, 'The first SS was a real idiocy, but this new part has managed to topple the sheer level of lunacy and imbecile crass low ebb by all means/ The recipe is simple - awful plot, unlikable characters, loud noise, lots of gore, cringe deaths, horrid pace, total absence of depth or integrity, sheer profanity and and on top of all that - lackluster performance where every aspect is overplayed and overcooked in lukewarm watr.\r\nEven Margot Robbie did not save this abomination since her part is a pathetic clowning with no merit.\r\nIn a word - stupid to the brink of clear abomination.', 1),
(97, 32, 11, 24, 7, '...but this has all the imperfections and grit I want in an ADULT superhero movie. As odd as this seems, I saw \"Invincible\" animation series, and this reminded me of an IRL version of that.\r\n\r\nThe comedy is actually funny and not cheesy or cringy, the superheroes outside of Cena don\'t all look roided to be powerful, and there\'s actually good acting.\r\n\r\nMarvel is for kids, DC is for adults-hate it but if you\'re honest you\'d agree.', 8),
(98, 37, 12, 600, 221, 'Shang-Chi gave me hope for Phase 4 of Marvel. Eternals dashed those hopes. This is probably my least favorite Marvel movie. This film is too long and crammed full of overly complicated plot points, yet it\'s also completely predictable. It seems the filmmakers were too busy trying to check off boxes rather than create a good story. It\'s also a downer. People watch MCU movies to have fun, not to have existential crises. Perhaps the Eternals should have stood on the sidelines a little longer.', 4),
(99, 38, 4, 290, 87, 'There are times during the first quarter when you may believe someone\'s spiked your drink with an hallucinogenic as Disney\'s innovative way of capturing our entrance and exit to the world is developed but, as you will find, this is a film to get you thinking and, more importantly, thinking about yourself - reflecting so to speak. Delivered with the usual Pixar excellence, if this doesn\'t make you realise that tomorrow is the first day of the rest of your life then rewind, pause and start again, because the message is universally important to all - and that includes you!!!', 9),
(100, 38, 6, 989, 122, 'While I found myself thoroughly engrossed while watching this movie a funny thing happened around the half way point. I realized I hadn\'t laughed once. Sure I had smiled a few times at the low key humor but never was a joke thrown in my face that seemed like it was just thrown in there to make sure the film didn\'t lose the kiddos. Admittedly Pixar doesn\'t usually go out of its way to ensure kids laughing every second but this film REALLY doesn\'t have that on it\'s mind.\r\n\r\nThis is a lovely story about a grown man discovering his true gifts in life and it left a big smile on my face. A very sweet and inventive film that will hopefully leave most of us adults with something to think about when the credits role.', 10),
(101, 34, 5, 51, 12, 'Recently, \"Pokemon Detective Pikachu\" came out...and \"Sonic the Hedgehog\" a few months later. Of the two, \"Sonic\" is definitely my favorite...simply because it was more fun and the plot was simpler and more enjoyable.\r\nThe story isn\'t all that important...so instead, I\'ll just say that it\'s a buddy picture, of sorts. The crazed Dr. Robotnik (Jim Carrey) is seeking to capture or destroy Sonic....so it\'s up to Sonic\'s new friend (James Marsden) to help him avoid this nutty guy.\r\nThe choice to hold off release to make Sonic look less creepy was a very good one. Additionally, the story is fun...and not especially complicated. Good for kids...as well as parents forced to watch it with them!', 7),
(102, 35, 8, 30, 9, 'How does this Bad Boys sequel gets such a high rating? There\'s clearly some cheating going on with those ratings. Bad Boys For Life is without a doubt the worst movie of this franchise. I did enjoy the early Bad Boys so I thought this one would be in the same lineage but all I got was irritation. I don\'t know who wrote this script but it\'s cringing to watch at times. We\'re used to overly exaggerated action scenes in this kind of movies but here it just gets ridiculous. The chemistry between Will Smith and the normally always funny Martin Lawrence is completely lost. I could count the funny moments on one hand, and even with those I had to force a smile. I can\'t say I did enjoy this movie, I was glad when I saw the end credits appearing, and I sincerely hope that they will close this chapter forever. We don\'t need another Bad Boys.', 4),
(103, 34, 7, 637, 109, 'When I saw the original trailer I was genuinely horrified in Sonic\'s design, like a person in bad cosplay. After the redesign many like myself felt the need to support this movie to honour the fan service and genuine care. I\'m sure glad that I did. A funny movie, Jim Carrey was amazing like always and of course Sonic looked great. A very fun movie for the whole family.', 8);

-- --------------------------------------------------------

--
-- Table structure for table `userinfo`
--

DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE IF NOT EXISTS `userinfo` (
  `user_id` int(10) NOT NULL,
  `fullname` varchar(255) NOT NULL,
  `birthday` date NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  KEY `fk_ui_users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
CREATE TABLE IF NOT EXISTS `users` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL,
  `pw_hash` varchar(1000) NOT NULL,
  `role` varchar(25) DEFAULT 'user',
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`user_id`, `username`, `pw_hash`, `role`) VALUES
(1, 'admin', '$2y$10$jMVHYj3fRUj849/4KdAdL.mJWWJeJhxCVrEDrUkSoP7ZpUW3GqIGS', 'admin'),
(2, 'giauy1', '$2y$10$De7AoNSPJrKwhkdg.TA3IO2458DICgySyG51QUWF9wvfbhLIdWouO', 'user'),
(3, 'giauy321', '$2y$10$h8mMIDcKLysOe6OIaBKbh.6sw8hrdmQkArZyMv8VUHIfXGQoFmQBm', 'user'),
(4, 'lahuy', '$2y$10$imMDbKWtBvcl/yTsT.TPFu8YPV5uid.MQxSdY69sixGYhBYGfj6E2', 'user'),
(5, 'trunghai', '$2y$10$EwGg2p5It4SzcQRuuWgP9uq4zO9E9G5GuI07TOE9YXUN.fJocjvRa', 'user'),
(6, 'nhatthanh', '$2y$10$iVjKHML/Hs.PxqKpF6jr..INixZ6H4L25MUtJTvl.J9af1Zs4ZucW', 'user'),
(7, 'phuhoa', '$2y$10$aRoG9dGEC89ZpxCJPojVOuk4w0GCCnPGsFcNBPaZX0Fo7NjWAzTSe', 'user'),
(8, 'phutai', '$2y$10$V5.7t5/eRb3dDksfxIRRd.fovz4nIo9I.Kr0J90D5tBXfvC6n1ZGi', 'user'),
(9, 'reviewer', '$2y$10$sztjeOd1T49FQg01UJW6yelUuq.BGWKo320f8FhY7.doutaQvPTAS', 'user'),
(10, 'giauy', '$2y$10$swPCRmAxiv3.r09BaJ5dmOOTuhqyWw7/2gv1o725uEiCNTg3CoJM.', 'user'),
(11, 'idontwatchmovies', '$2y$10$9CgcYazAwJVvYEx.bNKjpuR3bFwMXPeAwaoEqlFXtLIpfbFSR0T8O', 'user'),
(12, 'caphesuada', '$2y$10$X.Jhh2CYyhsQuvZPm2Y1cuN9m8ycSZAu6SW/l7Q0Y7VdflT//aAa6', 'user');

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `fk_ca_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);

--
-- Constraints for table `cartinfo`
--
ALTER TABLE `cartinfo`
  ADD CONSTRAINT `fk_ci_cart` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`cart_id`),
  ADD CONSTRAINT `fk_ci_movie` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`);

--
-- Constraints for table `moviebrand`
--
ALTER TABLE `moviebrand`
  ADD CONSTRAINT `fk_mb_brand` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`brand_id`),
  ADD CONSTRAINT `fk_mb_movie` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`);

--
-- Constraints for table `moviegenre`
--
ALTER TABLE `moviegenre`
  ADD CONSTRAINT `fk_mg_genre` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`genre_id`),
  ADD CONSTRAINT `fk_mg_movie` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`);

--
-- Constraints for table `movieimage`
--
ALTER TABLE `movieimage`
  ADD CONSTRAINT `fk_mi_movie` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`);

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `fk_mr_movie` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`),
  ADD CONSTRAINT `fk_mr_user` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`),
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`movie_id`);

--
-- Constraints for table `userinfo`
--
ALTER TABLE `userinfo`
  ADD CONSTRAINT `fk_ui_users` FOREIGN KEY (`user_id`) REFERENCES `users` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
