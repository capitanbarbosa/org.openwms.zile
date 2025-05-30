-- Medellín Supermarket Distribution Center Demo Data
-- Distribución de Productos para Supermercados - Medellín, Colombia

-- Location Groups for different warehouse areas
INSERT INTO OWMS_LOCATION_GROUP (c_location_group_name, c_description, c_sorting_index, c_group_type) VALUES
('RECIBO', 'Área de Recibo - Receiving Area', 100, 'INBOUND'),
('ALMACEN-SECO', 'Almacén de Productos Secos', 200, 'STORAGE'),
('REFRIGERADOS', 'Área de Productos Refrigerados', 300, 'COLD_STORAGE'),
('CONGELADOS', 'Área de Productos Congelados', 400, 'FROZEN_STORAGE'),
('LIMPIEZA', 'Productos de Limpieza y Hogar', 500, 'STORAGE'),
('CUIDADO-PERSONAL', 'Cuidado Personal e Higiene', 600, 'STORAGE'),
('PICKING', 'Área de Preparación de Pedidos', 700, 'PICKING'),
('DESPACHO', 'Área de Despacho - Shipping', 800, 'OUTBOUND'),
('DEVOLUCION', 'Área de Devoluciones', 900, 'RETURNS');

-- Storage Locations - Realistic warehouse layout
-- Receiving Area
INSERT INTO OWMS_LOCATION (c_location_id, c_area, c_aisle, c_x, c_y, c_z, c_location_group_name, c_plc_code) VALUES
('REC-001', 'RECIBO', '01', 1, 1, 0, 'RECIBO', 'R01'),
('REC-002', 'RECIBO', '01', 2, 1, 0, 'RECIBO', 'R02'),
('REC-003', 'RECIBO', '01', 3, 1, 0, 'RECIBO', 'R03'),
('REC-004', 'RECIBO', '01', 4, 1, 0, 'RECIBO', 'R04');

-- Dry Goods Storage (Productos Secos)
INSERT INTO OWMS_LOCATION (c_location_id, c_area, c_aisle, c_x, c_y, c_z, c_location_group_name, c_plc_code) VALUES
('SEC-A01-01', 'ALMACEN-SECO', 'A01', 1, 1, 1, 'ALMACEN-SECO', 'SA1'),
('SEC-A01-02', 'ALMACEN-SECO', 'A01', 1, 2, 1, 'ALMACEN-SECO', 'SA2'),
('SEC-A01-03', 'ALMACEN-SECO', 'A01', 1, 3, 1, 'ALMACEN-SECO', 'SA3'),
('SEC-A02-01', 'ALMACEN-SECO', 'A02', 2, 1, 1, 'ALMACEN-SECO', 'SA4'),
('SEC-A02-02', 'ALMACEN-SECO', 'A02', 2, 2, 1, 'ALMACEN-SECO', 'SA5'),
('SEC-B01-01', 'ALMACEN-SECO', 'B01', 1, 1, 2, 'ALMACEN-SECO', 'SB1'),
('SEC-B01-02', 'ALMACEN-SECO', 'B01', 1, 2, 2, 'ALMACEN-SECO', 'SB2');

-- Refrigerated Storage (Refrigerados)
INSERT INTO OWMS_LOCATION (c_location_id, c_area, c_aisle, c_x, c_y, c_z, c_location_group_name, c_plc_code) VALUES
('REF-C01-01', 'REFRIGERADOS', 'C01', 1, 1, 1, 'REFRIGERADOS', 'RC1'),
('REF-C01-02', 'REFRIGERADOS', 'C01', 1, 2, 1, 'REFRIGERADOS', 'RC2'),
('REF-C02-01', 'REFRIGERADOS', 'C02', 2, 1, 1, 'REFRIGERADOS', 'RC3'),
('REF-C02-02', 'REFRIGERADOS', 'C02', 2, 2, 1, 'REFRIGERADOS', 'RC4');

-- Frozen Storage (Congelados)
INSERT INTO OWMS_LOCATION (c_location_id, c_area, c_aisle, c_x, c_y, c_z, c_location_group_name, c_plc_code) VALUES
('CONG-D01-01', 'CONGELADOS', 'D01', 1, 1, 1, 'CONGELADOS', 'CD1'),
('CONG-D01-02', 'CONGELADOS', 'D01', 1, 2, 1, 'CONGELADOS', 'CD2'),
('CONG-D02-01', 'CONGELADOS', 'D02', 2, 1, 1, 'CONGELADOS', 'CD3');

-- Cleaning Products (Productos de Limpieza)
INSERT INTO OWMS_LOCATION (c_location_id, c_area, c_aisle, c_x, c_y, c_z, c_location_group_name, c_plc_code) VALUES
('LIM-E01-01', 'LIMPIEZA', 'E01', 1, 1, 1, 'LIMPIEZA', 'LE1'),
('LIM-E01-02', 'LIMPIEZA', 'E01', 1, 2, 1, 'LIMPIEZA', 'LE2'),
('LIM-E02-01', 'LIMPIEZA', 'E02', 2, 1, 1, 'LIMPIEZA', 'LE3');

-- Personal Care (Cuidado Personal)
INSERT INTO OWMS_LOCATION (c_location_id, c_area, c_aisle, c_x, c_y, c_z, c_location_group_name, c_plc_code) VALUES
('CP-F01-01', 'CUIDADO-PERSONAL', 'F01', 1, 1, 1, 'CUIDADO-PERSONAL', 'CF1'),
('CP-F01-02', 'CUIDADO-PERSONAL', 'F01', 1, 2, 1, 'CUIDADO-PERSONAL', 'CF2'),
('CP-F02-01', 'CUIDADO-PERSONAL', 'F02', 2, 1, 1, 'CUIDADO-PERSONAL', 'CF3');

-- Picking Stations
INSERT INTO OWMS_LOCATION (c_location_id, c_area, c_aisle, c_x, c_y, c_z, c_location_group_name, c_plc_code) VALUES
('PICK-01', 'PICKING', 'P01', 1, 1, 0, 'PICKING', 'P01'),
('PICK-02', 'PICKING', 'P02', 2, 1, 0, 'PICKING', 'P02'),
('PICK-03', 'PICKING', 'P03', 3, 1, 0, 'PICKING', 'P03'),
('PICK-04', 'PICKING', 'P04', 4, 1, 0, 'PICKING', 'P04');

-- Shipping Area
INSERT INTO OWMS_LOCATION (c_location_id, c_area, c_aisle, c_x, c_y, c_z, c_location_group_name, c_plc_code) VALUES
('DESP-01', 'DESPACHO', 'D01', 1, 1, 0, 'DESPACHO', 'DS1'),
('DESP-02', 'DESPACHO', 'D02', 2, 1, 0, 'DESPACHO', 'DS2'),
('DESP-03', 'DESPACHO', 'D03', 3, 1, 0, 'DESPACHO', 'DS3'),
('DESP-04', 'DESPACHO', 'D04', 4, 1, 0, 'DESPACHO', 'DS4');

-- Transport Unit Types for different product categories
INSERT INTO OWMS_TRANSPORT_UNIT_TYPE (c_name, c_description, c_length, c_width, c_height, c_weight_max) VALUES
('PALLET-STD', 'Estiba Estándar 120x100cm', 120, 100, 150, 1500),
('PALLET-EUR', 'Europaleta 120x80cm', 120, 80, 150, 1200),
('CANASTA-PLASTICA', 'Canasta Plástica Reutilizable', 60, 40, 30, 25),
('CAJA-CARTON', 'Caja de Cartón Mediana', 50, 35, 25, 20),
('CONTENEDOR-FRIO', 'Contenedor Refrigerado', 120, 100, 150, 1000);

-- Sample Transport Units with realistic Colombian product barcodes
INSERT INTO OWMS_TRANSPORT_UNIT (c_barcode, c_transport_unit_type, c_actual_location, c_target_location) VALUES
-- Dry goods pallets
('PAL-7701234567890', 'PALLET-STD', 'SEC-A01-01', 'SEC-A01-01'),  -- Arroz Diana
('PAL-7702345678901', 'PALLET-STD', 'SEC-A01-02', 'SEC-A01-02'),  -- Aceite Gourmet
('PAL-7703456789012', 'PALLET-EUR', 'SEC-A02-01', 'SEC-A02-01'),  -- Pasta Doria
('PAL-7704567890123', 'PALLET-STD', 'SEC-B01-01', 'SEC-B01-01'),  -- Azúcar Manuelita

-- Refrigerated products
('REF-7705678901234', 'CONTENEDOR-FRIO', 'REF-C01-01', 'REF-C01-01'),  -- Yogurt Alpina
('REF-7706789012345', 'CONTENEDOR-FRIO', 'REF-C01-02', 'REF-C01-02'),  -- Queso Colanta
('REF-7707890123456', 'CONTENEDOR-FRIO', 'REF-C02-01', 'REF-C02-01'),  -- Jamón Zenú

-- Frozen products
('CONG-7708901234567', 'CONTENEDOR-FRIO', 'CONG-D01-01', 'CONG-D01-01'),  -- Pollo Campollo
('CONG-7709012345678', 'CONTENEDOR-FRIO', 'CONG-D01-02', 'CONG-D01-02'),  -- Helado Popsy

-- Cleaning products
('LIM-7710123456789', 'PALLET-EUR', 'LIM-E01-01', 'LIM-E01-01'),  -- Detergente Ariel
('LIM-7711234567890', 'PALLET-EUR', 'LIM-E01-02', 'LIM-E01-02'),  -- Suavizante Suavitel
('LIM-7712345678901', 'CAJA-CARTON', 'LIM-E02-01', 'LIM-E02-01'),  -- Jabón Rey

-- Personal care products
('CP-7713456789012', 'CANASTA-PLASTICA', 'CP-F01-01', 'CP-F01-01'),  -- Colgate Total
('CP-7714567890123', 'CANASTA-PLASTICA', 'CP-F01-02', 'CP-F01-02'),  -- Shampoo Head & Shoulders
('CP-7715678901234', 'CAJA-CARTON', 'CP-F02-01', 'CP-F02-01');       -- Jabón Protex

-- Sample Transport Orders for typical supermarket distribution
INSERT INTO OWMS_TRANSPORT_ORDER (c_transport_order_number, c_barcode, c_source_location, c_target_location, c_priority, c_state) VALUES
-- Orders to Éxito Medellín Centro
('TO-EXITO-001', 'PAL-7701234567890', 'SEC-A01-01', 'PICK-01', 50, 'INITIALIZED'),
('TO-EXITO-002', 'REF-7705678901234', 'REF-C01-01', 'PICK-01', 80, 'INITIALIZED'),
('TO-EXITO-003', 'LIM-7710123456789', 'LIM-E01-01', 'PICK-01', 30, 'INITIALIZED'),

-- Orders to Olímpica El Poblado  
('TO-OLIMPICA-001', 'PAL-7702345678901', 'SEC-A01-02', 'PICK-02', 60, 'INITIALIZED'),
('TO-OLIMPICA-002', 'CP-7713456789012', 'CP-F01-01', 'PICK-02', 40, 'INITIALIZED'),
('TO-OLIMPICA-003', 'CONG-7708901234567', 'CONG-D01-01', 'PICK-02', 90, 'INITIALIZED'),

-- Orders to Carulla Laureles
('TO-CARULLA-001', 'PAL-7703456789012', 'SEC-A02-01', 'PICK-03', 55, 'INITIALIZED'),
('TO-CARULLA-002', 'REF-7706789012345', 'REF-C01-02', 'PICK-03', 75, 'INITIALIZED'),

-- Orders to D1 Bello
('TO-D1-001', 'LIM-7711234567890', 'LIM-E01-02', 'PICK-04', 45, 'INITIALIZED'),
('TO-D1-002', 'CP-7714567890123', 'CP-F01-02', 'PICK-04', 35, 'INITIALIZED');

-- Product Information (for reference)
INSERT INTO OWMS_PRODUCT (c_sku, c_description, c_category, c_supplier) VALUES
('7701234567890', 'Arroz Diana Extra 5kg', 'GRANOS', 'Molinos Roa S.A.'),
('7702345678901', 'Aceite Gourmet 1L', 'ACEITES', 'Team Foods'),
('7703456789012', 'Pasta Doria Espagueti 500g', 'PASTAS', 'Grupo Nutresa'),
('7704567890123', 'Azúcar Manuelita 2kg', 'ENDULZANTES', 'Manuelita S.A.'),
('7705678901234', 'Yogurt Alpina Griego 150g', 'LACTEOS', 'Alpina Productos Alimenticios'),
('7706789012345', 'Queso Colanta Campesino 500g', 'LACTEOS', 'Cooperativa Colanta'),
('7707890123456', 'Jamón Zenú Premium 250g', 'EMBUTIDOS', 'Grupo Nutresa'),
('7708901234567', 'Pollo Campollo Entero', 'CARNICOS', 'Campollo'),
('7709012345678', 'Helado Popsy Vainilla 1L', 'CONGELADOS', 'Meals de Colombia'),
('7710123456789', 'Detergente Ariel 2kg', 'LIMPIEZA', 'Procter & Gamble'),
('7711234567890', 'Suavizante Suavitel 1.8L', 'LIMPIEZA', 'Colgate-Palmolive'),
('7712345678901', 'Jabón Rey Azul 300g', 'LIMPIEZA', 'Unilever'),
('7713456789012', 'Colgate Total 150ml', 'CUIDADO-PERSONAL', 'Colgate-Palmolive'),
('7714567890123', 'Shampoo Head & Shoulders 375ml', 'CUIDADO-PERSONAL', 'Procter & Gamble'),
('7715678901234', 'Jabón Protex Antibacterial 110g', 'CUIDADO-PERSONAL', 'Colgate-Palmolive');

-- Supermarket Customers (Clientes)
INSERT INTO OWMS_CUSTOMER (c_customer_code, c_customer_name, c_address, c_city, c_phone) VALUES
('EXITO-001', 'Almacenes Éxito - Centro Medellín', 'Cra. 46 #52-02', 'Medellín', '+57 4 3216500'),
('OLIMPICA-001', 'Olímpica El Poblado', 'Cra. 43A #16-15', 'Medellín', '+57 4 2684000'),
('CARULLA-001', 'Carulla Laureles', 'Cra. 75 #36-127', 'Medellín', '+57 4 4441234'),
('D1-001', 'Tienda D1 Bello Centro', 'Calle 51 #50-35', 'Bello', '+57 4 4772020'),
('JUMBO-001', 'Jumbo Envigado', 'Cra. 48 #32B Sur-139', 'Envigado', '+57 4 3391000');

COMMIT; 