-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Tempo de geração: 17/04/2026 às 04:03
-- Versão do servidor: 10.4.32-MariaDB
-- Versão do PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Banco de dados: `scriptforge`
--
CREATE DATABASE IF NOT EXISTS `scriptforge` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `scriptforge`;

-- --------------------------------------------------------

--
-- Estrutura para tabela `apps`
--

CREATE TABLE `apps` (
  `id_app` int(11) NOT NULL,
  `fk_id_cat` int(11) NOT NULL,
  `name_app` varchar(50) NOT NULL,
  `slug_app` varchar(50) NOT NULL,
  `icon_app` varchar(50) NOT NULL,
  `active_app` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `apps`
--

INSERT INTO `apps` (`id_app`, `fk_id_cat`, `name_app`, `slug_app`, `icon_app`, `active_app`) VALUES
(1, 1, 'Firefox', 'firefox', 'name/firefox', 1),
(2, 1, 'Chrome', 'chrome', 'name/google%20chrome', 1),
(3, 1, 'Brave', 'brave', 'name/brave', 1),
(4, 1, 'Opera', 'opera', 'name/opera', 1),
(5, 2, 'VS Code', 'vscode', 'name/vs%20code', 1),
(6, 2, 'JetBrains', 'jetbrains', 'name/jetBrains%20toolbox', 1),
(7, 2, 'Git', 'git', 'name/git', 1),
(8, 2, 'Node.js', 'nodejs', 'name/node%20js', 1),
(9, 2, 'Python 3', 'python', 'name/python%203', 1),
(10, 2, 'Docker', 'docker', 'name/docker', 1),
(11, 2, 'Neovim', 'neovim', 'name/neovim', 1),
(12, 2, 'Go', 'go', 'name/go', 1),
(13, 2, 'Rust', 'rust', 'name/rust', 1),
(14, 2, 'Java JDK', 'java', 'java.com', 1),
(15, 2, 'PHP', 'php', 'name/php', 1),
(16, 2, 'PostgreSQL', 'postgresql', 'name/postgresql', 1),
(17, 2, 'MySQL', 'mysql', 'name/mysql', 1),
(18, 2, 'Tmux', 'tmux', 'name/tmux', 1),
(19, 2, 'Zsh', 'zsh', 'name/zsh', 1),
(20, 3, 'LibreOffice', 'libreoffice', 'name/LibreOffice', 1),
(21, 3, 'OnlyOffice', 'onlyoffice', 'name/onlyOffice', 1),
(22, 3, 'Okular', 'okular', 'name/okular', 1),
(23, 3, 'Obsidian', 'obsidian', 'name/obsidian', 1),
(24, 4, 'VLC', 'vlc', 'name/vlc', 1),
(25, 4, 'GIMP', 'gimp', 'name/gimp', 1),
(26, 4, 'OBS Studio', 'obsstudio', 'obsproject.com', 1),
(27, 4, 'Kdenlive', 'kdenlive', 'kdenlive.org', 1),
(28, 4, 'Audacity', 'audacity', 'audacityteam.org', 1),
(29, 4, 'Inkscape', 'inkscape', 'name/inkscape', 1),
(30, 4, 'Blender', 'blender', 'name/blender', 1),
(31, 4, 'Krita', 'krita', 'name/krita', 1),
(32, 4, 'HandBrake', 'handbrake', 'handbrake.fr', 1),
(33, 4, 'Spotify', 'spotify', 'name/spotify', 1),
(34, 5, 'ClamAV', 'clamav', 'clamav.net', 1),
(35, 5, 'UFW', 'ufw', 'name/ubuntu', 1),
(36, 5, 'Wireshark', 'wireshark', 'wireshark.org', 1),
(37, 6, 'Discord', 'discord', 'name/discord', 1),
(38, 6, 'Telegram', 'telegram', 'name/telegram', 1),
(39, 6, 'Zoom', 'zoom', 'zoom.us', 1),
(40, 6, 'ThunderBird', 'thunderbird', 'thunderbird.net', 1),
(41, 6, 'Signal', 'signal', 'name/signal', 1),
(42, 7, 'Htop', 'htop', '', 1),
(43, 7, 'Timeshift', 'timeshift', '', 1),
(44, 7, 'Flatpak', 'flatpak', '', 1),
(45, 7, '7zip', '7zip', '', 1),
(46, 7, 'qBittorrent', 'qbittorrent', '', 1),
(47, 7, 'KeePassXC', 'keepassxc', '', 1),
(48, 7, 'Bitwarden', 'bitwarden', '', 1),
(49, 7, 'Syncthing', 'syncthing', '', 1),
(50, 7, 'rclone', 'rclone', '', 1),
(51, 8, 'Steam', 'steam', '', 1),
(52, 8, 'Lutris', 'lutris', '', 1),
(53, 8, 'Heroic', 'heroic', '', 1),
(54, 8, 'MangoHud', 'mangohud', '', 1),
(55, 8, 'Wine', 'wine', '', 1),
(56, 8, 'Bottles', 'bottles', '', 1),
(57, 8, 'GameMode', 'gamemode', '', 1),
(58, 8, 'RetroArch', 'retroarch', '', 1),
(59, 9, 'VirtualBox', 'virtualbox', '', 1),
(60, 9, 'GNOME Tweaks', 'gnometweaks', '', 1),
(61, 9, 'neofetch', 'neofetch', '', 1),
(62, 9, 'Nitrogen', 'nitrogen', '', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `categories`
--

CREATE TABLE `categories` (
  `id_cat` int(11) NOT NULL,
  `name_cat` varchar(50) NOT NULL,
  `slug_cat` varchar(50) NOT NULL,
  `active_cat` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `categories`
--

INSERT INTO `categories` (`id_cat`, `name_cat`, `slug_cat`, `active_cat`) VALUES
(1, 'Browsers', 'browsers', 1),
(2, 'Development', 'dev', 1),
(3, 'Productivity', 'productivity', 1),
(4, 'Multimedia', 'multimedia', 1),
(5, 'Security', 'security', 1),
(6, 'Communication', 'communication', 1),
(7, 'Utilities', 'utilities', 1),
(8, 'Gaming', 'gaming', 1),
(9, 'System', 'system', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `distros`
--

CREATE TABLE `distros` (
  `id_distro` int(11) NOT NULL,
  `name_distro` varchar(50) NOT NULL,
  `slug_distro` varchar(50) NOT NULL,
  `package_manager` varchar(50) NOT NULL,
  `install_method` varchar(50) NOT NULL,
  `active_distro` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `distros`
--

INSERT INTO `distros` (`id_distro`, `name_distro`, `slug_distro`, `package_manager`, `install_method`, `active_distro`) VALUES
(1, 'Ubuntu', 'ubuntu', 'apt', 'sudo apt install -y', 1),
(2, 'Fedora', 'fedora', 'dnf', 'sudo dnf install -y', 1),
(3, 'Arch', 'arch', 'pacman', 'sudo pacman -S --noconfirm', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `packages`
--

CREATE TABLE `packages` (
  `id_pack` int(11) NOT NULL,
  `fk_id_app` int(11) NOT NULL,
  `fk_id_distro` int(11) NOT NULL,
  `name_pack` varchar(50) NOT NULL,
  `active_pack` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Despejando dados para a tabela `packages`
--

INSERT INTO `packages` (`id_pack`, `fk_id_app`, `fk_id_distro`, `name_pack`, `active_pack`) VALUES
(1, 1, 1, 'firefox', 1),
(2, 1, 2, 'firefox', 1),
(3, 1, 3, 'firefox', 1),
(4, 2, 1, 'google-chrome-stable', 1),
(5, 2, 2, 'google-chrome-stable', 1),
(6, 2, 3, 'google-chrome', 1),
(7, 3, 1, 'brave-browser', 1),
(8, 3, 2, 'brave-browser', 1),
(9, 3, 3, 'brave-bin', 1),
(10, 4, 1, 'opera', 1),
(11, 4, 2, 'opera', 1),
(12, 4, 3, 'opera', 1),
(13, 5, 1, 'code', 1),
(14, 5, 2, 'code', 1),
(15, 5, 3, 'code', 1),
(16, 6, 1, 'jetbrains-toolbox', 1),
(17, 6, 2, 'jetbrains-toolbox', 1),
(18, 6, 3, 'jetbrains-toolbox', 1),
(19, 7, 1, 'git', 1),
(20, 7, 2, 'git', 1),
(21, 7, 3, 'git', 1),
(22, 8, 1, 'nodejs npm', 1),
(23, 8, 2, 'nodejs npm', 1),
(24, 8, 3, 'nodejs npm', 1),
(25, 9, 1, 'python3 python3-pip', 1),
(26, 9, 2, 'python3 python3-pip', 1),
(27, 9, 3, 'python python-pip', 1),
(28, 10, 1, 'docker.io docker-compose', 1),
(29, 10, 2, 'docker docker-compose', 1),
(30, 10, 3, 'docker docker-compose', 1),
(31, 11, 1, 'neovim', 1),
(32, 11, 2, 'neovim', 1),
(33, 11, 3, 'neovim', 1),
(34, 12, 1, 'golang-go', 1),
(35, 12, 2, 'golang', 1),
(36, 12, 3, 'go', 1),
(37, 13, 1, 'rustup', 1),
(38, 13, 2, 'rustup', 1),
(39, 13, 3, 'rustup', 1),
(40, 14, 1, 'default-jdk', 1),
(41, 14, 2, 'java-21-openjdk', 1),
(42, 14, 3, 'jdk-openjdk', 1),
(43, 15, 1, 'php', 1),
(44, 15, 2, 'php', 1),
(45, 15, 3, 'php', 1),
(46, 16, 1, 'postgresql', 1),
(47, 16, 2, 'postgresql', 1),
(48, 16, 3, 'postgresql', 1),
(49, 17, 1, 'mysql-server', 1),
(50, 17, 2, 'mysql-server', 1),
(51, 17, 3, 'mysql', 1),
(52, 18, 1, 'tmux', 1),
(53, 18, 2, 'tmux', 1),
(54, 18, 3, 'tmux', 1),
(55, 19, 1, 'zsh', 1),
(56, 19, 2, 'zsh', 1),
(57, 19, 3, 'zsh', 1),
(58, 20, 1, 'libreoffice', 1),
(59, 20, 2, 'libreoffice', 1),
(60, 20, 3, 'libreoffice-fresh', 1),
(61, 21, 1, 'onlyoffice-desktopeditors', 1),
(62, 21, 2, 'onlyoffice-desktopeditors', 1),
(63, 21, 3, 'onlyoffice-bin', 1),
(64, 22, 1, 'okular', 1),
(65, 22, 2, 'okular', 1),
(66, 22, 3, 'okular', 1),
(67, 23, 1, 'obsidian', 1),
(68, 23, 2, 'obsidian', 1),
(69, 23, 3, 'obsidian', 1),
(70, 24, 1, 'vlc', 1),
(71, 24, 2, 'vlc', 1),
(72, 24, 3, 'vlc', 1),
(73, 25, 1, 'gimp', 1),
(74, 25, 2, 'gimp', 1),
(75, 25, 3, 'gimp', 1),
(76, 26, 1, 'obs-studio', 1),
(77, 26, 2, 'obs-studio', 1),
(78, 26, 3, 'obs-studio', 1),
(79, 27, 1, 'kdenlive', 1),
(80, 27, 2, 'kdenlive', 1),
(81, 27, 3, 'kdenlive', 1),
(82, 28, 1, 'audacity', 1),
(83, 28, 2, 'audacity', 1),
(84, 28, 3, 'audacity', 1),
(85, 29, 1, 'inkscape', 1),
(86, 29, 2, 'inkscape', 1),
(87, 29, 3, 'inkscape', 1),
(88, 30, 1, 'blender', 1),
(89, 30, 2, 'blender', 1),
(90, 30, 3, 'blender', 1),
(91, 31, 1, 'krita', 1),
(92, 31, 2, 'krita', 1),
(93, 31, 3, 'krita', 1),
(94, 32, 1, 'handbrake', 1),
(95, 32, 2, 'HandBrake-cli', 1),
(96, 32, 3, 'handbrake', 1),
(97, 33, 1, 'spotify', 1),
(98, 33, 2, 'spotify', 1),
(99, 33, 3, 'spotify', 1),
(100, 34, 1, 'clamav', 1),
(101, 34, 2, 'clamav', 1),
(102, 34, 3, 'clamav', 1),
(103, 35, 1, 'ufw', 1),
(104, 35, 2, 'ufw', 1),
(105, 35, 3, 'ufw', 1),
(106, 36, 1, 'wireshark', 1),
(107, 36, 2, 'wireshark', 1),
(108, 36, 3, 'wireshark-qt', 1),
(109, 37, 1, 'discord', 1),
(110, 37, 2, 'discord', 1),
(111, 37, 3, 'discord', 1),
(112, 38, 1, 'telegram-desktop', 1),
(113, 38, 2, 'telegram-desktop', 1),
(114, 38, 3, 'telegram-desktop', 1),
(115, 39, 1, 'zoom', 1),
(116, 39, 2, 'zoom', 1),
(117, 39, 3, 'zoom', 1),
(118, 40, 1, 'thunderbird', 1),
(119, 40, 2, 'thunderbird', 1),
(120, 40, 3, 'thunderbird', 1),
(121, 41, 1, 'signal-desktop', 1),
(122, 41, 2, 'signal-desktop', 1),
(123, 41, 3, 'signal-desktop', 1),
(124, 42, 1, 'htop', 1),
(125, 42, 2, 'htop', 1),
(126, 42, 3, 'htop', 1),
(127, 43, 1, 'timeshift', 1),
(128, 43, 2, 'timeshift', 1),
(129, 43, 3, 'timeshift', 1),
(130, 44, 1, 'flatpak', 1),
(131, 44, 2, 'flatpak', 1),
(132, 44, 3, 'flatpak', 1),
(133, 45, 1, '7zip', 1),
(134, 45, 2, 'p7zip', 1),
(135, 45, 3, 'p7zip', 1),
(136, 46, 1, 'qbittorrent', 1),
(137, 46, 2, 'qbittorrent', 1),
(138, 46, 3, 'qbittorrent', 1),
(139, 47, 1, 'keepassxc', 1),
(140, 47, 2, 'keepassxc', 1),
(141, 47, 3, 'keepassxc', 1),
(142, 48, 1, 'bitwarden', 1),
(143, 48, 2, 'bitwarden', 1),
(144, 48, 3, 'bitwarden', 1),
(145, 49, 1, 'syncthing', 1),
(146, 49, 2, 'syncthing', 1),
(147, 49, 3, 'syncthing', 1),
(148, 50, 1, 'rclone', 1),
(149, 50, 2, 'rclone', 1),
(150, 50, 3, 'rclone', 1),
(151, 51, 1, 'steam', 1),
(152, 51, 2, 'steam', 1),
(153, 51, 3, 'steam', 1),
(154, 52, 1, 'lutris', 1),
(155, 52, 2, 'lutris', 1),
(156, 52, 3, 'lutris', 1),
(157, 53, 1, 'heroic', 1),
(158, 53, 2, 'heroic', 1),
(159, 53, 3, 'heroic-games-launcher-bin', 1),
(160, 54, 1, 'mangohud', 1),
(161, 54, 2, 'mangohud', 1),
(162, 54, 3, 'mangohud', 1),
(163, 55, 1, 'wine', 1),
(164, 55, 2, 'wine', 1),
(165, 55, 3, 'wine', 1),
(166, 56, 1, 'bottles', 1),
(167, 56, 2, 'bottles', 1),
(168, 56, 3, 'bottles', 1),
(169, 57, 1, 'gamemode', 1),
(170, 57, 2, 'gamemode', 1),
(171, 57, 3, 'gamemode', 1),
(172, 58, 1, 'retroarch', 1),
(173, 58, 2, 'retroarch', 1),
(174, 58, 3, 'retroarch', 1),
(175, 59, 1, 'virtualbox', 1),
(176, 59, 2, 'virtualbox', 1),
(177, 59, 3, 'virtualbox', 1),
(178, 60, 1, 'gnome-tweaks', 1),
(179, 60, 2, 'gnome-tweaks', 1),
(180, 60, 3, 'gnome-tweaks', 1),
(181, 61, 1, 'neofetch', 1),
(182, 61, 2, 'neofetch', 1),
(183, 61, 3, 'neofetch', 1),
(184, 62, 1, 'nitrogen', 1),
(185, 62, 2, 'nitrogen', 1),
(186, 62, 3, 'nitrogen', 1);

-- --------------------------------------------------------

--
-- Estrutura para tabela `users`
--

CREATE TABLE `users` (
  `id_user` int(11) NOT NULL,
  `name_user` varchar(50) NOT NULL,
  `email_user` varchar(100) NOT NULL,
  `pass_user` varchar(100) NOT NULL,
  `role_user` enum('ADMIN','USER') NOT NULL DEFAULT 'USER',
  `active_user` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tabelas despejadas
--

--
-- Índices de tabela `apps`
--
ALTER TABLE `apps`
  ADD PRIMARY KEY (`id_app`),
  ADD UNIQUE KEY `slug_app` (`slug_app`),
  ADD KEY `fk_id_category` (`fk_id_cat`);

--
-- Índices de tabela `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id_cat`),
  ADD UNIQUE KEY `slug_cat` (`slug_cat`);

--
-- Índices de tabela `distros`
--
ALTER TABLE `distros`
  ADD PRIMARY KEY (`id_distro`),
  ADD UNIQUE KEY `slug_distro` (`slug_distro`);

--
-- Índices de tabela `packages`
--
ALTER TABLE `packages`
  ADD PRIMARY KEY (`id_pack`),
  ADD KEY `fk_id_app` (`fk_id_app`),
  ADD KEY `fk_id_distro` (`fk_id_distro`);

--
-- Índices de tabela `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_user`),
  ADD UNIQUE KEY `email_user` (`email_user`);

--
-- AUTO_INCREMENT para tabelas despejadas
--

--
-- AUTO_INCREMENT de tabela `apps`
--
ALTER TABLE `apps`
  MODIFY `id_app` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT de tabela `categories`
--
ALTER TABLE `categories`
  MODIFY `id_cat` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT de tabela `distros`
--
ALTER TABLE `distros`
  MODIFY `id_distro` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de tabela `packages`
--
ALTER TABLE `packages`
  MODIFY `id_pack` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=187;

--
-- AUTO_INCREMENT de tabela `users`
--
ALTER TABLE `users`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restrições para tabelas despejadas
--

--
-- Restrições para tabelas `apps`
--
ALTER TABLE `apps`
  ADD CONSTRAINT `fk_id_category` FOREIGN KEY (`fk_id_cat`) REFERENCES `categories` (`id_cat`);

--
-- Restrições para tabelas `packages`
--
ALTER TABLE `packages`
  ADD CONSTRAINT `fk_id_app` FOREIGN KEY (`fk_id_app`) REFERENCES `apps` (`id_app`),
  ADD CONSTRAINT `fk_id_distro` FOREIGN KEY (`fk_id_distro`) REFERENCES `distros` (`id_distro`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
