-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 31-07-2016 a las 16:16:49
-- Versión del servidor: 10.1.13-MariaDB
-- Versión de PHP: 7.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `spsystem`
--
CREATE DATABASE IF NOT EXISTS `spsystem` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci;
USE `spsystem`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignacion_horarios`
--

DROP TABLE IF EXISTS `asignacion_horarios`;
CREATE TABLE `asignacion_horarios` (
  `cod_asig_horarios` int(11) NOT NULL,
  `cod_user` int(11) NOT NULL,
  `cod_horarios` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categorias_med`
--

DROP TABLE IF EXISTS `categorias_med`;
CREATE TABLE `categorias_med` (
  `cod_cat_med` int(10) NOT NULL,
  `nombre_cat_med` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `desc_cat_med` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `categorias_med`
--

INSERT INTO `categorias_med` (`cod_cat_med`, `nombre_cat_med`, `desc_cat_med`) VALUES(1, 'Antidiarreico', 'Controlan las evacuaciones frecuentes y acuosas que suelen estar acompañadas de dolor, debilidad, náuseas, vómitos, espasmos abdominales, fiebre o pérdida de apetito.');
INSERT INTO `categorias_med` (`cod_cat_med`, `nombre_cat_med`, `desc_cat_med`) VALUES(2, 'Antigripal', 'Contienen analgésicos, antihistamínicos, antitusivos y estimulantes en distintas combinaciones y proporciones.');
INSERT INTO `categorias_med` (`cod_cat_med`, `nombre_cat_med`, `desc_cat_med`) VALUES(3, 'Analgésico', 'Alivia el dolor producido por golpes, heridas, torceduras, quemaduras o enfermedades.');
INSERT INTO `categorias_med` (`cod_cat_med`, `nombre_cat_med`, `desc_cat_med`) VALUES(4, 'Ansiolítico e hipnótico', 'Empleados para conciliar el sueño.');
INSERT INTO `categorias_med` (`cod_cat_med`, `nombre_cat_med`, `desc_cat_med`) VALUES(5, 'Antiácido', 'Combate agruras (sensación de sabor agrio), ardor en el estómago y zona media del pecho.');
INSERT INTO `categorias_med` (`cod_cat_med`, `nombre_cat_med`, `desc_cat_med`) VALUES(6, 'Antibiótico', 'Utilizado para combatir y eliminar las infecciones bacterianas.');
INSERT INTO `categorias_med` (`cod_cat_med`, `nombre_cat_med`, `desc_cat_med`) VALUES(7, 'Antihistamínico', 'Controlan reacciones alérgicas.');
INSERT INTO `categorias_med` (`cod_cat_med`, `nombre_cat_med`, `desc_cat_med`) VALUES(8, 'Antiinflamatorio', 'Medicamento contra el dolor, hinchazón, enrojecimiento y calentamiento en la zona afectada por golpes, heridas, sustancias químicas o infecciones.');
INSERT INTO `categorias_med` (`cod_cat_med`, `nombre_cat_med`, `desc_cat_med`) VALUES(9, 'Antimicótico', 'Alivian infecciones por hongos que causan comezón, piel cuarteada, mal olor, y pequeñas ampollas.');
INSERT INTO `categorias_med` (`cod_cat_med`, `nombre_cat_med`, `desc_cat_med`) VALUES(10, 'Antipirético', 'Disminuyen la fiebre al activar ciertos mecanismos del hipotálamo.');
INSERT INTO `categorias_med` (`cod_cat_med`, `nombre_cat_med`, `desc_cat_med`) VALUES(11, 'Antiséptico', 'Eliminan o impiden el crecimiento de algunos tipos de bacterias que se encuentran en la piel y en membranas mucosas. Desinfecta heridas leves, raspones y cortaduras.');
INSERT INTO `categorias_med` (`cod_cat_med`, `nombre_cat_med`, `desc_cat_med`) VALUES(12, 'Antitusivo o Antisígeno', 'Ayudan a aminorar la tos.');
INSERT INTO `categorias_med` (`cod_cat_med`, `nombre_cat_med`, `desc_cat_med`) VALUES(13, 'Broncodilator', 'Abren los bronquios. Alivia síntomas como jadeo, falta de aliento o tos y restauran la capacidad para respirar normalmente.');
INSERT INTO `categorias_med` (`cod_cat_med`, `nombre_cat_med`, `desc_cat_med`) VALUES(14, 'Expectorante', 'Facilitan la  expulsión de flemas, tanto en niños como adultos.');
INSERT INTO `categorias_med` (`cod_cat_med`, `nombre_cat_med`, `desc_cat_med`) VALUES(15, 'Laxante', 'Facilitan el vaciado de las heces en caso de estreñimiento.');
INSERT INTO `categorias_med` (`cod_cat_med`, `nombre_cat_med`, `desc_cat_med`) VALUES(16, 'Mucolítico', 'Inhiben o reducen las generación de moco.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentarios_med`
--

DROP TABLE IF EXISTS `comentarios_med`;
CREATE TABLE `comentarios_med` (
  `cod_com_med` int(11) NOT NULL,
  `cod_med` int(11) NOT NULL,
  `cod_pac` int(11) NOT NULL,
  `fecha_hora_com` datetime NOT NULL,
  `comentario` varchar(500) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `consejos`
--

DROP TABLE IF EXISTS `consejos`;
CREATE TABLE `consejos` (
  `cod_consejo` int(11) NOT NULL,
  `cod_user` int(11) NOT NULL,
  `fecha_consejo` date NOT NULL,
  `imagen_consejo` mediumblob NOT NULL,
  `titulo_consejo` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `consejo` varchar(1000) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `consejos`
--

INSERT INTO `consejos` (`cod_consejo`, `cod_user`, `fecha_consejo`, `imagen_consejo`, `titulo_consejo`, `consejo`) VALUES(3, 1, '2016-07-05', '', 'Este es un consejo.', 'Información equis del consejo.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `diagnosticos`
--

DROP TABLE IF EXISTS `diagnosticos`;
CREATE TABLE `diagnosticos` (
  `cod_diag` int(11) NOT NULL,
  `cod_cita` int(11) NOT NULL,
  `desc_diag` varchar(150) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `especialidades`
--

DROP TABLE IF EXISTS `especialidades`;
CREATE TABLE `especialidades` (
  `cod_espe` int(11) NOT NULL,
  `nom_espe` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `desc_espe` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `especialidades`
--

INSERT INTO `especialidades` (`cod_espe`, `nom_espe`, `desc_espe`) VALUES(5, 'Pediatría', 'Atención a niños.');
INSERT INTO `especialidades` (`cod_espe`, `nom_espe`, `desc_espe`) VALUES(6, 'General', 'Consulta médica general.');
INSERT INTO `especialidades` (`cod_espe`, `nom_espe`, `desc_espe`) VALUES(7, 'Psiquiatría', 'Atención mental.');
INSERT INTO `especialidades` (`cod_espe`, `nom_espe`, `desc_espe`) VALUES(8, 'Radiología', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarios`
--

DROP TABLE IF EXISTS `horarios`;
CREATE TABLE `horarios` (
  `cod_horarios` int(11) NOT NULL,
  `dia_semana` enum('Lunes','Martes','Miércoles','Jueves','Viernes','Sábado','Domingo') COLLATE utf8_unicode_ci NOT NULL,
  `hora_entrada` time NOT NULL,
  `hora_salida` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `medicamentos`
--

DROP TABLE IF EXISTS `medicamentos`;
CREATE TABLE `medicamentos` (
  `cod_med` int(11) NOT NULL,
  `nom_med` varchar(75) COLLATE utf8_unicode_ci NOT NULL,
  `desc_med` varchar(200) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pre_med` decimal(5,2) NOT NULL,
  `cod_pre_med` int(10) NOT NULL,
  `cod_cat_med` int(10) NOT NULL,
  `estado_med` tinyint(1) NOT NULL DEFAULT '1',
  `imagen_med` mediumblob,
  `valoracion` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `medicamentos`
--

INSERT INTO `medicamentos` (`cod_med`, `nom_med`, `desc_med`, `pre_med`, `cod_pre_med`, `cod_cat_med`, `estado_med`, `imagen_med`, `valoracion`) VALUES(1, 'Acetaminofen', 'Analgesico', '1.30', 3, 3, 1, 0x6956424f5277304b47676f414141414e5355684555674141414641414141425143414d41414143357a774b66414141412f31424d5645582f2f7741414141414141416741414130414141384141416f41414137323967447a387744743751445430395373724b7a64335144382f41446e35774162477873324e6a5a4d54452f3139666d2f7677413950547a4277636934754c3351304e64555646516a49794b34754143516b4a4858317742645851646257424c4d7a41436e70774272617741734c41334e7a64526859542b506a7752386541646c5a52584e7a6431625743647662324e2f663543696f71703665683234754c6d5a6d616543676f4a79636b423063794244516764346352434166444269586743486845307a4d7a75546b34742b666a796b704142316446754f6a486d546b6a59364f6b43566c566d6a6f35562f664853576c676435656a3934646b3244677767524551315054776f374e773069487730694741316b5a46684c53416546685a472b757749764c7773654541706d5a6d49374f776f5947513154434d53774141414647456c45515652596865575a62574f6150425347517749433874497156567241436c4c5a326d6c39363178623362724e53567458613266332f332f4c452b7955674153523764747a66314b42793451637a726c7a414178566838656c613169706d75507075367441376476705a374e616764656c3430503656594232344d523069356666766b35737a524c4248346d795a6b2b2b667273737575624a766b43705666333842624d55454a4d69577471587a39575774426577717a3950625a575077396269566276337248657a416f2f757971616a305742726159355a766a764b414477774b39582b596d756d323149572f577246504e674a4c4f6f5874726762463069304c2f54694c6d43783162657934514a5a2f5536634741564b35615764485266495870596c4f6c4453707a735849793574716b73306f4b542f32474f3661316d33455349426c4e36667176767a414642503330744a514d6b397a594d4c644f704b3230413833317a6a57343378527a6a72446241387a58482f31724b6d3554685158793779387742594c505549384b445973762b47682b4f7856547767674b62622f7a736541483358444946486c6248387430423558446e61414f2b7152754a4a796d51555454754b3756474a527656754179773751754935453452476b523857694b555342616538426e5a4e796850384378556135486665672f435647713261326630443149664a2b5653466b49506b3965494c67722b54377736574d745466674e49487967414e466b4b574445385a3468386d4e434451506b6742384b5231526a6d68796361754e7a41512b6c51674f477564594b424a6a576b2f414a4c586a774b67527932474f4c704e4268793633326b78364d57426b7831412b6274374349364c48354e6a4a6764512b4667384269564b55494d633978414864776c63333952706832304d524f54665752774f4a506f714131432f7551624d4a32716b427464443867614c4d775476375253672b6f6b42465a2f75456a69454f504b374d4554774a5330504b3334465343503638576168454a32676b664973727a5353514a65364a6e694b6e6864314a554a7a6d4635346a4336346f4b344a466838504558364837616c66674c50637453354a36686b34703864704476486e494864315439597071503162594f332f43507a6e69334b657766426e6c334a4f4244622f6175656a2b4d504e52787a59792f44526d7a7635674d52313953575a484c7858576a46496c54554c55354c78444470682b724c5a58423578784961544848564170626c5a465447744146456c3173496b724451726b524c77306b6a4c5a52527042574a4e63416b676939514570645144696e67486855346d4b464b6c793342565a4154334e70346165677954726e465a41736436574f69564a7675364c784156374d316e34614e2b4846695238435a61445a525373784b6b2b4f77676e4a5161574a474957634c485a33757469334650576f755657574a4f4f6f53646b787663664938695937327741364a736e5855434f3864636b6f5a545939456738384a5976794f7271483234664c50454c6d6d4a505951474763636f2f347959656d586f626b77373863694a513867395a4c715032694f4b784f31695939715a386857524665513535463553374d52616f786e48446f6b624b4679564b5273667451595252396d356843664e4f63524754694933506b6656794e5a4d7252556765725254377151366169434948444b56794f4e71754458446d3863326562376f467944483155615555617154423434723345386971616c4e6268377839725a6a6b30635647775a32654e354d694b43365077694f4e614b6247377354326434795448455a50554677634978426c7074354331555565455652654634515a635068754d416f7a324932555874614e345443466b45764e707146387850767a424343334f50513835744e33367339766e32484453385756334a7671305841535070747a50734a64573847385441354c764461384f304442723734566979786937634a5459796b4e677576476a5538503762774269797765486a4f5174314b776f6c746c7141523943374a6e317132503379594477627a553865336b78357a38563179497967593479306c4c796938494e44716c337a72556c70564f5a747050586f7a4c576a3350646e373865796e744859666c7435713731476e35485a486a77473257366275324d6a6f5341526a374f35736d613661756d307453314e5861326471367137617a6a664f7a68526264323679745a31583675725050534f744d573773307868665357704a713962394e6d335675706632624e307a6d35634c493175544e79506c35626f3979766c7967586c372f634545727a39362f53735036367266473576564370502b2b754d2f4a356542566c556d41354941414141415355564f524b35435949493d, 0);
INSERT INTO `medicamentos` (`cod_med`, `nom_med`, `desc_med`, `pre_med`, `cod_pre_med`, `cod_cat_med`, `estado_med`, `imagen_med`, `valoracion`) VALUES(2, 'Ibuprofeno', 'Anti-inflamatorio', '1.20', 8, 16, 0, 0x52306c474f446c685a41426b414d5141414e5473746237696b4f723132726a66682f54363766723939713361644d6e6e6f38506b6d642f77794f547a30652f34354e6e75763750646673377072502f2f2f366a596177414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414143483542414141414141414c4141414141426b414751414141582f4943534f5a476d65614b7175624f752b63437a5064473366654b3776664f2f2f774b4277534377616a38696b63736c734f702f517148524b72567176324b7832792b3136762b4377654577756d382f6f7448724e62727666384c683854712f62372f69386668384d43456f494167494a4179514867676b4e4e67304368534d424367494b415351496b5a4e44445173504a413450447751504259344d6e364546426a514743672b554967476d6e776769434c477451414d436e35776a425157556e676b514271434670517779755157667268433642784149425151694241577a4277392f50376b4143627751734d67694377555132513639314959416a67454130435335444b7975784e735133774d444438496975716d4341414133634e612f427730474e744d46364d4743596147616c56443436674741455170685852524255534442577878626458514762735133414b55323535376f7142486a41776344343045592b574f677932594b527a497359634361517855734c626f454d4a4b6d443573686d35563642354c6b69566f50484b454971724a677471704e61344a444e344a6877524762547242364d4734715348372b5a725a714b554b66454b5151476a7851494d4c417448426b5263696c57794a6270416347567a6139532b36424157495071356c3757314b58414153684e6f5a536347435a544c322b445042445a56617077305039326d6f3773456b6c454c68785133314b4f30423133684b6230716e6c61324b6b4156326646675130734f6d546749424a416753512b696941496838446870744954707950382b66516f3075665472323639657659733276667a723237392b2f6777347366543736382b66506f303674667a3736392b2f6677343875665439394b43414137, 0);
INSERT INTO `medicamentos` (`cod_med`, `nom_med`, `desc_med`, `pre_med`, `cod_pre_med`, `cod_cat_med`, `estado_med`, `imagen_med`, `valoracion`) VALUES(4, 'jdsbajsdsjdsj', 'jhwdbhsdbasbd', '12.30', 4, 3, 1, 0x52306c474f446c685a41426b414d5141414e5473746237696b4f723132726a66682f54363766723939713361644d6e6e6f38506b6d642f77794f547a30652f34354e6e75763750646673377072502f2f2f366a596177414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414141414143483542414141414141414c4141414141426b414751414141582f4943534f5a476d65614b7175624f752b63437a5064473366654b3776664f2f2f774b4277534377616a38696b63736c734f702f517148524b72567176324b7832792b3136762b4377654577756d382f6f7448724e62727666384c683854712f62372f69386668384d43456f494167494a4179514867676b4e4e67304368534d424367494b415351496b5a4e44445173504a413450447751504259344d6e364546426a514743672b554967476d6e776769434c477451414d436e35776a425157556e676b514271434670517779755157667268433642784149425151694241577a4277392f50376b4143627751734d67694377555132513639314959416a67454130435335444b7975784e735133774d444438496975716d4341414133634e612f427730474e744d46364d4743596147616c56443436674741455170685852524255534442577878626458514762735133414b55323535376f7142486a41776344343045592b574f677932594b527a497359634361517855734c626f454d4a4b6d443573686d35563642354c6b69566f50484b454971724a677471704e61344a444e344a6877524762547242364d4734715348372b5a725a714b554b66454b5151476a7851494d4c417448426b5263696c57794a6270416347567a6139532b36424157495071356c3757314b58414153684e6f5a536347435a544c322b445042445a56617077305039326d6f3773456b6c454c68785133314b4f30423133684b6230716e6c61324b6b4156326646675130734f6d546749424a416753512b696941496838446870744954707950382b66516f3075665472323639657659733276667a723237392b2f6777347366543736382b66506f303674667a3736392b2f6677343875665439394b43414137, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pacientes`
--

DROP TABLE IF EXISTS `pacientes`;
CREATE TABLE `pacientes` (
  `cod_pac` int(11) NOT NULL,
  `nom_pac` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `apel_pac` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `genero_pac` enum('Masculino','Femenino') COLLATE utf8_unicode_ci NOT NULL,
  `corre_pac` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `peso_pac` int(10) UNSIGNED NOT NULL,
  `fec_nac_pac` date NOT NULL,
  `tel_pac` int(8) UNSIGNED DEFAULT NULL,
  `direc_pac` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `user_pac` int(8) NOT NULL,
  `contra_pac` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `imagen_pac` mediumblob
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `pacientes`
--

INSERT INTO `pacientes` (`cod_pac`, `nom_pac`, `apel_pac`, `genero_pac`, `corre_pac`, `peso_pac`, `fec_nac_pac`, `tel_pac`, `direc_pac`, `user_pac`, `contra_pac`, `imagen_pac`) VALUES(1, 'Alan Guillermo', 'Turcios Villalta', 'Masculino', 'alan.turcios@gmail.com', 145, '1997-03-25', 75992312, 'Mejicanos, San Salvador', 19970325, '123456', NULL);
INSERT INTO `pacientes` (`cod_pac`, `nom_pac`, `apel_pac`, `genero_pac`, `corre_pac`, `peso_pac`, `fec_nac_pac`, `tel_pac`, `direc_pac`, `user_pac`, `contra_pac`, `imagen_pac`) VALUES(3, 'Kenneth Isaac', 'Sanchez Flores', 'Masculino', 'kenneth@hotmail.com', 174, '1996-10-01', 73225345, 'San Marcos', 0, '123456', NULL);
INSERT INTO `pacientes` (`cod_pac`, `nom_pac`, `apel_pac`, `genero_pac`, `corre_pac`, `peso_pac`, `fec_nac_pac`, `tel_pac`, `direc_pac`, `user_pac`, `contra_pac`, `imagen_pac`) VALUES(4, 'Byron Armando', 'Loza Guzman', 'Masculino', 'byron@hotmail.com', 115, '1998-02-18', 72838381, 'Mejicanos, San Salvador', 0, '1234', NULL);
INSERT INTO `pacientes` (`cod_pac`, `nom_pac`, `apel_pac`, `genero_pac`, `corre_pac`, `peso_pac`, `fec_nac_pac`, `tel_pac`, `direc_pac`, `user_pac`, `contra_pac`, `imagen_pac`) VALUES(5, 'Gabriel Armando', 'Monge Caballero', 'Masculino', 'monge@gmail.com', 145, '1998-07-15', 71234628, 'San Marcos', 0, '123', NULL);
INSERT INTO `pacientes` (`cod_pac`, `nom_pac`, `apel_pac`, `genero_pac`, `corre_pac`, `peso_pac`, `fec_nac_pac`, `tel_pac`, `direc_pac`, `user_pac`, `contra_pac`, `imagen_pac`) VALUES(6, 'Erlinda Rebeca', 'Sandoval Reyes', 'Masculino', 'rebeca@gmail.com', 125, '1998-12-22', 72837148, 'Mejicanos, San Salvador', 0, '12345', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `permisos`
--

DROP TABLE IF EXISTS `permisos`;
CREATE TABLE `permisos` (
  `cod_permisos` int(11) NOT NULL,
  `nom_permisos` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `desc_permisos` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `permisos`
--

INSERT INTO `permisos` (`cod_permisos`, `nom_permisos`, `desc_permisos`) VALUES(1, 'Administrador', NULL);
INSERT INTO `permisos` (`cod_permisos`, `nom_permisos`, `desc_permisos`) VALUES(2, 'Doctor', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pre_med`
--

DROP TABLE IF EXISTS `pre_med`;
CREATE TABLE `pre_med` (
  `cod_pre_med` int(10) NOT NULL,
  `nombre_pre_med` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `desc_pre_med` varchar(200) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `pre_med`
--

INSERT INTO `pre_med` (`cod_pre_med`, `nombre_pre_med`, `desc_pre_med`) VALUES(3, 'Jarabe', '');
INSERT INTO `pre_med` (`cod_pre_med`, `nombre_pre_med`, `desc_pre_med`) VALUES(4, 'Gragea', '');
INSERT INTO `pre_med` (`cod_pre_med`, `nombre_pre_med`, `desc_pre_med`) VALUES(5, 'Caramelo', '');
INSERT INTO `pre_med` (`cod_pre_med`, `nombre_pre_med`, `desc_pre_med`) VALUES(6, 'Capsula', '');
INSERT INTO `pre_med` (`cod_pre_med`, `nombre_pre_med`, `desc_pre_med`) VALUES(7, 'Tabletas', '');
INSERT INTO `pre_med` (`cod_pre_med`, `nombre_pre_med`, `desc_pre_med`) VALUES(8, 'Perlas', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `recetas`
--

DROP TABLE IF EXISTS `recetas`;
CREATE TABLE `recetas` (
  `cod_rec` int(11) NOT NULL,
  `cod_med` int(11) NOT NULL,
  `cod_cita` int(11) NOT NULL,
  `cant_rec` int(11) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservaciones`
--

DROP TABLE IF EXISTS `reservaciones`;
CREATE TABLE `reservaciones` (
  `cod_reservacion` int(11) NOT NULL,
  `cod_user` int(11) NOT NULL,
  `cod_pac` int(11) NOT NULL,
  `tipo_reservacion` enum('Cita','Consulta') COLLATE utf8_unicode_ci NOT NULL,
  `fecha` date NOT NULL,
  `hora` time NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
CREATE TABLE `usuarios` (
  `cod_user` int(11) NOT NULL,
  `cod_permiso` int(11) NOT NULL,
  `nom_user` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `apel_user` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `genero_user` enum('Masculino','Femenino') COLLATE utf8_unicode_ci NOT NULL,
  `fec_nac_user` date DEFAULT NULL,
  `dui_user` int(9) UNSIGNED DEFAULT NULL,
  `tel_user` int(8) UNSIGNED DEFAULT NULL,
  `correo_user` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `foto_user` mediumblob,
  `direc_user` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `cod_espe` int(11) DEFAULT NULL,
  `user` int(8) NOT NULL,
  `contra_user` varchar(32) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Volcado de datos para la tabla `usuarios`
--

INSERT INTO `usuarios` (`cod_user`, `cod_permiso`, `nom_user`, `apel_user`, `genero_user`, `fec_nac_user`, `dui_user`, `tel_user`, `correo_user`, `foto_user`, `direc_user`, `cod_espe`, `user`, `contra_user`) VALUES(1, 1, 'David', 'Ramirez', 'Masculino', '1989-04-28', 123456789, 777777777, 'david_ramiraz@ricaldone.edu.sv', NULL, 'Mejicanos', 6, 19890328, '123456');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asignacion_horarios`
--
ALTER TABLE `asignacion_horarios`
  ADD PRIMARY KEY (`cod_asig_horarios`),
  ADD KEY `cod_user` (`cod_user`),
  ADD KEY `cod_horarios` (`cod_horarios`);

--
-- Indices de la tabla `categorias_med`
--
ALTER TABLE `categorias_med`
  ADD PRIMARY KEY (`cod_cat_med`);

--
-- Indices de la tabla `comentarios_med`
--
ALTER TABLE `comentarios_med`
  ADD PRIMARY KEY (`cod_com_med`),
  ADD KEY `cod_med` (`cod_med`),
  ADD KEY `cod_pac` (`cod_pac`);

--
-- Indices de la tabla `consejos`
--
ALTER TABLE `consejos`
  ADD PRIMARY KEY (`cod_consejo`),
  ADD KEY `cod_user` (`cod_user`);

--
-- Indices de la tabla `diagnosticos`
--
ALTER TABLE `diagnosticos`
  ADD PRIMARY KEY (`cod_diag`),
  ADD KEY `cod_consul` (`cod_cita`);

--
-- Indices de la tabla `especialidades`
--
ALTER TABLE `especialidades`
  ADD PRIMARY KEY (`cod_espe`),
  ADD UNIQUE KEY `nom_espe` (`nom_espe`);

--
-- Indices de la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD PRIMARY KEY (`cod_horarios`);

--
-- Indices de la tabla `medicamentos`
--
ALTER TABLE `medicamentos`
  ADD PRIMARY KEY (`cod_med`),
  ADD KEY `cod_pre_med` (`cod_pre_med`),
  ADD KEY `cod_cat_med` (`cod_cat_med`);

--
-- Indices de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  ADD PRIMARY KEY (`cod_pac`);

--
-- Indices de la tabla `permisos`
--
ALTER TABLE `permisos`
  ADD PRIMARY KEY (`cod_permisos`);

--
-- Indices de la tabla `pre_med`
--
ALTER TABLE `pre_med`
  ADD PRIMARY KEY (`cod_pre_med`);

--
-- Indices de la tabla `recetas`
--
ALTER TABLE `recetas`
  ADD PRIMARY KEY (`cod_rec`),
  ADD KEY `cod_med` (`cod_med`),
  ADD KEY `cod_consul` (`cod_cita`);

--
-- Indices de la tabla `reservaciones`
--
ALTER TABLE `reservaciones`
  ADD PRIMARY KEY (`cod_reservacion`),
  ADD KEY `cod_user` (`cod_user`),
  ADD KEY `cod_pac` (`cod_pac`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`cod_user`),
  ADD UNIQUE KEY `dui_user` (`dui_user`),
  ADD KEY `cod_permiso` (`cod_permiso`),
  ADD KEY `cod_espe` (`cod_espe`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asignacion_horarios`
--
ALTER TABLE `asignacion_horarios`
  MODIFY `cod_asig_horarios` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `categorias_med`
--
ALTER TABLE `categorias_med`
  MODIFY `cod_cat_med` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT de la tabla `comentarios_med`
--
ALTER TABLE `comentarios_med`
  MODIFY `cod_com_med` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `consejos`
--
ALTER TABLE `consejos`
  MODIFY `cod_consejo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT de la tabla `diagnosticos`
--
ALTER TABLE `diagnosticos`
  MODIFY `cod_diag` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `especialidades`
--
ALTER TABLE `especialidades`
  MODIFY `cod_espe` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `horarios`
--
ALTER TABLE `horarios`
  MODIFY `cod_horarios` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `medicamentos`
--
ALTER TABLE `medicamentos`
  MODIFY `cod_med` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT de la tabla `pacientes`
--
ALTER TABLE `pacientes`
  MODIFY `cod_pac` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT de la tabla `permisos`
--
ALTER TABLE `permisos`
  MODIFY `cod_permisos` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT de la tabla `pre_med`
--
ALTER TABLE `pre_med`
  MODIFY `cod_pre_med` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT de la tabla `recetas`
--
ALTER TABLE `recetas`
  MODIFY `cod_rec` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `reservaciones`
--
ALTER TABLE `reservaciones`
  MODIFY `cod_reservacion` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `cod_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asignacion_horarios`
--
ALTER TABLE `asignacion_horarios`
  ADD CONSTRAINT `asignacion_horarios_ibfk_1` FOREIGN KEY (`cod_horarios`) REFERENCES `horarios` (`cod_horarios`),
  ADD CONSTRAINT `asignacion_horarios_ibfk_2` FOREIGN KEY (`cod_user`) REFERENCES `usuarios` (`cod_user`);

--
-- Filtros para la tabla `comentarios_med`
--
ALTER TABLE `comentarios_med`
  ADD CONSTRAINT `comentarios_med_ibfk_1` FOREIGN KEY (`cod_med`) REFERENCES `medicamentos` (`cod_med`),
  ADD CONSTRAINT `comentarios_med_ibfk_2` FOREIGN KEY (`cod_pac`) REFERENCES `pacientes` (`cod_pac`);

--
-- Filtros para la tabla `consejos`
--
ALTER TABLE `consejos`
  ADD CONSTRAINT `consejos_ibfk_1` FOREIGN KEY (`cod_user`) REFERENCES `usuarios` (`cod_user`);

--
-- Filtros para la tabla `diagnosticos`
--
ALTER TABLE `diagnosticos`
  ADD CONSTRAINT `diagnosticos_ibfk_1` FOREIGN KEY (`cod_cita`) REFERENCES `reservaciones` (`cod_reservacion`);

--
-- Filtros para la tabla `medicamentos`
--
ALTER TABLE `medicamentos`
  ADD CONSTRAINT `medicamentos_ibfk_1` FOREIGN KEY (`cod_cat_med`) REFERENCES `categorias_med` (`cod_cat_med`),
  ADD CONSTRAINT `medicamentos_ibfk_2` FOREIGN KEY (`cod_pre_med`) REFERENCES `pre_med` (`cod_pre_med`);

--
-- Filtros para la tabla `recetas`
--
ALTER TABLE `recetas`
  ADD CONSTRAINT `recetas_ibfk_1` FOREIGN KEY (`cod_med`) REFERENCES `medicamentos` (`cod_med`),
  ADD CONSTRAINT `recetas_ibfk_2` FOREIGN KEY (`cod_cita`) REFERENCES `reservaciones` (`cod_reservacion`);

--
-- Filtros para la tabla `reservaciones`
--
ALTER TABLE `reservaciones`
  ADD CONSTRAINT `reservaciones_ibfk_1` FOREIGN KEY (`cod_user`) REFERENCES `usuarios` (`cod_user`),
  ADD CONSTRAINT `reservaciones_ibfk_2` FOREIGN KEY (`cod_pac`) REFERENCES `pacientes` (`cod_pac`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`cod_permiso`) REFERENCES `permisos` (`cod_permisos`),
  ADD CONSTRAINT `usuarios_ibfk_2` FOREIGN KEY (`cod_espe`) REFERENCES `especialidades` (`cod_espe`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
