-- ============================================================
-- FESTIVAIS
-- ============================================================

INSERT INTO Festival (id_festival, nome_festival, edicao, local, data_inicio, data_fim) VALUES (1, 'Rock in Rio', 20, 'Rio de Janeiro', DATE '2026-09-10', DATE '2026-09-20');
INSERT INTO Festival (id_festival, nome_festival, edicao, local, data_inicio, data_fim) VALUES (2, 'Lollapalooza', 10, 'Sao Paulo', DATE '2026-03-25', DATE '2026-03-27');
INSERT INTO Festival (id_festival, nome_festival, edicao, local, data_inicio, data_fim) VALUES (3, 'Rec-Beat', 26, 'Recife', DATE '2026-02-14', DATE '2026-02-17');
INSERT INTO Festival (id_festival, nome_festival, edicao, local, data_inicio, data_fim) VALUES (4, 'Abril Pro Rock', 30, 'Olinda', DATE '2026-04-18', DATE '2026-04-19');
INSERT INTO Festival (id_festival, nome_festival, edicao, local, data_inicio, data_fim) VALUES (5, 'Joao Rock', 21, 'Ribeirao Preto', DATE '2026-06-12', DATE '2026-06-12');
INSERT INTO Festival (id_festival, nome_festival, edicao, local, data_inicio, data_fim) VALUES (6, 'Festival de Inverno', 32, 'Garanhuns', DATE '2026-07-15', DATE '2026-07-28');
INSERT INTO Festival (id_festival, nome_festival, edicao, local, data_inicio, data_fim) VALUES (7, 'Planeta Atlantida', 25, 'Xangri-la', DATE '2026-01-30', DATE '2026-01-31');
INSERT INTO Festival (id_festival, nome_festival, edicao, local, data_inicio, data_fim) VALUES (8, 'Tomorrowland BR', 5, 'Itu', DATE '2026-10-10', DATE '2026-10-12');
INSERT INTO Festival (id_festival, nome_festival, edicao, local, data_inicio, data_fim) VALUES (9, 'Coquetel Molotov', 19, 'Recife', DATE '2026-11-20', DATE '2026-11-21');
INSERT INTO Festival (id_festival, nome_festival, edicao, local, data_inicio, data_fim) VALUES (10, 'Samba Recife', 19, 'Recife', DATE '2026-09-28', DATE '2026-09-29');
INSERT INTO Festival (id_festival, nome_festival, edicao, local, data_inicio, data_fim) VALUES (11, 'Monsters of Rock', 8, 'Sao Paulo', DATE '2026-05-15', DATE '2026-05-15');
INSERT INTO Festival (id_festival, nome_festival, edicao, local, data_inicio, data_fim) VALUES (12, 'Villa Mix', 11, 'Goiania', DATE '2026-07-05', DATE '2026-07-06');
INSERT INTO Festival (id_festival, nome_festival, edicao, local, data_inicio, data_fim) VALUES (13, 'Festival de Verao', 23, 'Salvador', DATE '2026-01-20', DATE '2026-01-21');
INSERT INTO Festival (id_festival, nome_festival, edicao, local, data_inicio, data_fim) VALUES (14, 'Ceara Music', 16, 'Fortaleza', DATE '2026-10-15', DATE '2026-10-17');
INSERT INTO Festival (id_festival, nome_festival, edicao, local, data_inicio, data_fim) VALUES (15, 'Bourbon Jazz', 12, 'Paraty', DATE '2026-05-20', DATE '2026-05-22');


-- ============================================================
-- PALCOS
-- ============================================================

INSERT INTO Palco (id_palco, nome_palco, setor, tema, capacidade_maxima, festival) VALUES (1, 'Palco Mundo', 'A', 'Principal', 100000, 1);
INSERT INTO Palco (id_palco, nome_palco, setor, tema, capacidade_maxima, festival) VALUES (2, 'Palco Sunset', 'B', 'Encontros', 40000, 1);
INSERT INTO Palco (id_palco, nome_palco, setor, tema, capacidade_maxima, festival) VALUES (3, 'Budweiser Stage', 'A', 'Rock', 50000, 2);
INSERT INTO Palco (id_palco, nome_palco, setor, tema, capacidade_maxima, festival) VALUES (4, 'Perry Stage', 'C', 'Eletronico', 20000, 2);
INSERT INTO Palco (id_palco, nome_palco, setor, tema, capacidade_maxima, festival) VALUES (5, 'Palco Alfandega', 'Cais', 'Indie', 15000, 3);
INSERT INTO Palco (id_palco, nome_palco, setor, tema, capacidade_maxima, festival) VALUES (6, 'Palco Rec', 'Marco Zero', 'Geral', 30000, 3);
INSERT INTO Palco (id_palco, nome_palco, setor, tema, capacidade_maxima, festival) VALUES (7, 'Palco Pesado', 'Indoor', 'Metal', 8000, 4);
INSERT INTO Palco (id_palco, nome_palco, setor, tema, capacidade_maxima, festival) VALUES (8, 'Palco Diversidade', 'Outdoor', 'Mix', 5000, 4);
INSERT INTO Palco (id_palco, nome_palco, setor, tema, capacidade_maxima, festival) VALUES (9, 'Palco Brasil', 'A', 'Nacional', 40000, 5);
INSERT INTO Palco (id_palco, nome_palco, setor, tema, capacidade_maxima, festival) VALUES (10, 'Palco Fortal', 'B', 'Novos', 15000, 5);
INSERT INTO Palco (id_palco, nome_palco, setor, tema, capacidade_maxima, festival) VALUES (11, 'Mestre Dominguinhos', 'Centro', 'Regional', 50000, 6);
INSERT INTO Palco (id_palco, nome_palco, setor, tema, capacidade_maxima, festival) VALUES (12, 'Palco Pop', 'Parque', 'Cultura', 20000, 6);
INSERT INTO Palco (id_palco, nome_palco, setor, tema, capacidade_maxima, festival) VALUES (13, 'Palco Planeta', 'Norte', 'Pop/Rock', 60000, 7);
INSERT INTO Palco (id_palco, nome_palco, setor, tema, capacidade_maxima, festival) VALUES (14, 'Arena e-Planet', 'Sul', 'Dance', 25000, 7);
INSERT INTO Palco (id_palco, nome_palco, setor, tema, capacidade_maxima, festival) VALUES (15, 'Mainstage Itu', 'Geral', 'Magic', 80000, 8);
INSERT INTO Palco (id_palco, nome_palco, setor, tema, capacidade_maxima, festival) VALUES (16, 'Freedom Stage', 'Bosque', 'Techno', 30000, 8);
INSERT INTO Palco (id_palco, nome_palco, setor, tema, capacidade_maxima, festival) VALUES (17, 'Palco Principal CM', 'A', 'Indie', 10000, 9);
INSERT INTO Palco (id_palco, nome_palco, setor, tema, capacidade_maxima, festival) VALUES (18, 'Palco Sonic', 'B', 'Experimental', 3000, 9);
INSERT INTO Palco (id_palco, nome_palco, setor, tema, capacidade_maxima, festival) VALUES (19, 'Palco Samba', 'Centro', 'Samba', 70000, 10);
INSERT INTO Palco (id_palco, nome_palco, setor, tema, capacidade_maxima, festival) VALUES (20, 'Palco Pagode', 'Lado B', 'Pagode', 30000, 10);
INSERT INTO Palco (id_palco, nome_palco, setor, tema, capacidade_maxima, festival) VALUES (21, 'Palco Monsters', 'Unico', 'Hard Rock', 45000, 11);
INSERT INTO Palco (id_palco, nome_palco, setor, tema, capacidade_maxima, festival) VALUES (22, 'Palco Legends', 'Lado', 'Classic', 10000, 11);
INSERT INTO Palco (id_palco, nome_palco, setor, tema, capacidade_maxima, festival) VALUES (23, 'Palco Sertanejo', 'Arena', 'Modao', 60000, 12);
INSERT INTO Palco (id_palco, nome_palco, setor, tema, capacidade_maxima, festival) VALUES (24, 'Trio Villa', 'Pista', 'Mix', 20000, 12);
INSERT INTO Palco (id_palco, nome_palco, setor, tema, capacidade_maxima, festival) VALUES (25, 'Palco Verao', 'Norte', 'Axe', 55000, 13);
INSERT INTO Palco (id_palco, nome_palco, setor, tema, capacidade_maxima, festival) VALUES (26, 'Palco Cais', 'Sul', 'Geral', 20000, 13);
INSERT INTO Palco (id_palco, nome_palco, setor, tema, capacidade_maxima, festival) VALUES (27, 'Palco Mucuripe', 'Praia', 'Pop', 40000, 14);
INSERT INTO Palco (id_palco, nome_palco, setor, tema, capacidade_maxima, festival) VALUES (28, 'Palco Jangada', 'Centro', 'Rock', 15000, 14);
INSERT INTO Palco (id_palco, nome_palco, setor, tema, capacidade_maxima, festival) VALUES (29, 'Palco Jazz', 'Praca', 'Bourbon', 10000, 15);
INSERT INTO Palco (id_palco, nome_palco, setor, tema, capacidade_maxima, festival) VALUES (30, 'Palco Blues', 'Igreja', 'Tradicional', 5000, 15);


-- ============================================================
-- EQUIPAMENTOS
-- ============================================================

INSERT INTO Equipamento_de_palco (id_equipamento, tipo) VALUES (1, 'Caixa de som');
INSERT INTO Equipamento_de_palco (id_equipamento, tipo) VALUES (2, 'Amplificador');
INSERT INTO Equipamento_de_palco (id_equipamento, tipo) VALUES (3, 'Mesa de som');
INSERT INTO Equipamento_de_palco (id_equipamento, tipo) VALUES (4, 'Microfone');
INSERT INTO Equipamento_de_palco (id_equipamento, tipo) VALUES (5, 'Monitor de palco');
INSERT INTO Equipamento_de_palco (id_equipamento, tipo) VALUES (6, 'Iluminacao LED');
INSERT INTO Equipamento_de_palco (id_equipamento, tipo) VALUES (7, 'Gerador');
INSERT INTO Equipamento_de_palco (id_equipamento, tipo) VALUES (8, 'Cabo P10');
INSERT INTO Equipamento_de_palco (id_equipamento, tipo) VALUES (9, 'Cabo XLR');
INSERT INTO Equipamento_de_palco (id_equipamento, tipo) VALUES (10, 'Direct Box');
INSERT INTO Equipamento_de_palco (id_equipamento, tipo) VALUES (11, 'Subwoofer');
INSERT INTO Equipamento_de_palco (id_equipamento, tipo) VALUES (12, 'Pedal de efeito');
INSERT INTO Equipamento_de_palco (id_equipamento, tipo) VALUES (13, 'Microfone');
INSERT INTO Equipamento_de_palco (id_equipamento, tipo) VALUES (14, 'Gerador');
INSERT INTO Equipamento_de_palco (id_equipamento, tipo) VALUES (15, 'Mesa de som');


-- ============================================================
-- BANDAS
-- O líder começa NULL e é atualizado depois do cadastro dos membros.
-- ============================================================

INSERT INTO Banda (id_banda, nome_banda, genero, rider_tecnico, lider, madrinha) VALUES (1, 'Sepultura', 'Metal', 'Rider Metal pesado', NULL, NULL);
INSERT INTO Banda (id_banda, nome_banda, genero, rider_tecnico, lider, madrinha) VALUES (2, 'Skank', 'Pop', 'Rider Pop standard', NULL, NULL);
INSERT INTO Banda (id_banda, nome_banda, genero, rider_tecnico, lider, madrinha) VALUES (3, 'Alok', 'Eletronico', 'Rider DJ complexo', NULL, NULL);
INSERT INTO Banda (id_banda, nome_banda, genero, rider_tecnico, lider, madrinha) VALUES (4, 'Natiruts', 'Reggae', 'Rider Reggae vibe', NULL, NULL);
INSERT INTO Banda (id_banda, nome_banda, genero, rider_tecnico, lider, madrinha) VALUES (5, 'BaianaSystem', 'MPB', 'Rider Experimental', NULL, NULL);
INSERT INTO Banda (id_banda, nome_banda, genero, rider_tecnico, lider, madrinha) VALUES (6, 'Angra', 'Metal', 'Rider Metal Melodico', NULL, 1);
INSERT INTO Banda (id_banda, nome_banda, genero, rider_tecnico, lider, madrinha) VALUES (7, 'Racionais MCs', 'Hip-Hop', 'Rider Rap clean', NULL, NULL);
INSERT INTO Banda (id_banda, nome_banda, genero, rider_tecnico, lider, madrinha) VALUES (8, 'Titas', 'Rock', 'Rider Classic Rock', NULL, NULL);
INSERT INTO Banda (id_banda, nome_banda, genero, rider_tecnico, lider, madrinha) VALUES (9, 'Jorge e Mateus', 'Sertanejo', 'Rider Sertanejo Top', NULL, NULL);
INSERT INTO Banda (id_banda, nome_banda, genero, rider_tecnico, lider, madrinha) VALUES (10, 'Falamansa', 'Forro', 'Rider Forro pe de serra', NULL, NULL);
INSERT INTO Banda (id_banda, nome_banda, genero, rider_tecnico, lider, madrinha) VALUES (11, 'Nacao Zumbi', 'MPB', 'Rider Manguebeat', NULL, 5);
INSERT INTO Banda (id_banda, nome_banda, genero, rider_tecnico, lider, madrinha) VALUES (12, 'Ratos de Porao', 'Punk', 'Rider Punk Cru', NULL, 1);
INSERT INTO Banda (id_banda, nome_banda, genero, rider_tecnico, lider, madrinha) VALUES (13, 'B.B. King Cover', 'Blues', 'Rider Blues Vintage', NULL, NULL);
INSERT INTO Banda (id_banda, nome_banda, genero, rider_tecnico, lider, madrinha) VALUES (14, 'Vintage Culture', 'Eletronico', 'Rider House Music', NULL, 3);
INSERT INTO Banda (id_banda, nome_banda, genero, rider_tecnico, lider, madrinha) VALUES (15, 'Sarcofago', 'Metal', 'Rider Black Metal', NULL, 1);


-- ============================================================
-- MEMBROS
-- Usa a procedure cadastrar_membro(cpf, nome, banda, especialidade)
-- I = Instrumentista
-- V = Vocalista
-- A = Ambos
-- ============================================================

EXEC cadastrar_membro('67676767676', 'Betuca Xavier', 1, 'I');

EXEC cadastrar_membro('11111111101', 'Andreas Kisser', 1, 'I');
EXEC cadastrar_membro('11111111102', 'Derrick Green', 1, 'V');
EXEC cadastrar_membro('11111111103', 'Eloy Casagrande', 1, 'I');

EXEC cadastrar_membro('22222222201', 'Samuel Rosa', 2, 'A');
EXEC cadastrar_membro('22222222202', 'Lelo Zaneti', 2, 'I');
EXEC cadastrar_membro('22222222203', 'Henrique Portugal', 2, 'I');

EXEC cadastrar_membro('33333333301', 'Alok Petrillo', 3, 'I');
EXEC cadastrar_membro('33333333302', 'Bhaskar Petrillo', 3, 'I');
EXEC cadastrar_membro('33333333303', 'Roadie Alok', 3, 'I');

EXEC cadastrar_membro('44444444401', 'Alexandre Carlo', 4, 'A');
EXEC cadastrar_membro('44444444402', 'Luis Mauricio', 4, 'I');
EXEC cadastrar_membro('44444444403', 'Kiko Peres', 4, 'I');

EXEC cadastrar_membro('55555555501', 'Russo Passapusso', 5, 'V');
EXEC cadastrar_membro('55555555502', 'Roberto Barreto', 5, 'I');
EXEC cadastrar_membro('55555555503', 'Sekubass', 5, 'I');

EXEC cadastrar_membro('66666666601', 'Rafael Bittencourt', 6, 'I');
EXEC cadastrar_membro('66666666602', 'Fabio Lione', 6, 'V');
EXEC cadastrar_membro('66666666603', 'Felipe Andreoli', 6, 'I');

EXEC cadastrar_membro('77777777701', 'Mano Brown', 7, 'V');
EXEC cadastrar_membro('77777777702', 'KL Jay', 7, 'I');
EXEC cadastrar_membro('77777777703', 'Edi Rock', 7, 'V');

EXEC cadastrar_membro('88888888801', 'Tony Bellotto', 8, 'I');
EXEC cadastrar_membro('88888888802', 'Branco Mello', 8, 'A');
EXEC cadastrar_membro('88888888803', 'Sergio Britto', 8, 'A');

EXEC cadastrar_membro('99999999901', 'Jorge Barcelos', 9, 'V');
EXEC cadastrar_membro('99999999902', 'Mateus Liduario', 9, 'A');
EXEC cadastrar_membro('99999999903', 'Musico Jorge 1', 9, 'I');

EXEC cadastrar_membro('10101010101', 'Tato Falamansa', 10, 'A');
EXEC cadastrar_membro('10101010102', 'Dezinho', 10, 'I');
EXEC cadastrar_membro('10101010103', 'Alemao Falamansa', 10, 'I');

EXEC cadastrar_membro('11011011001', 'Jorge du Peixe NZ', 11, 'A');
EXEC cadastrar_membro('11011011002', 'Dengue NZ', 11, 'I');
EXEC cadastrar_membro('11011011003', 'Pupillo', 11, 'I');

EXEC cadastrar_membro('12012012001', 'Joao Gordo', 12, 'V');
EXEC cadastrar_membro('12012012002', 'Jao Ratos', 12, 'I');
EXEC cadastrar_membro('12012012003', 'Boni', 12, 'I');

EXEC cadastrar_membro('13013013001', 'Lucille Guitar', 13, 'I');
EXEC cadastrar_membro('13013013002', 'Blues Singer', 13, 'V');
EXEC cadastrar_membro('13013013003', 'Bass Blues', 13, 'I');

EXEC cadastrar_membro('14014014001', 'Lukas Ruiz', 14, 'I');
EXEC cadastrar_membro('14014014002', 'Produtor Vintage 1', 14, 'V');
EXEC cadastrar_membro('14014014003', 'Roadie Vintage', 14, 'I');

EXEC cadastrar_membro('15015015001', 'Wagner Lamounier', 15, 'A');
EXEC cadastrar_membro('15015015002', 'Gerald Minelli', 15, 'I');
EXEC cadastrar_membro('15015015003', 'Zeder Butcher', 15, 'I');


-- ============================================================
-- ATUALIZAR LÍDERES
-- ============================================================

UPDATE Banda SET lider = '11111111101' WHERE id_banda = 1;
UPDATE Banda SET lider = '22222222201' WHERE id_banda = 2;
UPDATE Banda SET lider = '33333333301' WHERE id_banda = 3;
UPDATE Banda SET lider = '44444444401' WHERE id_banda = 4;
UPDATE Banda SET lider = '55555555501' WHERE id_banda = 5;
UPDATE Banda SET lider = '66666666601' WHERE id_banda = 6;
UPDATE Banda SET lider = '77777777701' WHERE id_banda = 7;
UPDATE Banda SET lider = '88888888801' WHERE id_banda = 8;
UPDATE Banda SET lider = '99999999901' WHERE id_banda = 9;
UPDATE Banda SET lider = '10101010101' WHERE id_banda = 10;
UPDATE Banda SET lider = '11011011001' WHERE id_banda = 11;
UPDATE Banda SET lider = '12012012001' WHERE id_banda = 12;
UPDATE Banda SET lider = '13013013001' WHERE id_banda = 13;
UPDATE Banda SET lider = '14014014001' WHERE id_banda = 14;
UPDATE Banda SET lider = '15015015001' WHERE id_banda = 15;


-- ============================================================
-- TELEFONES
-- ============================================================

INSERT INTO Telefone_membro (membro, telefone) VALUES ('11111111101', '11999998888');
INSERT INTO Telefone_membro (membro, telefone) VALUES ('22222222201', '31988887777');
INSERT INTO Telefone_membro (membro, telefone) VALUES ('33333333301', '62977776666');
INSERT INTO Telefone_membro (membro, telefone) VALUES ('44444444401', '21966665555');
INSERT INTO Telefone_membro (membro, telefone) VALUES ('55555555501', '81955554444');
INSERT INTO Telefone_membro (membro, telefone) VALUES ('66666666601', '11944443333');
INSERT INTO Telefone_membro (membro, telefone) VALUES ('77777777701', '11933332222');
INSERT INTO Telefone_membro (membro, telefone) VALUES ('88888888801', '11922221111');
INSERT INTO Telefone_membro (membro, telefone) VALUES ('99999999901', '11911110000');
INSERT INTO Telefone_membro (membro, telefone) VALUES ('10101010101', '11900009999');
INSERT INTO Telefone_membro (membro, telefone) VALUES ('11011011001', '81988881234');
INSERT INTO Telefone_membro (membro, telefone) VALUES ('12012012001', '11977775678');
INSERT INTO Telefone_membro (membro, telefone) VALUES ('13013013001', '21966669012');
INSERT INTO Telefone_membro (membro, telefone) VALUES ('14014014001', '11955553456');
INSERT INTO Telefone_membro (membro, telefone) VALUES ('15015015001', '31944447890');


-- ============================================================
-- INSTRUMENTOS
-- ============================================================

INSERT INTO Instrumento (membro, tipo, marca) VALUES ('11111111101', 'Guitarra', 'Ibanez');
INSERT INTO Instrumento (membro, tipo, marca) VALUES ('11111111103', 'Bateria', 'Tama');
INSERT INTO Instrumento (membro, tipo, marca) VALUES ('22222222202', 'Baixo', 'Fender');
INSERT INTO Instrumento (membro, tipo, marca) VALUES ('33333333301', 'Teclado', 'Pioneer');
INSERT INTO Instrumento (membro, tipo, marca) VALUES ('44444444402', 'Baixo', 'Music Man');
INSERT INTO Instrumento (membro, tipo, marca) VALUES ('55555555502', 'Guitarra', 'Gibson');
INSERT INTO Instrumento (membro, tipo, marca) VALUES ('66666666603', 'Baixo', 'Sadowsky');
INSERT INTO Instrumento (membro, tipo, marca) VALUES ('77777777702', 'Teclado', 'Akai');
INSERT INTO Instrumento (membro, tipo, marca) VALUES ('88888888801', 'Guitarra', 'Fender');
INSERT INTO Instrumento (membro, tipo, marca) VALUES ('99999999902', 'Guitarra', 'Takamine');
INSERT INTO Instrumento (membro, tipo, marca) VALUES ('10101010102', 'Outro', 'Triangulo');
INSERT INTO Instrumento (membro, tipo, marca) VALUES ('11011011003', 'Bateria', 'Pearl');
INSERT INTO Instrumento (membro, tipo, marca) VALUES ('12012012002', 'Guitarra', 'Jackson');
INSERT INTO Instrumento (membro, tipo, marca) VALUES ('14014014001', 'Teclado', 'Korg');
INSERT INTO Instrumento (membro, tipo, marca) VALUES ('15015015003', 'Bateria', 'Ludwig');


-- ============================================================
-- UTILIZA
-- ============================================================

INSERT INTO Utiliza (banda, palco, equipamento) VALUES (1, 1, 1);
INSERT INTO Utiliza (banda, palco, equipamento) VALUES (1, 1, 6);
INSERT INTO Utiliza (banda, palco, equipamento) VALUES (2, 3, 4);
INSERT INTO Utiliza (banda, palco, equipamento) VALUES (3, 4, 15);
INSERT INTO Utiliza (banda, palco, equipamento) VALUES (4, 13, 1);
INSERT INTO Utiliza (banda, palco, equipamento) VALUES (5, 6, 9);
INSERT INTO Utiliza (banda, palco, equipamento) VALUES (6, 1, 2);
INSERT INTO Utiliza (banda, palco, equipamento) VALUES (7, 2, 4);
INSERT INTO Utiliza (banda, palco, equipamento) VALUES (8, 9, 1);
INSERT INTO Utiliza (banda, palco, equipamento) VALUES (9, 23, 13);
INSERT INTO Utiliza (banda, palco, equipamento) VALUES (10, 11, 4);
INSERT INTO Utiliza (banda, palco, equipamento) VALUES (11, 5, 1);
INSERT INTO Utiliza (banda, palco, equipamento) VALUES (12, 7, 2);
INSERT INTO Utiliza (banda, palco, equipamento) VALUES (13, 30, 4);
INSERT INTO Utiliza (banda, palco, equipamento) VALUES (14, 15, 3);


-- ============================================================
-- APRESENTAÇÕES
-- ============================================================

INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (1, 1, TO_TIMESTAMP('2026-09-10 22:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-09-10 23:30', 'YYYY-MM-DD HH24:MI'), 80000, 200000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (6, 1, TO_TIMESTAMP('2026-09-10 20:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-09-10 21:15', 'YYYY-MM-DD HH24:MI'), 50000, 150000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (2, 3, TO_TIMESTAMP('2026-03-25 19:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-03-25 20:30', 'YYYY-MM-DD HH24:MI'), 40000, 120000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (3, 4, TO_TIMESTAMP('2026-03-25 23:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-03-26 01:00', 'YYYY-MM-DD HH24:MI'), 20000, 300000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (5, 6, TO_TIMESTAMP('2026-02-14 20:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-02-14 21:30', 'YYYY-MM-DD HH24:MI'), 25000, 80000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (11, 5, TO_TIMESTAMP('2026-02-14 18:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-02-14 19:15', 'YYYY-MM-DD HH24:MI'), 12000, 60000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (12, 7, TO_TIMESTAMP('2026-04-18 21:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-04-18 22:30', 'YYYY-MM-DD HH24:MI'), 7000, 40000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (15, 7, TO_TIMESTAMP('2026-04-18 23:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-04-19 00:00', 'YYYY-MM-DD HH24:MI'), 5000, 30000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (8, 9, TO_TIMESTAMP('2026-06-12 21:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-06-12 22:45', 'YYYY-MM-DD HH24:MI'), 35000, 180000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (9, 23, TO_TIMESTAMP('2026-07-05 22:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-07-05 23:59', 'YYYY-MM-DD HH24:MI'), 55000, 400000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (4, 13, TO_TIMESTAMP('2026-01-30 20:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-01-30 21:30', 'YYYY-MM-DD HH24:MI'), 45000, 90000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (14, 15, TO_TIMESTAMP('2026-10-10 02:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-10-10 04:00', 'YYYY-MM-DD HH24:MI'), 60000, 250000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (10, 19, TO_TIMESTAMP('2026-09-28 20:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-09-28 22:00', 'YYYY-MM-DD HH24:MI'), 50000, 70000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (7, 2, TO_TIMESTAMP('2026-09-11 23:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-09-12 00:30', 'YYYY-MM-DD HH24:MI'), 40000, 150000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (13, 30, TO_TIMESTAMP('2026-05-20 18:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-05-20 19:30', 'YYYY-MM-DD HH24:MI'), 3000, 15000.00);

INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (8, 2, TO_TIMESTAMP('2026-09-12 20:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-09-12 21:30', 'YYYY-MM-DD HH24:MI'), 35000, 140000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (2, 1, TO_TIMESTAMP('2026-09-15 19:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-09-15 20:30', 'YYYY-MM-DD HH24:MI'), 60000, 200000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (4, 2, TO_TIMESTAMP('2026-09-18 18:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-09-18 19:30', 'YYYY-MM-DD HH24:MI'), 25000, 95000.00);

INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (8, 3, TO_TIMESTAMP('2026-03-26 21:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-03-26 22:30', 'YYYY-MM-DD HH24:MI'), 45000, 160000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (14, 4, TO_TIMESTAMP('2026-03-27 22:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-03-27 23:59', 'YYYY-MM-DD HH24:MI'), 20000, 180000.00);

INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (5, 5, TO_TIMESTAMP('2026-02-15 22:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-02-15 23:30', 'YYYY-MM-DD HH24:MI'), 15000, 75000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (7, 6, TO_TIMESTAMP('2026-02-16 23:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-02-17 00:30', 'YYYY-MM-DD HH24:MI'), 30000, 150000.00);

INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (1, 7, TO_TIMESTAMP('2026-04-19 23:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-04-20 00:30', 'YYYY-MM-DD HH24:MI'), 8000, 90000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (11, 8, TO_TIMESTAMP('2026-04-19 20:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-04-19 21:30', 'YYYY-MM-DD HH24:MI'), 5000, 60000.00);

INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (2, 9, TO_TIMESTAMP('2026-06-12 18:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-06-12 19:30', 'YYYY-MM-DD HH24:MI'), 38000, 150000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (7, 10, TO_TIMESTAMP('2026-06-12 20:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-06-12 21:30', 'YYYY-MM-DD HH24:MI'), 15000, 120000.00);

INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (10, 11, TO_TIMESTAMP('2026-07-25 22:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-07-25 23:30', 'YYYY-MM-DD HH24:MI'), 48000, 80000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (11, 12, TO_TIMESTAMP('2026-07-26 20:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-07-26 21:30', 'YYYY-MM-DD HH24:MI'), 18000, 65000.00);

INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (9, 13, TO_TIMESTAMP('2026-01-31 22:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-01-31 23:30', 'YYYY-MM-DD HH24:MI'), 58000, 350000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (3, 14, TO_TIMESTAMP('2026-01-31 01:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-01-31 03:00', 'YYYY-MM-DD HH24:MI'), 25000, 220000.00);

INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (3, 15, TO_TIMESTAMP('2026-10-11 23:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-10-12 01:00', 'YYYY-MM-DD HH24:MI'), 75000, 400000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (14, 16, TO_TIMESTAMP('2026-10-12 00:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-10-12 02:00', 'YYYY-MM-DD HH24:MI'), 30000, 190000.00);

INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (5, 17, TO_TIMESTAMP('2026-11-20 23:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-11-21 00:30', 'YYYY-MM-DD HH24:MI'), 9500, 70000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (12, 18, TO_TIMESTAMP('2026-11-21 20:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-11-21 21:00', 'YYYY-MM-DD HH24:MI'), 2500, 35000.00);


INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (9, 19, TO_TIMESTAMP('2026-09-29 22:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-09-29 23:30', 'YYYY-MM-DD HH24:MI'), 65000, 320000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (4, 20, TO_TIMESTAMP('2026-09-28 18:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-09-28 19:30', 'YYYY-MM-DD HH24:MI'), 28000, 85000.00);

INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (6, 21, TO_TIMESTAMP('2026-05-15 19:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-05-15 20:30', 'YYYY-MM-DD HH24:MI'), 42000, 130000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (15, 22, TO_TIMESTAMP('2026-05-15 17:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-05-15 18:00', 'YYYY-MM-DD HH24:MI'), 9000, 45000.00);

INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (10, 23, TO_TIMESTAMP('2026-07-06 20:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-07-06 21:30', 'YYYY-MM-DD HH24:MI'), 50000, 95000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (3, 24, TO_TIMESTAMP('2026-07-06 23:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-07-07 01:00', 'YYYY-MM-DD HH24:MI'), 20000, 250000.00);

INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (2, 25, TO_TIMESTAMP('2026-01-20 22:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-01-20 23:30', 'YYYY-MM-DD HH24:MI'), 48000, 160000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (7, 26, TO_TIMESTAMP('2026-01-21 21:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-01-21 22:30', 'YYYY-MM-DD HH24:MI'), 19000, 140000.00);

INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (8, 27, TO_TIMESTAMP('2026-10-16 22:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-10-16 23:30', 'YYYY-MM-DD HH24:MI'), 38000, 130000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (11, 28, TO_TIMESTAMP('2026-10-17 20:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-10-17 21:30', 'YYYY-MM-DD HH24:MI'), 12000, 70000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (2, 27, TO_TIMESTAMP('2026-10-15 21:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-10-15 22:30', 'YYYY-MM-DD HH24:MI'), 35000, 145000.00);

INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (13, 29, TO_TIMESTAMP('2026-05-21 20:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-05-21 21:30', 'YYYY-MM-DD HH24:MI'), 9000, 20000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (13, 30, TO_TIMESTAMP('2026-05-22 19:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-05-22 20:30', 'YYYY-MM-DD HH24:MI'), 4500, 15000.00);

INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (7, 1, TO_TIMESTAMP('2026-09-16 20:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-09-16 21:30', 'YYYY-MM-DD HH24:MI'), 75000, 180000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (11, 2, TO_TIMESTAMP('2026-09-16 18:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-09-16 19:30', 'YYYY-MM-DD HH24:MI'), 30000, 90000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (3, 1, TO_TIMESTAMP('2026-09-19 23:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-09-20 01:00', 'YYYY-MM-DD HH24:MI'), 90000, 350000.00);

INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (5, 3, TO_TIMESTAMP('2026-03-25 17:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-03-25 18:30', 'YYYY-MM-DD HH24:MI'), 35000, 100000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (11, 4, TO_TIMESTAMP('2026-03-26 19:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-03-26 20:30', 'YYYY-MM-DD HH24:MI'), 18000, 85000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (1, 3, TO_TIMESTAMP('2026-03-27 20:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-03-27 21:30', 'YYYY-MM-DD HH24:MI'), 40000, 160000.00);

INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (4, 6, TO_TIMESTAMP('2026-02-16 20:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-02-16 21:30', 'YYYY-MM-DD HH24:MI'), 28000, 95000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (10, 5, TO_TIMESTAMP('2026-02-17 21:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-02-17 22:30', 'YYYY-MM-DD HH24:MI'), 14000, 65000.00);

INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (6, 7, TO_TIMESTAMP('2026-04-18 19:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-04-18 20:30', 'YYYY-MM-DD HH24:MI'), 7500, 80000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (12, 8, TO_TIMESTAMP('2026-04-19 18:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-04-19 19:30', 'YYYY-MM-DD HH24:MI'), 4000, 35000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (8, 7, TO_TIMESTAMP('2026-04-19 21:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-04-19 22:30', 'YYYY-MM-DD HH24:MI'), 8000, 110000.00);

INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (4, 9, TO_TIMESTAMP('2026-06-12 16:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-06-12 17:30', 'YYYY-MM-DD HH24:MI'), 25000, 120000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (11, 10, TO_TIMESTAMP('2026-06-12 17:30', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-06-12 19:00', 'YYYY-MM-DD HH24:MI'), 12000, 75000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (1, 9, TO_TIMESTAMP('2026-06-12 22:30', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-06-12 23:59', 'YYYY-MM-DD HH24:MI'), 35000, 170000.00);

INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (8, 11, TO_TIMESTAMP('2026-07-18 20:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-07-18 21:30', 'YYYY-MM-DD HH24:MI'), 40000, 135000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (5, 12, TO_TIMESTAMP('2026-07-22 19:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-07-22 20:30', 'YYYY-MM-DD HH24:MI'), 19000, 85000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (2, 11, TO_TIMESTAMP('2026-07-27 21:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-07-27 22:30', 'YYYY-MM-DD HH24:MI'), 45000, 160000.00);

INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (8, 13, TO_TIMESTAMP('2026-01-30 18:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-01-30 19:30', 'YYYY-MM-DD HH24:MI'), 42000, 130000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (14, 14, TO_TIMESTAMP('2026-01-30 23:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-01-31 01:00', 'YYYY-MM-DD HH24:MI'), 22000, 180000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (5, 13, TO_TIMESTAMP('2026-01-31 19:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-01-31 20:30', 'YYYY-MM-DD HH24:MI'), 48000, 110000.00);

INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (14, 15, TO_TIMESTAMP('2026-10-11 20:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-10-11 22:00', 'YYYY-MM-DD HH24:MI'), 65000, 250000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (3, 16, TO_TIMESTAMP('2026-10-10 21:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-10-10 23:00', 'YYYY-MM-DD HH24:MI'), 28000, 200000.00);

INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (11, 17, TO_TIMESTAMP('2026-11-20 20:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-11-20 21:30', 'YYYY-MM-DD HH24:MI'), 8500, 65000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (7, 18, TO_TIMESTAMP('2026-11-21 22:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-11-21 23:30', 'YYYY-MM-DD HH24:MI'), 3000, 90000.00);

INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (10, 19, TO_TIMESTAMP('2026-09-28 22:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-09-28 23:30', 'YYYY-MM-DD HH24:MI'), 55000, 80000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (2, 20, TO_TIMESTAMP('2026-09-29 19:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-09-29 20:30', 'YYYY-MM-DD HH24:MI'), 25000, 120000.00);

INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (12, 21, TO_TIMESTAMP('2026-05-15 16:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-05-15 17:30', 'YYYY-MM-DD HH24:MI'), 35000, 50000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (8, 22, TO_TIMESTAMP('2026-05-15 21:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-05-15 22:30', 'YYYY-MM-DD HH24:MI'), 10000, 130000.00);

INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (14, 24, TO_TIMESTAMP('2026-07-05 20:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-07-05 22:00', 'YYYY-MM-DD HH24:MI'), 18000, 170000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (2, 23, TO_TIMESTAMP('2026-07-06 18:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-07-06 19:30', 'YYYY-MM-DD HH24:MI'), 45000, 140000.00);

INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (8, 25, TO_TIMESTAMP('2026-01-20 19:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-01-20 20:30', 'YYYY-MM-DD HH24:MI'), 42000, 135000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (9, 26, TO_TIMESTAMP('2026-01-21 23:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-01-22 00:30', 'YYYY-MM-DD HH24:MI'), 19000, 300000.00);

INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (4, 27, TO_TIMESTAMP('2026-10-16 19:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-10-16 20:30', 'YYYY-MM-DD HH24:MI'), 32000, 100000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (5, 28, TO_TIMESTAMP('2026-10-17 18:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-10-17 19:30', 'YYYY-MM-DD HH24:MI'), 14000, 85000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (1, 27, TO_TIMESTAMP('2026-10-15 23:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-10-16 00:30', 'YYYY-MM-DD HH24:MI'), 35000, 160000.00);

INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (2, 29, TO_TIMESTAMP('2026-05-20 21:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-05-20 22:30', 'YYYY-MM-DD HH24:MI'), 9500, 130000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado) VALUES (10, 30, TO_TIMESTAMP('2026-05-22 21:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-05-22 22:30', 'YYYY-MM-DD HH24:MI'), 4800, 60000.00);

-- ============================================================
-- MÚSICAS E RELACIONAMENTO CANTA
-- ============================================================

INSERT INTO Musica (id_musica, nome, artista_original, duracao) VALUES (1, 'Roots Bloody Roots', 'Sepultura', 212);
INSERT INTO Canta (musica, vocalista) VALUES (1, '11111111102');

INSERT INTO Musica (id_musica, nome, artista_original, duracao) VALUES (2, 'Refuse/Resist', 'Sepultura', 199);
INSERT INTO Canta (musica, vocalista) VALUES (2, '11111111102');

INSERT INTO Musica (id_musica, nome, artista_original, duracao) VALUES (3, 'Territory', 'Sepultura', 287);
INSERT INTO Canta (musica, vocalista) VALUES (3, '11111111102');

INSERT INTO Musica (id_musica, nome, artista_original, duracao) VALUES (4, 'Ratamahatta', 'Sepultura', 270);
INSERT INTO Canta (musica, vocalista) VALUES (4, '11111111102');

INSERT INTO Musica (id_musica, nome, artista_original, duracao) VALUES (5, 'Arise', 'Sepultura', 198);
INSERT INTO Canta (musica, vocalista) VALUES (5, '11111111102');

INSERT INTO Musica (id_musica, nome, artista_original, duracao) VALUES (6, 'Vou Deixar', 'Skank', 215);
INSERT INTO Canta (musica, vocalista) VALUES (6, '22222222201');

INSERT INTO Musica (id_musica, nome, artista_original, duracao) VALUES (7, 'Garota Nacional', 'Skank', 317);
INSERT INTO Canta (musica, vocalista) VALUES (7, '22222222201');

INSERT INTO Musica (id_musica, nome, artista_original, duracao) VALUES (8, 'Sutilmente', 'Skank', 242);
INSERT INTO Canta (musica, vocalista) VALUES (8, '22222222201');

INSERT INTO Musica (id_musica, nome, artista_original, duracao) VALUES (9, 'Acima do Sol', 'Skank', 244);
INSERT INTO Canta (musica, vocalista) VALUES (9, '22222222201');

INSERT INTO Musica (id_musica, nome, artista_original, duracao) VALUES (10, 'Resposta', 'Skank', 244);
INSERT INTO Canta (musica, vocalista) VALUES (10, '22222222201');

INSERT INTO Musica (id_musica, nome, artista_original, duracao) VALUES (11, 'Andei So', 'Natiruts', 260);
INSERT INTO Canta (musica, vocalista) VALUES (11, '44444444401');

INSERT INTO Musica (id_musica, nome, artista_original, duracao) VALUES (12, 'Sorri Sou Rei', 'Natiruts', 305);
INSERT INTO Canta (musica, vocalista) VALUES (12, '44444444401');

INSERT INTO Musica (id_musica, nome, artista_original, duracao) VALUES (13, 'Quero Ser Feliz Tambem', 'Natiruts', 195);
INSERT INTO Canta (musica, vocalista) VALUES (13, '44444444401');

INSERT INTO Musica (id_musica, nome, artista_original, duracao) VALUES (14, 'Natiruts Reggae Power', 'Natiruts', 270);
INSERT INTO Canta (musica, vocalista) VALUES (14, '44444444401');

INSERT INTO Musica (id_musica, nome, artista_original, duracao) VALUES (15, 'Liberdade Pra Dentro da Cabeca', 'Natiruts', 288);
INSERT INTO Canta (musica, vocalista) VALUES (15, '44444444401');

INSERT INTO Musica (id_musica, nome, artista_original, duracao) VALUES (16, 'Sulamericano', 'BaianaSystem', 198);
INSERT INTO Canta (musica, vocalista) VALUES (16, '55555555501');

INSERT INTO Musica (id_musica, nome, artista_original, duracao) VALUES (17, 'Lucro', 'BaianaSystem', 255);
INSERT INTO Canta (musica, vocalista) VALUES (17, '55555555501');

INSERT INTO Musica (id_musica, nome, artista_original, duracao) VALUES (18, 'Playsom', 'BaianaSystem', 190);
INSERT INTO Canta (musica, vocalista) VALUES (18, '55555555501');

INSERT INTO Musica (id_musica, nome, artista_original, duracao) VALUES (19, 'Capim Guine', 'BaianaSystem', 201);
INSERT INTO Canta (musica, vocalista) VALUES (19, '55555555501');

INSERT INTO Musica (id_musica, nome, artista_original, duracao) VALUES (20, 'Duas Cidades', 'BaianaSystem', 242);
INSERT INTO Canta (musica, vocalista) VALUES (20, '55555555501');

INSERT INTO Musica (id_musica, nome, artista_original, duracao) VALUES (21, 'Carry On', 'Angra', 303);
INSERT INTO Canta (musica, vocalista) VALUES (21, '66666666602');

INSERT INTO Musica (id_musica, nome, artista_original, duracao) VALUES (22, 'Nova Era', 'Angra', 292);
INSERT INTO Canta (musica, vocalista) VALUES (22, '66666666602');

INSERT INTO Musica (id_musica, nome, artista_original, duracao) VALUES (23, 'Rebirth', 'Angra', 315);
INSERT INTO Canta (musica, vocalista) VALUES (23, '66666666602');

INSERT INTO Musica (id_musica, nome, artista_original, duracao) VALUES (24, 'Bleeding Heart', 'Angra', 244);
INSERT INTO Canta (musica, vocalista) VALUES (24, '66666666602');

INSERT INTO Musica (id_musica, nome, artista_original, duracao) VALUES (25, 'Nothing to Say', 'Angra', 380);
INSERT INTO Canta (musica, vocalista) VALUES (25, '66666666602');

INSERT INTO Musica (id_musica, nome, artista_original, duracao) VALUES (26, 'Jesus Chorou', 'Racionais MCs', 450);
INSERT INTO Canta (musica, vocalista) VALUES (26, '77777777701');
INSERT INTO Canta (musica, vocalista) VALUES (26, '77777777703');

INSERT INTO Musica (id_musica, nome, artista_original, duracao) VALUES (27, 'Vida Loka Parte 1', 'Racionais MCs', 304);
INSERT INTO Canta (musica, vocalista) VALUES (27, '77777777701');
INSERT INTO Canta (musica, vocalista) VALUES (27, '77777777703');

INSERT INTO Musica (id_musica, nome, artista_original, duracao) VALUES (28, 'Vida Loka Parte 2', 'Racionais MCs', 350);
INSERT INTO Canta (musica, vocalista) VALUES (28, '77777777701');
INSERT INTO Canta (musica, vocalista) VALUES (28, '77777777703');

INSERT INTO Musica (id_musica, nome, artista_original, duracao) VALUES (29, 'Negro Drama', 'Racionais MCs', 390);
INSERT INTO Canta (musica, vocalista) VALUES (29, '77777777701');
INSERT INTO Canta (musica, vocalista) VALUES (29, '77777777703');

INSERT INTO Musica (id_musica, nome, artista_original, duracao) VALUES (30, 'Capitulo 4 Versiculo 3', 'Racionais MCs', 485);
INSERT INTO Canta (musica, vocalista) VALUES (30, '77777777701');
INSERT INTO Canta (musica, vocalista) VALUES (30, '77777777703');

INSERT INTO Musica (id_musica, nome, artista_original, duracao) VALUES (31, 'Sonifera Ilha', 'Titas', 174);
INSERT INTO Canta (musica, vocalista) VALUES (31, '88888888802');
INSERT INTO Canta (musica, vocalista) VALUES (31, '88888888803');

INSERT INTO Musica (id_musica, nome, artista_original, duracao) VALUES (32, 'Epitafio', 'Titas', 175);
INSERT INTO Canta (musica, vocalista) VALUES (32, '88888888802');
INSERT INTO Canta (musica, vocalista) VALUES (32, '88888888803');

INSERT INTO Musica (id_musica, nome, artista_original, duracao) VALUES (33, 'Pra Dizer Adeus', 'Titas', 210);
INSERT INTO Canta (musica, vocalista) VALUES (33, '88888888802');
INSERT INTO Canta (musica, vocalista) VALUES (33, '88888888803');

INSERT INTO Musica (id_musica, nome, artista_original, duracao) VALUES (34, 'Homem Primata', 'Titas', 205);
INSERT INTO Canta (musica, vocalista) VALUES (34, '88888888802');
INSERT INTO Canta (musica, vocalista) VALUES (34, '88888888803');

INSERT INTO Musica (id_musica, nome, artista_original, duracao) VALUES (35, 'Flores', 'Titas', 207);
INSERT INTO Canta (musica, vocalista) VALUES (35, '88888888802');
INSERT INTO Canta (musica, vocalista) VALUES (35, '88888888803');

INSERT INTO Musica (id_musica, nome, artista_original, duracao) VALUES (36, 'Pode Chorar', 'Jorge e Mateus', 195);
INSERT INTO Canta (musica, vocalista) VALUES (36, '99999999901');
INSERT INTO Canta (musica, vocalista) VALUES (36, '99999999902');

INSERT INTO Musica (id_musica, nome, artista_original, duracao) VALUES (37, 'Amo Noite e Dia', 'Jorge e Mateus', 185);
INSERT INTO Canta (musica, vocalista) VALUES (37, '99999999901');
INSERT INTO Canta (musica, vocalista) VALUES (37, '99999999902');

INSERT INTO Musica (id_musica, nome, artista_original, duracao) VALUES (38, 'Sosseguei', 'Jorge e Mateus', 195);
INSERT INTO Canta (musica, vocalista) VALUES (38, '99999999901');
INSERT INTO Canta (musica, vocalista) VALUES (38, '99999999902');

INSERT INTO Musica (id_musica, nome, artista_original, duracao) VALUES (39, 'Propaganda', 'Jorge e Mateus', 170);
INSERT INTO Canta (musica, vocalista) VALUES (39, '99999999901');
INSERT INTO Canta (musica, vocalista) VALUES (39, '99999999902');

INSERT INTO Musica (id_musica, nome, artista_original, duracao) VALUES (40, 'Cheirosa', 'Jorge e Mateus', 165);
INSERT INTO Canta (musica, vocalista) VALUES (40, '99999999901');
INSERT INTO Canta (musica, vocalista) VALUES (40, '99999999902');

INSERT INTO Musica (id_musica, nome, artista_original, duracao) VALUES (41, 'Xote dos Milagres', 'Falamansa', 245);
INSERT INTO Canta (musica, vocalista) VALUES (41, '10101010101');

INSERT INTO Musica (id_musica, nome, artista_original, duracao) VALUES (42, 'Rindo a Toa', 'Falamansa', 210);
INSERT INTO Canta (musica, vocalista) VALUES (42, '10101010101');

INSERT INTO Musica (id_musica, nome, artista_original, duracao) VALUES (43, 'Xote da Alegria', 'Falamansa', 250);
INSERT INTO Canta (musica, vocalista) VALUES (43, '10101010101');

INSERT INTO Musica (id_musica, nome, artista_original, duracao) VALUES (44, 'Oh Chuva', 'Falamansa', 220);
INSERT INTO Canta (musica, vocalista) VALUES (44, '10101010101');

INSERT INTO Musica (id_musica, nome, artista_original, duracao) VALUES (45, 'Asas', 'Falamansa', 215);
INSERT INTO Canta (musica, vocalista) VALUES (45, '10101010101');

INSERT INTO Musica (id_musica, nome, artista_original, duracao) VALUES (46, 'Meu Maracatu Pesa a Tonelada', 'Nacao Zumbi', 230);
INSERT INTO Canta (musica, vocalista) VALUES (46, '11011011001');

INSERT INTO Musica (id_musica, nome, artista_original, duracao) VALUES (47, 'Manguetown', 'Nacao Zumbi', 245);
INSERT INTO Canta (musica, vocalista) VALUES (47, '11011011001');

INSERT INTO Musica (id_musica, nome, artista_original, duracao) VALUES (48, 'A Praieira', 'Nacao Zumbi', 205);
INSERT INTO Canta (musica, vocalista) VALUES (48, '11011011001');

INSERT INTO Musica (id_musica, nome, artista_original, duracao) VALUES (49, 'Maracatu Atomico', 'Nacao Zumbi', 270);
INSERT INTO Canta (musica, vocalista) VALUES (49, '11011011001');

INSERT INTO Musica (id_musica, nome, artista_original, duracao) VALUES (50, 'Quando a Mare Encher', 'Nacao Zumbi', 215);
INSERT INTO Canta (musica, vocalista) VALUES (50, '11011011001');

INSERT INTO Musica (id_musica, nome, artista_original, duracao) VALUES (51, 'Crucificados Pelo Sistema', 'Ratos de Porao', 105);
INSERT INTO Canta (musica, vocalista) VALUES (51, '12012012001');

INSERT INTO Musica (id_musica, nome, artista_original, duracao) VALUES (52, 'Beber Ate Morrer', 'Ratos de Porao', 130);
INSERT INTO Canta (musica, vocalista) VALUES (52, '12012012001');

INSERT INTO Musica (id_musica, nome, artista_original, duracao) VALUES (53, 'Aids Pop Repressao', 'Ratos de Porao', 85);
INSERT INTO Canta (musica, vocalista) VALUES (53, '12012012001');

INSERT INTO Musica (id_musica, nome, artista_original, duracao) VALUES (54, 'Morrer', 'Ratos de Porao', 110);
INSERT INTO Canta (musica, vocalista) VALUES (54, '12012012001');

INSERT INTO Musica (id_musica, nome, artista_original, duracao) VALUES (55, 'Igreja Universal', 'Ratos de Porao', 150);
INSERT INTO Canta (musica, vocalista) VALUES (55, '12012012001');


-- ============================================================
-- OPCIONAL: tornar líder obrigatório depois do povoamento
-- Só execute se quiser garantir que toda banda tenha líder.
-- ============================================================

-- ALTER TABLE Banda MODIFY lider NOT NULL;


COMMIT;