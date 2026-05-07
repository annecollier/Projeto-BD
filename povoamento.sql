REM   Script: povoamento
REM   av3

-- FESTIVAIS
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

-- PALCOS
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
