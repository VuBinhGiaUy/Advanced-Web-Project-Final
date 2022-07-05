-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: Jul 05, 2022 at 09:07 AM
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
(50, 'X', 'At a secluded farmhouse in Texas, a film crew arrives to shoot an adult film. Their hosts, a reclusive elderly couple, take a special interest in their young guests. As night falls the couple\'s leering interest turns violent.', 'https://images.static-bluray.com/movies/covers/312907_large.jpg?t=1650694385', 'https://youtu.be/_67iqeUPfB0', 2022, '39.99', 105, '7.30', NULL, 'R');

-- --------------------------------------------------------

--
-- Table structure for table `moviebrand`
--

DROP TABLE IF EXISTS `moviebrand`;
CREATE TABLE IF NOT EXISTS `moviebrand` (
  `movie_id` int(10) DEFAULT NULL,
  `brand_id` int(10) DEFAULT NULL,
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
  `movie_id` int(10) DEFAULT NULL,
  `genre_id` int(10) DEFAULT NULL,
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
  `movie_id` int(10) DEFAULT NULL,
  PRIMARY KEY (`img_id`),
  KEY `fk_mi_movie` (`movie_id`),
  KEY `img_id` (`img_id`)
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
  `review_id` int(11) NOT NULL AUTO_INCREMENT,
  `movie_id` int(10) DEFAULT NULL,
  `user_id` int(10) DEFAULT NULL,
  `review_like` int(11) DEFAULT NULL,
  `review_dislike` int(11) DEFAULT NULL,
  `review_content` varchar(1000) CHARACTER SET utf32 COLLATE utf32_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`review_id`),
  KEY `fk_mr_movie` (`movie_id`),
  KEY `fk_mr_user` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE IF NOT EXISTS `user` (
  `user_id` int(10) NOT NULL,
  `username` varchar(255) DEFAULT NULL,
  `pw_hash` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Constraints for dumped tables
--

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
  ADD CONSTRAINT `fk_mr_user` FOREIGN KEY (`user_id`) REFERENCES `user` (`user_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
