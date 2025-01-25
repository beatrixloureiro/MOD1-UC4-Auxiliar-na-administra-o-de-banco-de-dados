

#Crie ao menos uma stored function, um stored procedure ou um trigger para o banco de dados,
# selecionando uma funcionalidade que seja adequada para tanto.

/* # stored function function
  -- consulta qual elenco do time vai jogar titulares ou reservas .
 DELIMITER //
CREATE FUNCTION titular_reserva(id_time INT)
RETURNS VARCHAR(10)
BEGIN
    DECLARE resultado VARCHAR(10);
    SELECT a.equipe INTO resultado
    FROM atividades a
    JOIN participacao_esportes pe ON a.part_esport_id = pe.idpaticipacao_esportes
    WHERE idatividades_esportivas = id_time;
    RETURN resultado;
END//
 DELIMITER ;
 
 SELECT titular_reserva(5);
*/

/* # stored procedure
 -- consulta nick do participante no campeonato e qual campeonato  time escolhido
#script  procedure 
# busca por usuarios e times cadastrado em campeonatos 
 DELIMITER //
CREATE PROCEDURE inscrito_campeonato (IN idUser int, IN nomeTime varchar(20)) 
BEGIN
    SELECT u.nome " nome usuário ", t.nome_participante as "nick name", t.time as "time escolhido" , j.campeonato, j.data_jogos
    as "ultima partida "
    from usuarios u
	join time t on u.time_id = t.idtime
    inner join jogos j on t.jogo_id = j.idjogos 
    where j.idjogos = idUser and t.time = nomeTime;
END// 
 DELIMITER ;
 
 # chamada código procedure 
 CALL inscrito_campeonato(4,'Goiás');
 */
 
/* # Crie visões no banco de dados para consultas mais frequentes.
-- visoes para cosulta de jogos 
CREATE VIEW proximo_jogos (time_origem, competicao, proximo_jogos, time_adversario) AS
SELECT a.time_origem, a.competicao, pe.proximo_jogos, pe.time_adversario
FROM atividades a
JOIN participacao_esportes pe ON a.part_esport_id = pe.idpaticipacao_esportes
GROUP BY a.time_origem, pe.time_adversario;

CREATE VIEW participantes_jogos (nome_participante, modalidade, time,campeonato,origem_time) AS
SELECT t.nome_participante, t.modalidade, t.time, j.campeonato,t.origem_time
FROM time t
JOIN jogos j ON t.jogo_id = j.idjogos
GROUP BY t.nome_participante, j.campeonato;
*/

/*# Crie ao menos um índice composto para uma das tabelas.
-- indice resultado classificação do time 
CREATE INDEX idx_classificacao_time  ON classificacao(time,ranking);
show index from classificacao;
# result :show index from classificacao	3 row(s) returned	0.047 sec / 0.000 sec
*/

