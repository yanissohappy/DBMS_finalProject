-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- 主機： 127.0.0.1
-- 產生時間： 2020-05-29 05:04:10
-- 伺服器版本： 10.4.11-MariaDB
-- PHP 版本： 7.4.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- 資料庫： `shoppingmall`
--

-- --------------------------------------------------------

--
-- 資料表結構 `agent`
--

CREATE TABLE `agent` (
  `agent_id` int(11) NOT NULL,
  `agent_name` varchar(30) NOT NULL,
  `agent_address` varchar(60) NOT NULL,
  `agent_representative` varchar(20) NOT NULL,
  `agent_money` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `agent`
--

INSERT INTO `agent` (`agent_id`, `agent_name`, `agent_address`, `agent_representative`, `agent_money`) VALUES
(1, '猿鎂國際映像有限公司', '桃園市很棒區文昌三十街64號', '陳一二', 5000000),
(2, '木眠發股份有限公司', '新北市中三路649000號16樓', '督筑瑜', 80000000),
(3, '羅書事業有限公司', '台北市信義區二段111號8樓', '小羅羅', 50000000),
(4, '電線國際多媒體有限公司', '臺北市中央路136之21號4樓', '小馮', 3000000),
(5, '裙茵社國際股份有限公司', '新北市四重區光復路88210號21樓', '黃綠紅', 50000000),
(6, '普爾國際股份有限公司', '新北市四重區新北大道三十段2620號62樓', '飛鼠人', 40000000),
(7, '很森利多媒體股份有限公司', '台南市南投區一二三路七段', '郭珈珈', 10000000),
(8, '嫚D傳播有限公司', '新北市板橋區五民路十段11號45樓之1', '李鴻章', 50000000),
(9, '滑鼠狗國際公司', '宜蘭縣羅東鎮國盛三街四段782巷730弄890號70樓', '滑狗王', 99999999),
(10, '王道一二三文化事業有限公司', '台北市和平東路七段18號112樓之11', '徐志摩', 6000000),
(11, '八點檔公司', '高雄市新興區隨便的路上', '陳阿一', 100000),
(12, '是郭問號有限公司', '新北市郭譬區649號6樓', '郭譬寺', 94879487);

-- --------------------------------------------------------

--
-- 資料表結構 `buy`
--

CREATE TABLE `buy` (
  `merchandise_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `buy`
--

INSERT INTO `buy` (`merchandise_id`, `customer_id`) VALUES
(2, 2),
(3, 1),
(7, 3),
(7, 10),
(8, 5),
(8, 10),
(9, 2),
(11, 5),
(13, 4),
(15, 2),
(16, 3),
(16, 9),
(18, 14),
(19, 4),
(19, 11),
(19, 14),
(21, 6),
(21, 9),
(21, 10),
(23, 7),
(24, 8),
(24, 11),
(25, 4),
(25, 8),
(26, 13),
(27, 7),
(28, 4),
(28, 12),
(29, 11),
(30, 5);

-- --------------------------------------------------------

--
-- 資料表結構 `conference`
--

CREATE TABLE `conference` (
  `conference_id` int(11) NOT NULL,
  `conference_topic` varchar(50) NOT NULL,
  `conference_poll_amount` int(11) NOT NULL,
  `conference_location` varchar(100) NOT NULL,
  `conference_date` date NOT NULL,
  `agent_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `conference`
--

INSERT INTO `conference` (`conference_id`, `conference_topic`, `conference_poll_amount`, `conference_location`, `conference_date`, `agent_id`) VALUES
(1, '第一次召集', 32, '世貿中心65532', '2020-03-10', 1),
(2, '資金公布2', 32, '世貿中心32A', '2020-03-13', 4),
(3, '資金公布', 55, '國際會議廳32A', '2020-03-16', 2),
(4, '所需場佈討論', 22, '國際會議廳32A', '2020-03-17', 3),
(5, '動線規劃', 35, '國際會議廳32A', '2020-03-20', 4),
(6, '展場位置分配', 44, '世貿中心一館', '2020-03-27', 5),
(7, '展場位置分配2', 34, '世貿中心一館', '2020-03-28', 6),
(8, '展場位置分配3', 44, '世貿中心一館', '2020-03-29', 7),
(9, '開幕典禮討論', 22, '世貿中心44322B', '2020-04-01', 9),
(10, '閉幕典禮討論', 21, '世貿中心44322B', '2020-04-03', 8);

-- --------------------------------------------------------

--
-- 資料表結構 `customer`
--

CREATE TABLE `customer` (
  `customer_id` int(11) NOT NULL,
  `customer_name` varchar(20) NOT NULL,
  `customer_email` varchar(50) NOT NULL,
  `customer_address` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `customer`
--

INSERT INTO `customer` (`customer_id`, `customer_name`, `customer_email`, `customer_address`) VALUES
(1, '灶門炭治郎', 'tanjiro@gmail.com', '澎湖縣西嶼鄉國富二十六路10巷723號'),
(2, '灶門禰豆子', 'nezuko@gmail.com', '澎湖縣西嶼鄉國富二十六路10巷723號'),
(3, '產屋敷耀哉', 'Kagaya@gmail.com', '新北市三重區三多五街二段598巷728弄833號36樓'),
(4, '煉獄杏壽郎', 'Rengoku@gmail.com', '桃園市桃園區太平路五段144巷724號7樓'),
(5, '胡蝶忍', 'Shinobu@gmail.com', '宜蘭縣礁溪鄉士林街一段218巷444號29樓'),
(6, '富岡義勇', 'Giyuu@gmail.com', '新北市鶯歌區鳳楠街二段381巷796號87樓'),
(7, '甘露寺蜜璃', 'Kanroji@gmail.com', '新竹市東區慶豐九路一段620巷211號85樓'),
(8, '時透無一郎', 'Tokito@gmail.com', '南投縣埔里鎮莊敬路一段898巷777號'),
(9, '悲鳴嶼行冥', 'Himejima@gmail.com', '金門縣金沙鎮水碓二路七段935巷15號'),
(10, '我妻善逸', 'Agatsuma@gmail.com', '雲林縣莿桐鄉山湖二街九段690號'),
(11, '不死川實彌', 'Shinazugawa@gmail.com', '嘉義市東區赤崁東街四段234巷812弄595號'),
(12, '嘴平伊之助', 'Hashibira@gmail.com', '臺東縣金峰鄉松信一街八段301巷534弄548號'),
(13, '鱗瀧左近次', 'Urokodaki@gmail.com', '屏東縣鹽埔鄉新基街828巷128號5樓'),
(14, '不死川玄彌', 'Shinazugawa@gmail.com', '臺北市中山區東信路692巷9號');

-- --------------------------------------------------------

--
-- 資料表結構 `merchandise`
--

CREATE TABLE `merchandise` (
  `merchandise_id` int(11) NOT NULL,
  `merchandise_name` varchar(50) NOT NULL,
  `merchandise_amount` int(11) NOT NULL,
  `merchandise_import_time` date NOT NULL,
  `agent_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `merchandise`
--

INSERT INTO `merchandise` (`merchandise_id`, `merchandise_name`, `merchandise_amount`, `merchandise_import_time`, `agent_id`) VALUES
(1, '炭治郎馬克杯', 99, '2020-05-01', 2),
(2, '禰豆子束口袋', 33, '2020-05-02', 2),
(3, '家庭教師里包恩戒指', 3, '2019-09-01', 2),
(4, '柯南杯套', 23, '2020-05-02', 6),
(5, '滑鼠狗貼圖', 300, '2020-05-20', 9),
(6, '滑鼠狗毛巾', 22, '2020-05-02', 9),
(7, '一千零二夜畫掛軸', 21, '2020-05-01', 3),
(8, '雨滴水晶球', 22, '2020-05-07', 10),
(9, '事監情公仔(附贈底座)', 3, '2020-05-04', 11),
(10, '恐怖情人小說選集', 44, '2020-05-04', 11),
(11, '卡片鬥爭!! 先導者收集冊', 10, '2020-05-13', 1),
(12, '未來卡片 戰鬥夥伴書', 31, '2020-05-27', 1),
(13, '地獄少女公式集', 13, '2020-05-19', 4),
(14, '魔女的考驗之香草是綠茶', 15, '2020-05-24', 4),
(15, '戰鬥吧少年襪套', 11, '2020-05-13', 5),
(16, '我不想再戰鬥了公式集', 17, '2020-05-09', 5),
(17, '逃走吧！阿花限量枕頭套', 38, '2020-05-16', 7),
(18, '《魔道鮮師》單行本第一冊', 14, '2020-05-28', 8),
(19, '<是關我?>公式集', 1, '2020-05-25', 12),
(20, '本公司的董事長心路歷程集', 2, '2020-05-24', 12),
(21, '《周刊騷年》2020ver06', 300, '2020-05-17', 5),
(22, '不二州柱網球吊飾', 5, '2020-05-16', 8),
(23, '《愛的蘿蔓死》單行本99集', 2, '2020-04-13', 3),
(24, '《噢我的手腫區》公式集', 3, '2020-04-01', 3),
(25, '《批鬥大會》ver03', 8, '2020-04-06', 6),
(26, '《壞人是阿麗博士》', 9, '2020-04-11', 10),
(27, '《滷夫的滷味攤！》中華二番！', 7, '2020-03-04', 7),
(28, '《嗨棉寶寶》周刊', 34, '2020-04-24', 7),
(29, '小藍帽掐掐手環', 33, '2020-05-01', 11),
(30, '摸法鎮天使手環', 3, '2020-05-02', 12);

-- --------------------------------------------------------

--
-- 資料表結構 `original_manufacturer`
--

CREATE TABLE `original_manufacturer` (
  `original_manufacturer_id` int(11) NOT NULL,
  `original_manufacturer_company_name` varchar(100) NOT NULL,
  `original_manufacturer_representative` varchar(100) NOT NULL,
  `original_manufacturer_address` varchar(100) NOT NULL,
  `original_manufacturer_authen_date` date NOT NULL,
  `agent_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `original_manufacturer`
--

INSERT INTO `original_manufacturer` (`original_manufacturer_id`, `original_manufacturer_company_name`, `original_manufacturer_representative`, `original_manufacturer_address`, `original_manufacturer_authen_date`, `agent_id`) VALUES
(1, '動映股份公司', '小泉林', '花蓮縣光復鄉竹林街五段770巷267弄342號', '2019-09-03', 1),
(2, '哈哈哈映股份公司', '小王尊', '南投縣集集鎮新興海埔地三路一段76巷889弄696號91樓', '2019-09-06', 2),
(3, '周刊艘年公司', '我妻英二', '基隆市中正區遼北街987巷700弄466號60樓', '2020-01-07', 3),
(4, '好年清有限股份公司', '東英一', '嘉義市東區民權東街二段146巷610弄645號', '2020-01-09', 3),
(5, '蒼海國際映畫公司', '伸晉醫', '澎湖縣白沙鄉平等街308號', '2020-05-13', 4),
(6, '皮諾渴東映象公司', '山本西', '新北市泰山區全福街70號', '2020-05-09', 5),
(7, '西東映象公司', '山本五', '新竹縣竹東鎮德美路二段683巷699號44樓', '2019-12-12', 6),
(8, '八卦就四贊股份有限公司', '菊池丸一郎', '基隆市仁愛區麻園六路594號95樓', '2020-02-05', 7),
(9, 'PuMA有限公司', 'Zack Codd', '新竹市東區永安街八段999號98樓', '2020-05-04', 8),
(10, '王道滑鼠狗國際有限公司', '滑狗之王', '新竹市東區縣政十六路823巷18弄46號56樓', '2020-05-19', 9),
(11, '秋田動畫公司', '空之鷹邱', '新竹市東區陜西街729巷595弄388號', '2019-08-14', 10),
(12, '郭日本有限公司', '李小郎', '臺中市沙鹿區明鳳五街755巷960號', '2019-11-26', 11),
(13, '斑紋東京映畫漫畫公司', '伊窩祚', '南投縣鹿谷鄉富農一街八段893號', '2019-02-05', 12),
(14, '仙桃網路有限公司', '田中仙桃', '新竹縣新豐鄉工八街99巷902弄6號', '2019-08-22', 12),
(15, '霍鏞股份有限公司', '山下冰璃', '屏東縣三地門鄉富漁五路八段643巷889弄867號', '2020-05-04', 11);

-- --------------------------------------------------------

--
-- 資料表結構 `participate`
--

CREATE TABLE `participate` (
  `conference_id` int(11) NOT NULL,
  `agent_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `participate`
--

INSERT INTO `participate` (`conference_id`, `agent_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 4),
(1, 5),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 12),
(2, 1),
(2, 2),
(2, 3),
(2, 4),
(2, 5),
(2, 6),
(2, 8),
(2, 9),
(2, 11),
(2, 12),
(3, 1),
(3, 2),
(3, 3),
(3, 4),
(3, 5),
(3, 6),
(3, 8),
(3, 9),
(3, 11),
(4, 1),
(4, 2),
(4, 3),
(4, 4),
(4, 5),
(4, 6),
(4, 7),
(4, 9),
(4, 10),
(4, 11),
(4, 12),
(5, 1),
(5, 2),
(5, 3),
(5, 4),
(5, 5),
(5, 6),
(5, 8),
(5, 9),
(5, 11),
(6, 1),
(6, 2),
(6, 3),
(6, 4),
(6, 6),
(6, 12),
(7, 1),
(7, 2),
(7, 3),
(7, 4),
(7, 5),
(7, 6),
(7, 8),
(7, 9),
(7, 11),
(7, 12),
(8, 1),
(8, 2),
(8, 3),
(8, 4),
(8, 6),
(8, 7),
(8, 10),
(8, 11),
(9, 1),
(9, 2),
(9, 3),
(9, 4),
(9, 6),
(9, 7),
(9, 8),
(9, 9),
(9, 10),
(10, 1),
(10, 2),
(10, 3),
(10, 4),
(10, 5),
(10, 6),
(10, 7),
(10, 8),
(10, 9),
(10, 10),
(10, 11);

-- --------------------------------------------------------

--
-- 資料表結構 `provide`
--

CREATE TABLE `provide` (
  `merchandise_id` int(11) NOT NULL,
  `customer_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- 傾印資料表的資料 `provide`
--

INSERT INTO `provide` (`merchandise_id`, `customer_id`) VALUES
(2, 2),
(3, 1),
(7, 3),
(7, 10),
(8, 5),
(8, 10),
(9, 2),
(11, 5),
(13, 4),
(15, 2),
(16, 3),
(16, 9),
(18, 14),
(19, 4),
(19, 11),
(19, 14),
(21, 6),
(21, 9),
(21, 10),
(23, 7),
(24, 8),
(24, 11),
(25, 4),
(25, 8),
(26, 13),
(27, 7),
(28, 4),
(28, 12),
(29, 11),
(30, 5);

--
-- 已傾印資料表的索引
--

--
-- 資料表索引 `agent`
--
ALTER TABLE `agent`
  ADD PRIMARY KEY (`agent_id`);

--
-- 資料表索引 `buy`
--
ALTER TABLE `buy`
  ADD PRIMARY KEY (`merchandise_id`,`customer_id`),
  ADD KEY `merchandise_id` (`merchandise_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- 資料表索引 `conference`
--
ALTER TABLE `conference`
  ADD PRIMARY KEY (`conference_id`),
  ADD KEY `agent_id` (`agent_id`);

--
-- 資料表索引 `customer`
--
ALTER TABLE `customer`
  ADD PRIMARY KEY (`customer_id`);

--
-- 資料表索引 `merchandise`
--
ALTER TABLE `merchandise`
  ADD PRIMARY KEY (`merchandise_id`),
  ADD KEY `agent_id` (`agent_id`);

--
-- 資料表索引 `original_manufacturer`
--
ALTER TABLE `original_manufacturer`
  ADD PRIMARY KEY (`original_manufacturer_id`),
  ADD KEY `agent_id` (`agent_id`);

--
-- 資料表索引 `participate`
--
ALTER TABLE `participate`
  ADD PRIMARY KEY (`conference_id`,`agent_id`),
  ADD KEY `conference_id` (`conference_id`),
  ADD KEY `agent_id` (`agent_id`);

--
-- 資料表索引 `provide`
--
ALTER TABLE `provide`
  ADD PRIMARY KEY (`merchandise_id`,`customer_id`),
  ADD KEY `merchandise_id` (`merchandise_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- 在傾印的資料表使用自動遞增(AUTO_INCREMENT)
--

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `agent`
--
ALTER TABLE `agent`
  MODIFY `agent_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `conference`
--
ALTER TABLE `conference`
  MODIFY `conference_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `customer`
--
ALTER TABLE `customer`
  MODIFY `customer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=232;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `merchandise`
--
ALTER TABLE `merchandise`
  MODIFY `merchandise_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- 使用資料表自動遞增(AUTO_INCREMENT) `original_manufacturer`
--
ALTER TABLE `original_manufacturer`
  MODIFY `original_manufacturer_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- 已傾印資料表的限制式
--

--
-- 資料表的限制式 `buy`
--
ALTER TABLE `buy`
  ADD CONSTRAINT `buy_ibfk_1` FOREIGN KEY (`merchandise_id`) REFERENCES `merchandise` (`merchandise_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `buy_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的限制式 `conference`
--
ALTER TABLE `conference`
  ADD CONSTRAINT `conference_ibfk_1` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`agent_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的限制式 `merchandise`
--
ALTER TABLE `merchandise`
  ADD CONSTRAINT `merchandise_ibfk_1` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`agent_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的限制式 `original_manufacturer`
--
ALTER TABLE `original_manufacturer`
  ADD CONSTRAINT `original_manufacturer_ibfk_1` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`agent_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的限制式 `participate`
--
ALTER TABLE `participate`
  ADD CONSTRAINT `participate_ibfk_1` FOREIGN KEY (`agent_id`) REFERENCES `agent` (`agent_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `participate_ibfk_2` FOREIGN KEY (`conference_id`) REFERENCES `conference` (`conference_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- 資料表的限制式 `provide`
--
ALTER TABLE `provide`
  ADD CONSTRAINT `provide_ibfk_1` FOREIGN KEY (`merchandise_id`) REFERENCES `merchandise` (`merchandise_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `provide_ibfk_2` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
