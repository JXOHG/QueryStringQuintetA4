-- MySQL dump 10.13  Distrib 8.0.40, for Win64 (x86_64)
--
-- Host: localhost    Database: songselector
-- ------------------------------------------------------
-- Server version	8.0.40

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `Name` varchar(60) NOT NULL,
  `NumberOfEmployees` int DEFAULT NULL,
  `NetWorth` decimal(25,2) DEFAULT NULL,
  PRIMARY KEY (`Name`),
  UNIQUE KEY `Name` (`Name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES ('Alpha Access',229,293144.27),('Alpha Associates',457,309077.81),('Alpha Corp',515,899956.09),('Alpha Creations',445,711814.01),('Alpha Depot',729,892068.90),('Alpha Marketing',91,978252.75),('Alpha Partners',702,644577.94),('Alpha Projects',985,435656.62),('Alpha Space',620,564560.95),('Alpha Strategy',971,186934.50),('Alpha Works',854,445697.83),('Apex Associates',760,671166.98),('Apex Concepts',56,978249.80),('Apex Creations',477,457687.81),('Apex Development',273,206740.91),('Apex Fabrics',592,360262.11),('Apex Industries',818,562534.42),('Beta Energy',668,656416.86),('Beta Hub',947,468951.75),('Beta Incorporated',513,106805.40),('Beta Matrix',518,837629.45),('Beta Network',236,354055.37),('Beta Partners',192,181720.42),('Black Concepts',466,217349.00),('Black Consulting',233,876869.33),('Black Dynamics',558,747287.62),('Black Hardware',242,115255.01),('Black Partners',455,460705.79),('Black Spark',327,317464.50),('Black Works',385,225671.09),('Blue Arena',518,389859.70),('Blue Dynamics',411,946233.73),('Blue Foundry',317,227384.36),('Blue Group',136,158031.53),('Blue Hardware',712,782356.02),('Blue Links',309,119228.44),('Brilliant Analytics',888,466461.64),('Brilliant Consulting',966,298748.49),('Brilliant Development',313,181552.54),('Brilliant Enterprises',874,503875.18),('Brilliant Frontier',680,306856.74),('Brilliant Marketing',298,979505.11),('Brilliant Matrix',746,896520.75),('Brilliant Projects',811,817101.00),('Brilliant Solutions',908,602438.75),('Cloud Horizons',639,372906.15),('Cloud Spark',838,481620.69),('Delta Circuit',139,350672.00),('Delta Fabrics',248,627657.34),('Delta Innovations',609,260774.01),('Delta Links',535,176752.73),('Delta Strategy',854,846799.61),('Digital Associates',328,954209.75),('Digital Collaborations',505,104005.90),('Digital Corp',497,898906.11),('Digital Creations',199,707744.56),('Digital Development',60,698980.65),('Digital Frontier',632,926507.92),('Digital Interface',113,317707.68),('Digital Laboratories',922,230966.80),('Digital Links',251,830424.55),('Digital Network',568,387903.66),('Digital Services',139,387187.74),('Digital Software',766,728216.16),('Digital Space',309,434778.12),('Dynamic Creations',108,674855.73),('Dynamic Development',771,290969.10),('Dynamic Engineering',455,265828.22),('Dynamic Fabrics',558,776352.74),('Dynamic Group',997,384806.23),('Dynamic Holdings',864,245079.31),('Dynamic Marketing',500,590616.05),('Dynamic Solutions',702,723294.41),('Dynamic Space',225,987224.32),('Eco Group',839,677657.23),('Eco Innovations',230,952178.48),('Eco Limited',353,103320.54),('Eco Links',245,758844.01),('Elite Concepts',114,805232.64),('Elite Holdings',934,955312.57),('Elite Impulse',907,898802.96),('Elite Node',844,963592.63),('Elite Partners',653,435686.47),('Energy Access',152,291037.33),('Energy Analytics',73,628820.11),('Energy Circuit',107,749886.36),('Energy Dynamics',984,588715.29),('Energy Holdings',703,928266.44),('Energy Impulse',543,195958.45),('Energy Links',762,441103.78),('Energy Space',634,436232.09),('Energy Systems',245,193720.18),('Energy Works',604,549863.17),('Future Consulting',533,827185.68),('Future Corp',278,896615.30),('Future Energy',871,888015.90),('Future Holdings',89,897084.46),('Galaxy Circuit',915,725214.09),('Galaxy Energy',666,850387.16),('Galaxy Enterprises',297,372210.13),('Galaxy Holdings',247,379263.67),('Galaxy Incorporated',974,164417.28),('Galaxy Industries',831,514209.60),('Galaxy Marketing',265,486673.97),('Galaxy Software',132,772745.80),('Galaxy Ventures',189,584242.61),('Gamma Collaborations',534,194199.45),('Gamma Group',380,911011.36),('Gamma Incorporated',638,288346.99),('Gamma Innovations',775,391547.87),('Gamma Partners',323,247499.76),('Gamma Solutions',662,890091.56),('Gamma Technologies',925,205466.59),('Gen Arena',906,460395.57),('Gen Associates',227,495014.62),('Gen Holdings',394,465392.30),('Gen Horizons',523,741369.96),('Gen Partners',335,142101.71),('Gen Valley',384,951699.61),('Global Collaborations',894,595468.31),('Global Concepts',950,248851.96),('Global Engineering',185,328118.66),('Global Fabrics',243,521357.00),('Global Group',223,537543.50),('Global Matrix',786,744156.32),('Global Systems',699,853890.73),('Global Wave',199,662951.61),('Green Access',296,456142.18),('Green Concepts',265,112019.82),('Green Enterprises',136,272695.50),('Green Horizons',432,522711.37),('Green Industries',814,671220.80),('Green Solutions',232,632936.87),('Hyper Access',315,404061.28),('Hyper Engineering',904,795816.33),('Hyper Foundry',468,449123.11),('Hyper Frontier',691,289753.30),('Hyper Horizons',497,290578.54),('Hyper Industries',79,813238.63),('Hyper Interface',786,619698.06),('Hyper Works',463,887051.36),('Infinity Access',362,769462.58),('Infinity Analytics',412,618429.66),('Infinity Associates',420,659629.17),('Infinity Hub',960,422908.55),('Infinity Incorporated',369,196980.96),('Infinity Links',485,852128.00),('Infinity Marketing',969,696984.32),('Infinity Services',464,835875.51),('Infinity Solutions',134,840488.46),('Infinity Ventures',474,210183.23),('Info Impulse',522,812741.45),('Info Software',861,102624.52),('Info Strategy',218,828843.64),('Info Technologies',573,238333.96),('Innovative Circuit',213,824797.12),('Innovative Designs',638,995652.82),('Innovative Frontier',548,142552.15),('Innovative Industries',455,260741.34),('Innovative Laboratories',159,398540.63),('Innovative Space',483,319513.29),('Innovative Ventures',463,700679.44),('Innovative Wave',531,364932.56),('Macro Hub',311,269654.46),('Macro Limited',996,788286.64),('Macro Solutions',203,577386.25),('Macro Wave',869,765861.83),('Mega Access',126,770891.99),('Mega Arena',257,331718.48),('Mega Collaborations',603,427139.74),('Mega Engineering',611,983405.04),('Mega Partners',343,383956.15),('Mega Space',873,248616.65),('Mega Systems',455,894641.83),('Micro Collaborations',102,889194.27),('Micro Depot',954,485564.26),('Micro Fabrics',676,419660.98),('Micro Horizons',138,737567.99),('Micro Industries',223,173221.02),('Micro Interface',142,965337.72),('Micro Node',966,384094.99),('Moon Capital',332,157655.33),('Moon Engineering',387,828633.51),('Moon Foundry',901,610547.18),('Moon Horizons',464,489793.62),('Moon Innovations',510,722135.79),('Moon Links',845,288518.93),('Moon Software',954,134115.83),('Moon Solutions',301,752701.78),('Moon Ventures',480,634351.47),('Moon Wave',160,595919.25),('Nano Creations',996,413071.38),('Nano Development',312,611632.96),('Nano Enterprises',655,695892.26),('Nano Fabrics',888,196918.48),('Nano Matrix',721,450985.66),('Nano Partners',846,511670.38),('Nano Services',197,143990.75),('Nano Wave',364,623004.40),('Net Concepts',108,181743.34),('Net Creations',812,376160.75),('Net Holdings',528,816019.57),('Net Links',919,714695.27),('Net Marketing',240,162910.74),('Net Partners',123,196888.01),('Net Productions',806,278198.03),('Net Services',546,447856.02),('Next Associates',903,761067.41),('Next Circuit',577,972354.50),('Next Depot',456,721083.61),('Next Designs',127,846634.23),('Next Laboratories',523,404491.77),('Next Productions',946,149407.08),('Next Solutions',109,666537.47),('Omni Analytics',809,334376.68),('Omni Concepts',325,196747.34),('Omni Creations',633,692994.52),('Omni Enterprises',578,612940.88),('Omni Foundry',847,850929.65),('Omni Industries',391,534803.61),('Omni Innovations',672,401734.83),('Omni Network',265,431163.11),('Omni Productions',314,174401.15),('Pioneer Engineering',887,449203.04),('Pioneer Fabrics',141,270533.31),('Pioneer Partners',969,477618.13),('Pioneer Strategy',802,767969.77),('Pioneer Technologies',576,953743.13),('Planet Horizons',738,955937.15),('Planet Impulse',920,489417.24),('Planet Industries',489,450948.99),('Planet Matrix',667,601439.87),('Planet Partners',864,575045.02),('Planet Software',742,172660.69),('Prime Concepts',210,565839.62),('Prime Designs',693,640179.54),('Prime Group',215,274196.79),('Prime Innovations',525,497665.73),('Prime Partners',930,640002.84),('Prime Wave',230,912042.92),('Pro Frontier',973,219257.77),('Pro Marketing',736,723869.39),('Quantum Collaborations',526,248489.99),('Quantum Energy',500,982501.31),('Quantum Partners',281,225156.59),('Quantum Services',470,557154.82),('Quantum Solutions',682,581568.63),('Quantum Space',82,402092.35),('Quantum Valley',643,966965.89),('Rapid Analytics',499,997952.42),('Rapid Corp',555,497050.69),('Rapid Creations',922,221255.51),('Rapid Enterprises',152,938359.76),('Rapid Foundry',872,762737.60),('Rapid Incorporated',925,511423.53),('Red Access',639,750783.91),('Red Collaborations',288,421530.77),('Red Depot',151,523461.59),('Red Frontier',507,811993.50),('Red Incorporated',747,257721.30),('Red Innovations',566,329232.48),('Red Interface',226,725918.49),('Red Productions',423,787930.96),('Red Wave',413,539043.68),('Smart Corp',363,462752.47),('Smart Wave',829,120412.19),('Sony Music Entertainment',8500,18000000000.00),('Sphere Corp',586,714106.57),('Sphere Creations',584,506486.32),('Sphere Horizons',203,797299.06),('Sphere Wave',413,297645.37),('Sphere Works',240,185563.63),('Star Arena',264,684353.16),('Star Energy',497,704223.59),('Star Fabrics',551,703560.99),('Star Hardware',60,784049.40),('Star Limited',773,121070.23),('Star Links',913,187659.05),('Star Matrix',228,639666.60),('Star Node',377,882416.62),('Star Services',156,676213.61),('Star Solutions',657,959676.98),('Star Works',323,160566.99),('Sun Arena',995,901849.73),('Sun Collaborations',180,260282.25),('Sun Concepts',457,491641.80),('Sun Corp',710,942228.88),('Sun Designs',677,223478.52),('Sun Energy',865,253860.74),('Sun Engineering',386,485907.42),('Sun Incorporated',497,245107.26),('Sun Productions',601,953848.22),('Sun Ventures',396,964471.90),('Sun Works',247,326676.83),('Tech Bridge',299,243907.51),('Tech Corp',429,277706.15),('Tech Development',168,690467.64),('Tech Dynamics',271,327364.78),('Tech Foundry',200,832985.39),('Tech Group',783,644220.94),('Tech Industries',183,627757.66),('Tech Interface',511,701610.19),('Tech Space',336,275780.90),('Tech Systems',553,792549.72),('Tech Valley',692,812107.66),('Tech Wave',103,123825.08),('Techno Associates',779,817461.12),('Techno Designs',143,981031.26),('Techno Incorporated',399,446952.70),('Techno Software',186,657685.50),('Techno Ventures',216,668313.85),('Terra Concepts',209,227468.24),('Terra Impulse',538,330141.80),('Terra Interface',433,454138.55),('Terra Systems',242,186661.97),('Terra Technologies',832,735130.31),('Turbo Arena',165,593913.93),('Turbo Hub',345,200958.63),('Turbo Network',501,403450.31),('Turbo Partners',225,697020.80),('Turbo Services',724,962429.22),('Turbo Ventures',398,638011.73),('Ultra Depot',175,815399.51),('Ultra Laboratories',322,955171.78),('Ultra Space',305,868625.04),('Ultra Strategy',941,540966.37),('Vertex Development',923,821555.32),('Vertex Dynamics',939,287454.30),('Vertex Node',663,934741.13),('Vertex Software',553,120445.12),('Vertex Solutions',331,991022.51),('Vertex Wave',921,270730.17),('Vision Associates',914,341569.51),('Vision Designs',148,285973.62),('Vision Frontier',856,201728.93),('Vision Industries',956,343459.76),('Vision Interface',840,796744.52),('Vision Productions',337,972073.92),('Vision Ventures',393,904013.26),('Volt Concepts',389,369537.42),('Volt Energy',676,140630.00),('Volt Engineering',181,204863.58),('Volt Enterprises',241,760820.02),('Volt Impulse',931,607675.46),('Vortex Access',629,291175.74),('Vortex Collaborations',884,443150.06),('Vortex Group',406,529944.53),('Vortex Links',925,272672.88),('Vortex Partners',902,236033.60),('Vortex Productions',461,149790.44),('Vortex Projects',408,551941.55),('Vortex Wave',741,222570.80),('Wave Capital',445,117747.43),('Wave Interface',278,977664.32),('Wave Limited',772,917602.94),('Wave Works',108,753799.24),('White Associates',288,650517.58),('White Engineering',989,482369.10),('White Interface',650,205153.04),('White Technologies',364,419651.23),('White Works',517,317048.28);
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-11-24 12:11:39