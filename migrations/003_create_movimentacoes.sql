-- Migration 003 - Create movimentacoes table

DROP TABLE IF EXISTS `movimentacoes`;

CREATE TABLE `movimentacoes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `produto_id` int(11) DEFAULT NULL,
  `produto_nome` varchar(100) DEFAULT NULL,
  `tipo` enum('entrada','saida','remocao') NOT NULL,
  `quantidade` int(11) NOT NULL,
  `data` datetime NOT NULL DEFAULT current_timestamp(),
  `usuario_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_mov_produto_id` (`produto_id`),
  KEY `fk_mov_usuario` (`usuario_id`),
  CONSTRAINT `fk_mov_usuario` FOREIGN KEY (`usuario_id`)
      REFERENCES `usuarios` (`id`),
  CONSTRAINT `fk_movimentacoes_usuario` FOREIGN KEY (`usuario_id`)
      REFERENCES `usuarios` (`id`),
  CONSTRAINT `movimentacoes_ibfk_1` FOREIGN KEY (`produto_id`)
      REFERENCES `produtos` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB
  DEFAULT CHARSET=utf8mb4
  COLLATE=utf8mb4_uca1400_ai_ci;

