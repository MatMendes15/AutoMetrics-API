CREATE TABLE public."Veiculos" (
  "Id" SERIAL PRIMARY KEY,
  "Modelo" VARCHAR(100) NOT NULL,
  "Fabricante" VARCHAR(100) NOT NULL,
  "Ano" INT NOT NULL,
  "TipoCombustivel" VARCHAR(20) NOT NULL,
  "DataCadastro" TIMESTAMP WITH TIME ZONE NOT NULL DEFAULT NOW(),
  "ConsumoMedioKmPorLitro" NUMERIC(10,2) NOT NULL,
  "EmissaoCO2PorKm" NUMERIC(10,2) NOT NULL
);

INSERT INTO public."Veiculos"
  ("Modelo","Fabricante","Ano","TipoCombustivel","DataCadastro","ConsumoMedioKmPorLitro","EmissaoCO2PorKm")
VALUES
  ('NSX','Honda',1997,'Gasolina','2025-05-03T20:27:50Z',8.00,291.00),
  ('Corolla Hybrid LE AWD','Toyota',2023,'Hibrido','2025-05-03T22:00:00Z',20.41,115.00),
  ('Civic EX Sedan','Honda',2023,'Gasolina','2025-05-03T22:05:00Z',14.49,162.00),
  ('Polo VI 1.0 TSI','Volkswagen',2023,'Gasolina','2025-05-03T22:10:00Z',21.28,108.00);


INSERT INTO "Veiculos" (
  "Id","Modelo","Fabricante","Ano","TipoCombustivel","ConsumoMedioKmPorLitro","EmissaoCO2PorKm"
) VALUES
  -- Honda (2023–2024)
  (5,  'City Sedan EXL',        'Honda',      2023, 'Gasolina/Etanol', 12.8,  94),
  (6,  'City Hatchback Touring', 'Honda',      2023, 'Gasolina/Etanol', 12.7,  95),
  (7,  'HR-V EXL',               'Honda',      2023, 'Gasolina/Etanol', 11.9, 100),
  (8,  'HR-V Touring (Turbo)',   'Honda',      2023, 'Gasolina/Etanol', 10.7, 113),
  (9,  'Civic e:HEV Touring',    'Honda',      2023, 'Híbrido',         17.1,  74),
  (10, 'ZR-V Touring',           'Honda',      2024, 'Gasolina',        11.1, 122),

  -- Nissan (2023–2024)
  (11, 'Versa 1.6 CVT',         'Nissan',     2023, 'Gasolina/Etanol', 12.5, 104),
  (12, 'Sentra 2.0 CVT',        'Nissan',     2023, 'Gasolina',        12.4, 110),
  (13, 'Kicks 1.6 CVT',         'Nissan',     2023, 'Gasolina/Etanol', 11.6, 109),
  (14, 'Frontier 2.3 4x4 AT',   'Nissan',     2023, 'Diesel',          10.0, 203),
  (15, 'Leaf 110 kW (Tekna)',   'Nissan',     2023, 'Elétrico',        35.3,   0),

  -- Toyota (2023–2024)
  (16, 'Corolla 2.0 Flex',       'Toyota',     2023, 'Gasolina/Etanol', 12.0, 103),
  (17, 'Corolla Cross 2.0 Flex', 'Toyota',     2023, 'Gasolina/Etanol', 11.0, 109),
  (18, 'Corolla Cross Hybrid',   'Toyota',     2023, 'Híbrido',         16.2,  79),
  (19, 'RAV4 Hybrid AWD',        'Toyota',     2023, 'Híbrido',         15.8,  82),
  (20, 'Hilux CD SRX 4x4',       'Toyota',     2023, 'Diesel',          10.7, 187),

  -- Volkswagen (2023–2024)
  (21, 'Gol 1.0 MPI',                    'Volkswagen', 2023, 'Gasolina/Etanol', 13.0,  92),
  (22, 'Polo Highline 200 TSI',          'Volkswagen', 2023, 'Gasolina/Etanol', 12.7, 101),
  (23, 'Virtus Comfortline 200 TSI',     'Volkswagen', 2023, 'Gasolina/Etanol', 12.7, 102),
  (24, 'Saveiro Cross 1.6',              'Volkswagen', 2023, 'Gasolina/Etanol', 10.7, 113),
  (25, 'T-Cross Highline 250 TSI',       'Volkswagen', 2023, 'Gasolina/Etanol', 12.1, 104),
  (26, 'Taos Comfortline 250 TSI',       'Volkswagen', 2023, 'Gasolina/Etanol', 11.1, 114),

  -- Audi (2023–2024)
  (27, 'A3 Sedan S-Line 40 TFSI',        'Audi',       2023, 'Gasolina',        11.4, 121),
  (28, 'Q3 Performance 2.0 TFSI',        'Audi',       2023, 'Gasolina',         9.2, 154),
  (29, 'Q5 Prestige 2.0 TFSI',           'Audi',       2023, 'Gasolina',         9.3, 149),
  (30, 'Q7 3.0 TFSI e Quattro',          'Audi',       2023, 'Híbrido',          7.6, 183),
  (31, 'RS e-tron GT Quattro',           'Audi',       2024, 'Elétrico',        29.2,   0),

  -- Chevrolet (2023–2024)
  (32, 'Onix 1.0 Turbo AT',              'Chevrolet',  2023, 'Gasolina/Etanol', 12.6, 102),
  (33, 'Onix Plus 1.0 Turbo AT',         'Chevrolet',  2023, 'Gasolina/Etanol', 14.5,  95),
  (34, 'Tracker 1.0 Turbo AT',           'Chevrolet',  2023, 'Gasolina/Etanol', 11.6, 110),
  (35, 'S10 LTZ 2.8 4x4 AT',             'Chevrolet',  2023, 'Diesel',           9.8, 211),
  (36, 'Bolt EV Premier',                'Chevrolet',  2023, 'Elétrico',        42.4,   0),

  -- Fiat (2023–2024)
  (37, 'Mobi Easy 1.0',                  'Fiat',       2023, 'Gasolina/Etanol', 13.3,  88),
  (38, 'Argo Drive 1.3 CVT',             'Fiat',       2023, 'Gasolina/Etanol', 12.6,  97),
  (39, 'Pulse Impetus 1.0 Turbo',        'Fiat',       2023, 'Gasolina/Etanol', 12.3, 102),
  (40, 'Fastback Limited 1.3 Turbo',     'Fiat',       2023, 'Gasolina/Etanol', 11.7, 109),
  (41, 'Toro Volcano 2.0 4x4 AT',        'Fiat',       2023, 'Diesel',          11.7, 173),
  (42, '500e Icon',                      'Fiat',       2023, 'Elétrico',        43.8,   0);

  
