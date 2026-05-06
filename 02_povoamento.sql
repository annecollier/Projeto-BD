REM   Script: povoamento
REM   av3

DELETE FROM Apresentacao;
DELETE FROM Utiliza;
DELETE FROM Equipamento_de_palco;
DELETE FROM Palco;
DELETE FROM Festival;
DELETE FROM Instrumento;
DELETE FROM Produtor;
DELETE FROM Compositor;
DELETE FROM Instrumentista;
DELETE FROM Vocalista;
DELETE FROM Telefone_membro;
DELETE FROM Membro;
DELETE FROM Banda;

-- BANDAS

INSERT INTO Banda (id_banda, nome_banda, genero, rider_tecnico, lider, madrinha)
    VALUES (1, 'Tribalistas Nordestinos', 'MPB',        'PA 10kW, 4 monitores, mesa 32 canais',           NULL, NULL);
INSERT INTO Banda (id_banda, nome_banda, genero, rider_tecnico, lider, madrinha)
    VALUES (2, 'Voltage Rush',            'Rock',       'PA 20kW, 6 monitores, backline completo',         NULL, NULL);
INSERT INTO Banda (id_banda, nome_banda, genero, rider_tecnico, lider, madrinha)
    VALUES (3, 'Forró da Caatinga',       'Forró',      'PA 8kW, 2 monitores, acordeom',                  NULL, NULL);
INSERT INTO Banda (id_banda, nome_banda, genero, rider_tecnico, lider, madrinha)
    VALUES (4, 'Neon Synth',              'Eletrônico', 'PA 30kW, 8 subwoofers, controle de iluminação',  NULL, NULL);
INSERT INTO Banda (id_banda, nome_banda, genero, rider_tecnico, lider, madrinha)
    VALUES (5, 'Raízes do Mangue',        'MPB',        'PA 12kW, 4 monitores, violão acústico amplificado', NULL, 1);
INSERT INTO Banda (id_banda, nome_banda, genero, rider_tecnico, lider, madrinha)
    VALUES (6, 'Steel Curtain',           'Metal',      'PA 25kW, 8 monitores, backline pesado',           NULL, 2);
INSERT INTO Banda (id_banda, nome_banda, genero, rider_tecnico, lider, madrinha)
    VALUES (7, 'Swing do Recife',         'Jazz',       'PA 6kW, 4 monitores, piano de cauda',             NULL, NULL);
INSERT INTO Banda (id_banda, nome_banda, genero, rider_tecnico, lider, madrinha)
    VALUES (8, 'BaixoAstral',             'Reggae',     'PA 10kW, 4 monitores, teclado Hammond',           NULL, NULL);

-- MEMBROS

INSERT INTO Membro (cpf, nome, banda) VALUES ('12345678901', 'Lucas Pereira',         1);
INSERT INTO Membro (cpf, nome, banda) VALUES ('23456789012', 'Fernanda Souza',        1);
INSERT INTO Membro (cpf, nome, banda) VALUES ('34567890123', 'Rafael Moreira',        2);
INSERT INTO Membro (cpf, nome, banda) VALUES ('45678901234', 'Camila Nunes',          2);
INSERT INTO Membro (cpf, nome, banda) VALUES ('56789012345', 'Tiago Albuquerque',     3);
INSERT INTO Membro (cpf, nome, banda) VALUES ('67890123456', 'Priya Venkatesh',       3);
INSERT INTO Membro (cpf, nome, banda) VALUES ('78901234567', 'Mariana Lima',          4);
INSERT INTO Membro (cpf, nome, banda) VALUES ('89012345678', 'Diego Carvalho',        4);
INSERT INTO Membro (cpf, nome, banda) VALUES ('90123456789', 'Beatriz Fonseca',       5);
INSERT INTO Membro (cpf, nome, banda) VALUES ('01234567890', 'Pedro Henrique Costa',  5);
INSERT INTO Membro (cpf, nome, banda) VALUES ('11122233344', 'Gustavo Ribeiro',       6);
INSERT INTO Membro (cpf, nome, banda) VALUES ('22233344455', 'Larissa Melo',          6);
INSERT INTO Membro (cpf, nome, banda) VALUES ('33344455566', 'Ana Paula Barros',      7);
INSERT INTO Membro (cpf, nome, banda) VALUES ('44455566677', 'Carlos Eduardo Gomes',  7);
INSERT INTO Membro (cpf, nome, banda) VALUES ('55566677788', 'Renata Cavalcanti',     8);
INSERT INTO Membro (cpf, nome, banda) VALUES ('66677788899', 'Sérgio Wanderley',      8);
INSERT INTO Membro (cpf, nome, banda) VALUES ('77788899900', 'Bruna Silveira',        1);
INSERT INTO Membro (cpf, nome, banda) VALUES ('88899900011', 'Felipe Nascimento',     2);
INSERT INTO Membro (cpf, nome, banda) VALUES ('99900011122', 'Juliana Ramos',         3);
INSERT INTO Membro (cpf, nome, banda) VALUES ('00011122233', 'Eduardo Leal',          4);

-- ATUALIZACAO DOS LIDERES DA BANDA

UPDATE Banda SET lider = '12345678901' WHERE id_banda = 1;
UPDATE Banda SET lider = '34567890123' WHERE id_banda = 2;
UPDATE Banda SET lider = '56789012345' WHERE id_banda = 3;
UPDATE Banda SET lider = '78901234567' WHERE id_banda = 4;
UPDATE Banda SET lider = '90123456789' WHERE id_banda = 5;
UPDATE Banda SET lider = '11122233344' WHERE id_banda = 6;
UPDATE Banda SET lider = '33344455566' WHERE id_banda = 7;
UPDATE Banda SET lider = '55566677788' WHERE id_banda = 8;

-- TELEFONES DOS MEMBROS

INSERT INTO Telefone_membro (membro, telefone) VALUES ('12345678901', '81991110001');
INSERT INTO Telefone_membro (membro, telefone) VALUES ('12345678901', '81991110002');
INSERT INTO Telefone_membro (membro, telefone) VALUES ('34567890123', '81992220001');
INSERT INTO Telefone_membro (membro, telefone) VALUES ('56789012345', '81993330001');
INSERT INTO Telefone_membro (membro, telefone) VALUES ('78901234567', '81994440001');
INSERT INTO Telefone_membro (membro, telefone) VALUES ('78901234567', '81994440002');
INSERT INTO Telefone_membro (membro, telefone) VALUES ('90123456789', '81995550001');
INSERT INTO Telefone_membro (membro, telefone) VALUES ('11122233344', '11966660001');
INSERT INTO Telefone_membro (membro, telefone) VALUES ('33344455566', '81997770001');
INSERT INTO Telefone_membro (membro, telefone) VALUES ('55566677788', '81998880001');
INSERT INTO Telefone_membro (membro, telefone) VALUES ('99900011122', '81999990001');
INSERT INTO Telefone_membro (membro, telefone) VALUES ('00011122233', '21900001111');

-- VOCALISTAS

INSERT INTO Vocalista (cpf_vocalista) VALUES ('12345678901');
INSERT INTO Vocalista (cpf_vocalista) VALUES ('23456789012');
INSERT INTO Vocalista (cpf_vocalista) VALUES ('56789012345');
INSERT INTO Vocalista (cpf_vocalista) VALUES ('78901234567');
INSERT INTO Vocalista (cpf_vocalista) VALUES ('33344455566');
INSERT INTO Vocalista (cpf_vocalista) VALUES ('55566677788');

-- INSTRUMENTISTAS

INSERT INTO Instrumentista (cpf_instrumentista) VALUES ('34567890123');
INSERT INTO Instrumentista (cpf_instrumentista) VALUES ('45678901234');
INSERT INTO Instrumentista (cpf_instrumentista) VALUES ('67890123456');
INSERT INTO Instrumentista (cpf_instrumentista) VALUES ('89012345678');
INSERT INTO Instrumentista (cpf_instrumentista) VALUES ('01234567890');
INSERT INTO Instrumentista (cpf_instrumentista) VALUES ('11122233344');
INSERT INTO Instrumentista (cpf_instrumentista) VALUES ('44455566677');
INSERT INTO Instrumentista (cpf_instrumentista) VALUES ('66677788899');
INSERT INTO Instrumentista (cpf_instrumentista) VALUES ('77788899900');
INSERT INTO Instrumentista (cpf_instrumentista) VALUES ('88899900011');


-- COMPOSITORES

INSERT INTO Compositor (cpf_compositor) VALUES ('12345678901');
INSERT INTO Compositor (cpf_compositor) VALUES ('34567890123');
INSERT INTO Compositor (cpf_compositor) VALUES ('78901234567');
INSERT INTO Compositor (cpf_compositor) VALUES ('90123456789');
INSERT INTO Compositor (cpf_compositor) VALUES ('33344455566');
INSERT INTO Compositor (cpf_compositor) VALUES ('66677788899');


--PRODUTORES

INSERT INTO Produtor (cpf_produtor) VALUES ('99900011122');
INSERT INTO Produtor (cpf_produtor) VALUES ('00011122233');
INSERT INTO Produtor (cpf_produtor) VALUES ('01234567890');
INSERT INTO Produtor (cpf_produtor) VALUES ('89012345678');


--INSTRUMENTOS

INSERT INTO Instrumento (membro, tipo, marca) VALUES ('34567890123', 'Guitarra',    'Fender');
INSERT INTO Instrumento (membro, tipo, marca) VALUES ('34567890123', 'Baixo',       'Music Man');
INSERT INTO Instrumento (membro, tipo, marca) VALUES ('45678901234', 'Bateria',     'Pearl');
INSERT INTO Instrumento (membro, tipo, marca) VALUES ('67890123456', 'Teclado',     'Roland');
INSERT INTO Instrumento (membro, tipo, marca) VALUES ('89012345678', 'Guitarra',    'Gibson');
INSERT INTO Instrumento (membro, tipo, marca) VALUES ('11122233344', 'Guitarra',    'ESP');
INSERT INTO Instrumento (membro, tipo, marca) VALUES ('44455566677', 'Contrabaixo', 'Fender');
INSERT INTO Instrumento (membro, tipo, marca) VALUES ('66677788899', 'Saxofone',    'Yamaha');
INSERT INTO Instrumento (membro, tipo, marca) VALUES ('77788899900', 'Violão',      'Giannini');
INSERT INTO Instrumento (membro, tipo, marca) VALUES ('88899900011', 'Baixo',       'Ibanez');
INSERT INTO Instrumento (membro, tipo, marca) VALUES ('67890123456', 'Violão',      'Takamine');
INSERT INTO Instrumento (membro, tipo, marca) VALUES ('89012345678', 'Outro',       'Boss');


--FESTIVAIS

INSERT INTO Festival (id_festival, nome_festival, edicao, local, data_inicio, data_fim)
    VALUES (1, 'Festival do Sol',    1, 'Parque da Jaqueira, Recife - PE',          DATE '2025-07-10', DATE '2025-07-13');
INSERT INTO Festival (id_festival, nome_festival, edicao, local, data_inicio, data_fim)
    VALUES (2, 'Festival do Sol',    2, 'Parque da Jaqueira, Recife - PE',          DATE '2026-07-09', DATE '2026-07-12');
INSERT INTO Festival (id_festival, nome_festival, edicao, local, data_inicio, data_fim)
    VALUES (3, 'Rock no Capibaribe', 1, 'Marco Zero, Recife - PE',                  DATE '2025-04-18', DATE '2025-04-20');
INSERT INTO Festival (id_festival, nome_festival, edicao, local, data_inicio, data_fim)
    VALUES (4, 'Nordeste em Música', 3, 'Arena Pernambuco, São Lourenço - PE',      DATE '2025-09-05', DATE '2025-09-08');
INSERT INTO Festival (id_festival, nome_festival, edicao, local, data_inicio, data_fim)
    VALUES (5, 'Eletrônica Mangue',  1, 'Porto Digital, Recife - PE',               DATE '2025-11-22', DATE '2025-11-23');
INSERT INTO Festival (id_festival, nome_festival, edicao, local, data_inicio, data_fim)
    VALUES (6, 'Jazz na Praia',      5, 'Praia de Boa Viagem, Recife - PE',         DATE '2026-02-14', DATE '2026-02-16');


--PALCOS

INSERT INTO Palco (id_palco, nome_palco, setor, tema, capacidade_maxima, festival)
    VALUES (1,  'Palco Principal',    'Área A', 'Raízes Nordestinas',       30000, 1);
INSERT INTO Palco (id_palco, nome_palco, setor, tema, capacidade_maxima, festival)
    VALUES (2,  'Palco Alternativo',  'Área B', 'Novos Talentos',            8000, 1);
INSERT INTO Palco (id_palco, nome_palco, setor, tema, capacidade_maxima, festival)
    VALUES (3,  'Palco Acústico',     'Área C', 'Voz e Violão',              2000, 1);
INSERT INTO Palco (id_palco, nome_palco, setor, tema, capacidade_maxima, festival)
    VALUES (4,  'Palco Sol Nascente', 'Área A', 'Raízes Nordestinas',       35000, 2);
INSERT INTO Palco (id_palco, nome_palco, setor, tema, capacidade_maxima, festival)
    VALUES (5,  'Palco Descobertas',  'Área B', 'Novos Talentos',            9000, 2);
INSERT INTO Palco (id_palco, nome_palco, setor, tema, capacidade_maxima, festival)
    VALUES (6,  'Palco Main Stage',   'Área A', 'Rock Clássico e Moderno',  25000, 3);
INSERT INTO Palco (id_palco, nome_palco, setor, tema, capacidade_maxima, festival)
    VALUES (7,  'Palco Underground',  'Área B', 'Punk e Metal',              5000, 3);
INSERT INTO Palco (id_palco, nome_palco, setor, tema, capacidade_maxima, festival)
    VALUES (8,  'Palco Nordestino',   'Área A', 'Cultura Popular',          40000, 4);
INSERT INTO Palco (id_palco, nome_palco, setor, tema, capacidade_maxima, festival)
    VALUES (9,  'Palco Revelações',   'Área B', 'Talentos Locais',          10000, 4);
INSERT INTO Palco (id_palco, nome_palco, setor, tema, capacidade_maxima, festival)
    VALUES (10, 'Palco Dance Floor',  'Área A', 'Eletrônico e Bass',        15000, 5);
INSERT INTO Palco (id_palco, nome_palco, setor, tema, capacidade_maxima, festival)
    VALUES (11, 'Palco Chill',        'Área B', 'Lo-fi e Ambient',           3000, 5);
INSERT INTO Palco (id_palco, nome_palco, setor, tema, capacidade_maxima, festival)
    VALUES (12, 'Palco Beira-Mar',    'Área A', 'Jazz ao Ar Livre',          6000, 6);
INSERT INTO Palco (id_palco, nome_palco, setor, tema, capacidade_maxima, festival)
    VALUES (13, 'Palco Sunset',       'Área B', 'Bossa Nova e MPB',          4000, 6);

--EQUIPAMENTOS DE PALCO

INSERT INTO Equipamento_de_palco (id_equipamento, tipo) VALUES (1,  'Caixa de som');
INSERT INTO Equipamento_de_palco (id_equipamento, tipo) VALUES (2,  'Amplificador');
INSERT INTO Equipamento_de_palco (id_equipamento, tipo) VALUES (3,  'Mesa de som');
INSERT INTO Equipamento_de_palco (id_equipamento, tipo) VALUES (4,  'Microfone');
INSERT INTO Equipamento_de_palco (id_equipamento, tipo) VALUES (5,  'Monitor de palco');
INSERT INTO Equipamento_de_palco (id_equipamento, tipo) VALUES (6,  'Iluminação LED');
INSERT INTO Equipamento_de_palco (id_equipamento, tipo) VALUES (7,  'Gerador');
INSERT INTO Equipamento_de_palco (id_equipamento, tipo) VALUES (8,  'Cabo P10');
INSERT INTO Equipamento_de_palco (id_equipamento, tipo) VALUES (9,  'Cabo XLR');
INSERT INTO Equipamento_de_palco (id_equipamento, tipo) VALUES (10, 'Direct Box');
INSERT INTO Equipamento_de_palco (id_equipamento, tipo) VALUES (11, 'Subwoofer');
INSERT INTO Equipamento_de_palco (id_equipamento, tipo) VALUES (12, 'Pedal de efeito');
INSERT INTO Equipamento_de_palco (id_equipamento, tipo) VALUES (13, 'Microfone');
INSERT INTO Equipamento_de_palco (id_equipamento, tipo) VALUES (14, 'Amplificador');
INSERT INTO Equipamento_de_palco (id_equipamento, tipo) VALUES (15, 'Caixa de som');


--UTILIZAÇÃO DE EQUIPAMENTOS POR BANDAS E PALCOS 

INSERT INTO Utiliza (banda, palco, equipamento) VALUES (1, 1,  1);
INSERT INTO Utiliza (banda, palco, equipamento) VALUES (1, 1,  3);
INSERT INTO Utiliza (banda, palco, equipamento) VALUES (1, 1,  4);
INSERT INTO Utiliza (banda, palco, equipamento) VALUES (1, 1,  5);
INSERT INTO Utiliza (banda, palco, equipamento) VALUES (1, 1,  6);
INSERT INTO Utiliza (banda, palco, equipamento) VALUES (2, 6,  1);
INSERT INTO Utiliza (banda, palco, equipamento) VALUES (2, 6,  2);
INSERT INTO Utiliza (banda, palco, equipamento) VALUES (2, 6,  3);
INSERT INTO Utiliza (banda, palco, equipamento) VALUES (2, 6,  5);
INSERT INTO Utiliza (banda, palco, equipamento) VALUES (2, 6, 11);
INSERT INTO Utiliza (banda, palco, equipamento) VALUES (3, 8,  1);
INSERT INTO Utiliza (banda, palco, equipamento) VALUES (3, 8,  3);
INSERT INTO Utiliza (banda, palco, equipamento) VALUES (3, 8,  4);
INSERT INTO Utiliza (banda, palco, equipamento) VALUES (3, 8,  5);
INSERT INTO Utiliza (banda, palco, equipamento) VALUES (4, 10, 1);
INSERT INTO Utiliza (banda, palco, equipamento) VALUES (4, 10, 3);
INSERT INTO Utiliza (banda, palco, equipamento) VALUES (4, 10, 6);
INSERT INTO Utiliza (banda, palco, equipamento) VALUES (4, 10, 7);
INSERT INTO Utiliza (banda, palco, equipamento) VALUES (4, 10,11);
INSERT INTO Utiliza (banda, palco, equipamento) VALUES (5, 2,  1);
INSERT INTO Utiliza (banda, palco, equipamento) VALUES (5, 2,  4);
INSERT INTO Utiliza (banda, palco, equipamento) VALUES (5, 2,  5);
INSERT INTO Utiliza (banda, palco, equipamento) VALUES (5, 2,  9);
INSERT INTO Utiliza (banda, palco, equipamento) VALUES (6, 7,  2);
INSERT INTO Utiliza (banda, palco, equipamento) VALUES (6, 7,  3);
INSERT INTO Utiliza (banda, palco, equipamento) VALUES (6, 7,  5);
INSERT INTO Utiliza (banda, palco, equipamento) VALUES (6, 7, 11);
INSERT INTO Utiliza (banda, palco, equipamento) VALUES (7, 12, 1);
INSERT INTO Utiliza (banda, palco, equipamento) VALUES (7, 12, 3);
INSERT INTO Utiliza (banda, palco, equipamento) VALUES (7, 12, 4);
INSERT INTO Utiliza (banda, palco, equipamento) VALUES (7, 12,10);
INSERT INTO Utiliza (banda, palco, equipamento) VALUES (8, 13, 1);
INSERT INTO Utiliza (banda, palco, equipamento) VALUES (8, 13, 3);
INSERT INTO Utiliza (banda, palco, equipamento) VALUES (8, 13, 4);
INSERT INTO Utiliza (banda, palco, equipamento) VALUES (8, 13, 6);


--APRESENTACOES

INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado)
    VALUES (1, 1,  TO_TIMESTAMP('2025-07-10 18:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2025-07-10 19:30', 'YYYY-MM-DD HH24:MI'), 25000,  85000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado)
    VALUES (5, 2,  TO_TIMESTAMP('2025-07-10 16:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2025-07-10 17:00', 'YYYY-MM-DD HH24:MI'),  6500,  22000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado)
    VALUES (3, 3,  TO_TIMESTAMP('2025-07-10 14:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2025-07-10 15:00', 'YYYY-MM-DD HH24:MI'),  1800,   9500.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado)
    VALUES (7, 3,  TO_TIMESTAMP('2025-07-10 16:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2025-07-10 17:00', 'YYYY-MM-DD HH24:MI'),  1900,  12000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado)
    VALUES (1, 4,  TO_TIMESTAMP('2026-07-09 20:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-07-09 22:00', 'YYYY-MM-DD HH24:MI'), 33000, 120000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado)
    VALUES (5, 5,  TO_TIMESTAMP('2026-07-09 17:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-07-09 18:30', 'YYYY-MM-DD HH24:MI'),  7800,  28000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado)
    VALUES (2, 6,  TO_TIMESTAMP('2025-04-18 21:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2025-04-18 23:00', 'YYYY-MM-DD HH24:MI'), 22000,  95000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado)
    VALUES (6, 7,  TO_TIMESTAMP('2025-04-18 19:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2025-04-18 20:30', 'YYYY-MM-DD HH24:MI'),  4500,  18000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado)
    VALUES (6, 7,  TO_TIMESTAMP('2025-04-18 22:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2025-04-18 23:30', 'YYYY-MM-DD HH24:MI'),  4800,  20000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado)
    VALUES (3, 8,  TO_TIMESTAMP('2025-09-05 17:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2025-09-05 18:30', 'YYYY-MM-DD HH24:MI'), 38000,  45000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado)
    VALUES (8, 9,  TO_TIMESTAMP('2025-09-05 15:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2025-09-05 16:00', 'YYYY-MM-DD HH24:MI'),  8200,  15000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado)
    VALUES (4, 10, TO_TIMESTAMP('2025-11-22 22:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2025-11-23 01:00', 'YYYY-MM-DD HH24:MI'), 14000, 110000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado)
    VALUES (4, 11, TO_TIMESTAMP('2025-11-22 19:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2025-11-22 20:30', 'YYYY-MM-DD HH24:MI'),  2500,  30000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado)
    VALUES (7, 12, TO_TIMESTAMP('2026-02-14 18:30', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-02-14 20:00', 'YYYY-MM-DD HH24:MI'),  5500,  25000.00);
INSERT INTO Apresentacao (banda, palco, hora_inicio, hora_fim, publico_presente, cache_combinado)
    VALUES (8, 13, TO_TIMESTAMP('2026-02-14 16:00', 'YYYY-MM-DD HH24:MI'), TO_TIMESTAMP('2026-02-14 17:30', 'YYYY-MM-DD HH24:MI'),  3800,  14000.00);
