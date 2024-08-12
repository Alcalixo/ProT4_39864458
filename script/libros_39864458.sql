-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-08-2024 a las 20:20:16
-- Versión del servidor: 10.4.22-MariaDB
-- Versión de PHP: 8.1.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `libros_39864458`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `id_libro` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `autor` varchar(50) NOT NULL,
  `categoria` varchar(30) NOT NULL,
  `ano_publicacion` year(4) NOT NULL,
  `genero` varchar(30) NOT NULL,
  `sinopsis` text NOT NULL,
  `isbn` varchar(17) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`id_libro`, `titulo`, `autor`, `categoria`, `ano_publicacion`, `genero`, `sinopsis`, `isbn`) VALUES
(1, 'La insoportable levedad del ser', 'Milan Kundera', 'Novela', 1984, 'Novela Filosófica', 'Ésta es una extraordinaria historia de amor, o sea de celos, traiciones, muerte y también de las debilidades y paradojas de la vida cotidiana de dos parejas cuyos destinos se entrelazan irremediablemente. Es una novela dirigida al corazón del lector, pero también a su cabeza, ya que, atrapado en la narración, él mismo termina por sentirse alguno de los personajes, cuando no todos ellos a la vez. El amor, el deseo, el idealismo, la necesidad de independencia son los temas triviales y corrientes que no solo dan vida a éstas parejas, sino también a una reflexión más profunda que nos afecta a todos directamente cada día.', '84-473-0004-8'),
(2, 'La gesta del marrano', 'Marcos Aguinis', 'Novela', 1993, 'Novela Histórica', 'En los años que precedieron a la conquista e Ameérica estalló la persecución de los judíos en España, que culminó con su expulsión en masa. Esta novela narra la historia de Francisco Maldonado da Silva y sus peripecias frente al fanatismo inquisitorial, la hipocresía y la despótica corrupción del Nuevo Mundo. Una novela que también habla elocuentemente de nuestro tiempo y del derecho a la libertad de conciencia', '84-473-0177-X'),
(3, 'La novela de Perón', 'Tomás Eloy Martínez', 'Novela', 1991, 'Histórico', '¿Dónde termina la realidad y comienza la ficción? ¿Cómo generó Perón su propio mito? Esta novela espléndida apela con maestría a todos los recursos del periodismo, la investigacón histórica y la imaginación narrativa para conformar un auténtico fresco de la sociedad argentina. Los personajes históricos y seres de ficción actúan juntos en esta narrativa cautivante. Y a menudo no se sabe cuáles son unos y otros, de tan irreales, crueles y absurdos que resultan los hechos', '84-473-0169-9'),
(4, 'El amor en los tiempos del cólera', 'Gabriel García Márquez', 'Novela', 1985, 'Romántico', 'La historia de amor que, a lo largo de más de sesenta años, viven Fermina Daza y Florentino Ariza en un pueblecito portuario del Caribe colombiano es mucho más que un melodrama con final feliz. El tiempo, el escenario y los personajes son como una mezcla tropical de plantas y arcillas que la mano maestra del autor modela y fantasea a su placer hasta alcanzar, una vez más, los territorios del mito y la leyenda.', '84-473-0167-2'),
(5, 'Marmalade Boy Vol. 1', 'Wataru Yoshizumi', 'Manga', 2006, 'Comedia Romántica', 'El repentino divorcio y vuelta al casamiento de los padres de Miki y Yuu hicieron que vivan juntos. Al parecer se acerca una tormenta de relaciones!!', '987-562-523-X'),
(6, 'Código Civil y Comercial de la Nación', 'Legislación Argentina', 'Derecho', 2015, 'Legal', 'El Código Civil y Comercial de la Nación Argentina presenta los lineamientos fundamentales para las nuevas normas del derecho civil y comercial en Argentina. Incluye un conjunto completo de leyes complementarias que regulan las relaciones civiles y comerciales en el país.', '978-950-897-470-9');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`id_libro`),
  ADD UNIQUE KEY `idx_isbn_unique` (`isbn`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `libros`
--
ALTER TABLE `libros`
  MODIFY `id_libro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
