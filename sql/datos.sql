#GIULIA GIACOMODONATO
#TOMÁS KRECZMER

USE banco;

/*
CIUDADES-------------------------------------------------------------------------------------------------------
*/

INSERT INTO ciudad VALUES(1001, "Buenos Aires");
INSERT INTO ciudad VALUES(1002, "Córdoba");
INSERT INTO ciudad VALUES(1003, "Rosario");
INSERT INTO ciudad VALUES(1004, "Mendoza");
INSERT INTO ciudad VALUES(1005, "La Plata");
INSERT INTO ciudad VALUES(1006, "San Miguel de Tucumán");
INSERT INTO ciudad VALUES(1007, "Salta");
INSERT INTO ciudad VALUES(1008, "Santa Fe");
INSERT INTO ciudad VALUES(1009, "Neuquén");
INSERT INTO ciudad VALUES(1010, "San Juan");
INSERT INTO ciudad VALUES(1011, "San Luis");
INSERT INTO ciudad VALUES(1012, "Posadas");
INSERT INTO ciudad VALUES(1013, "Mar del Plata");
INSERT INTO ciudad VALUES(1014, "Bahía Blanca");
INSERT INTO ciudad VALUES(1015, "Resistencia");
INSERT INTO ciudad VALUES(1016, "Formosa");
INSERT INTO ciudad VALUES(1017, "Jujuy");
INSERT INTO ciudad VALUES(1018, "Río Cuarto");
INSERT INTO ciudad VALUES(1019, "Gualeguaychú");
INSERT INTO ciudad VALUES(1020, "Catamarca");

/*
SUCURSALES-------------------------------------------------------------------------------------------------------
*/

INSERT INTO sucursal VALUES(NULL,"Banco Nova Capital","Martinez 42","3401234567","09 Am - 06 Pm",1001);
INSERT INTO sucursal VALUES(NULL,"Banca Soluciones","Calle Pionera 88","3412345678","10 Am - 07 Pm",1002); 
INSERT INTO sucursal VALUES(NULL,"Banco Rendimiento","Camino 77","3423456789","08 Am - 05 Pm",1003); 
INSERT INTO sucursal VALUES(NULL,"Banco Centro","Boulevard 123","3434567890","11 Am - 08 Pm",1004); 
INSERT INTO sucursal VALUES(NULL,"Banca Empresas","Cresta 54","3445678901","09 Am - 06 Pm",1005);
INSERT INTO sucursal VALUES(NULL,"Banco Horizon","Altitud 91","3456789012","10 Am - 07 Pm",1006);
INSERT INTO sucursal VALUES(NULL,"Banco Futuro","Eclipse 62","3467890123","08 Am - 05 Pm",1007);
INSERT INTO sucursal VALUES(NULL,"Banco Innova","Ruta 14","3478901234","12 Pm - 09 Pm",1008);
INSERT INTO sucursal VALUES(NULL,"Banco Galaxia","Orión 85","3489012345","10 Am - 07 Pm",1009);
INSERT INTO sucursal VALUES(NULL,"Banco Infinito","Estratos 19","3490123456","09 Am - 06 Pm",1010);
INSERT INTO sucursal VALUES(NULL,"Banco Nova","Horizonte 28","3501234567","08 Am - 05 Pm",1011); 
INSERT INTO sucursal VALUES(NULL,"Banco Estelar","Celestial 37","3512345678","11 Am - 08 Pm",1012);
INSERT INTO sucursal VALUES(NULL,"Banco Nebulosa","Calle 91","3523456789","10 Am - 07 Pm",1013);
INSERT INTO sucursal VALUES(NULL,"Banco Orión","Ruta 04","3534567890","09 Am - 06 Pm",1014); 
INSERT INTO sucursal VALUES(NULL,"Banco Solar","Boulevard 12","3545678901","08 Am - 05 Pm",1015);
INSERT INTO sucursal VALUES(NULL,"Banco Lunar","Lunar 63","3556789012","10 Am - 07 Pm",1016);
INSERT INTO sucursal VALUES(NULL,"Banco Meteorito","Meteorito 82","3567890123","11 Am - 08 Pm",1017); 
INSERT INTO sucursal VALUES(NULL,"Banco Astral","Astral 57","3578901234","09 Am - 06 Pm",1018); 
INSERT INTO sucursal VALUES(NULL,"Banco Eclipse","Eclipse 22","3589012345","08 Am - 05 Pm",1019); 
INSERT INTO sucursal VALUES(NULL,"Banco Órbita","Orbita 39","3590123456","12 Pm - 09 Pm",1020); 

/*
EMPLEADOS-------------------------------------------------------------------------------------------------------
*/

INSERT INTO empleado VALUES(NULL,"Martínez","José","DNI",12345678,"Central 45","295123456","Atención al cliente",md5("pwdEmp01"),1);
INSERT INTO empleado VALUES(NULL,"González","Ana","DNI",12345679,"Sol 23","295234567","Atención al cliente",md5("pwdEmp02"),2);
INSERT INTO empleado VALUES(NULL,"Fernández","Luis","DNI",12345680,"Libertad 78","295345678","Atención al cliente",md5("pwdEmp03"),3);
INSERT INTO empleado VALUES(NULL,"Pérez","Marta","DNI",12345681,"25 de Mayo 12","295456789","Atención al cliente",md5("pwdEmp04"),4);
INSERT INTO empleado VALUES(NULL,"Rodríguez","Carlos","DNI",12345682,"San Martín 34","295567890","Atención al cliente",md5("pwdEmp05"),5);
INSERT INTO empleado VALUES(NULL,"López","Patricia","DNI",12345683,"San Juan 56","295678901","Atención al cliente",md5("pwdEmp06"),6);
INSERT INTO empleado VALUES(NULL,"Martínez","Raúl","DNI",12345684,"Rivadavia 67","295789012","Atención al cliente",md5("pwdEmp07"),7);
INSERT INTO empleado VALUES(NULL,"Morales","Sofía","DNI",12345685,"Buenos Aires 89","295890123","Atención al cliente",md5("pwdEmp08"),8);
INSERT INTO empleado VALUES(NULL,"Castro","Alejandro","DNI",12345686,"Córdoba 45","295901234","Atención al cliente",md5("pwdEmp09"),9);
INSERT INTO empleado VALUES(NULL,"Ríos","Valeria","DNI",12345687,"Belgrano 23","296012345","Atención al cliente",md5("pwdEmp10"),10);
INSERT INTO empleado VALUES(NULL,"García","Ricardo","DNI",12345688,"Santa Fe 67","296123456","Atención al cliente",md5("pwdEmp11"),11);
INSERT INTO empleado VALUES(NULL,"Vázquez","Laura","DNI",12345689,"Mendoza 34","296234567","Atención al cliente",md5("pwdEmp12"),12);
INSERT INTO empleado VALUES(NULL,"Jiménez","Eugenia","DNI",12345690,"San Luis 12","296345678","Atención al cliente",md5("pwdEmp13"),13);
INSERT INTO empleado VALUES(NULL,"Pardo","Fernando","DNI",12345691,"Avenida Salta 89","296456789","Atención al cliente",md5("pwdEmp14"),014);
INSERT INTO empleado VALUES(NULL,"Ortega","Gabriela","DNI",12345692,"Tucumán 56","296567890","Atención al cliente",md5("pwdEmp15"),015);
INSERT INTO empleado VALUES(NULL,"Castillo","Javier","DNI",12345693,"Avenida San Juan 23","296678901","Atención al cliente",md5("pwdEmp16"),016);
INSERT INTO empleado VALUES(NULL,"Cano","Elena","DNI",12345694,"Fernando 78","296789012","Atención al cliente",md5("pwdEmp17"),017);
INSERT INTO empleado VALUES(NULL,"Méndez","Santiago","DNI",12345695,"Resistencia 34","296890123","Atención al cliente",md5("pwdEmp18"),018);
INSERT INTO empleado VALUES(NULL,"Rivas","Isabel","DNI",12345696,"Río Cuarto 45","297012345","Atención al cliente",md5("pwdEmp19"),019);
INSERT INTO empleado VALUES(NULL,"Serrano","Tomás","DNI",12345697,"La Plata 56","297123456","Atención al cliente",md5("pwdEmp20"),020);
INSERT INTO empleado VALUES(NULL,"Alvarez","Carla","DNI",12345698,"Bahía Blanca 23","297234567","Atención al cliente",md5("pwdEmp21"),001);
INSERT INTO empleado VALUES(NULL,"Bravo","Luis","DNI",12345699,"Neuquén 89","297345678","Atención al cliente",md5("pwdEmp22"),002);
INSERT INTO empleado VALUES(NULL,"Cardozo","Verónica","DNI",12345700,"Mendoza 56","297456789","Atención al cliente",md5("pwdEmp23"),003);
INSERT INTO empleado VALUES(NULL,"Bermúdez","Pablo","DNI",12345701,"Mar del Plata 34","297567890","Atención al cliente",md5("pwdEmp24"),004);
INSERT INTO empleado VALUES(NULL,"Silva","Mariana","DNI",12345702,"Córdoba 78","297678901","Atención al cliente",md5("pwdEmp25"),005);
INSERT INTO empleado VALUES(NULL,"Figueroa","Ricardo","DNI",12345703,"San Martín 23","297789012","Atención al cliente",md5("pwdEmp26"),006);
INSERT INTO empleado VALUES(NULL,"Vallejo","Andrea","DNI",12345704,"La Plata 45","297890123","Atención al cliente",md5("pwdEmp27"),007);
INSERT INTO empleado VALUES(NULL,"Díaz","Jorge","DNI",12345705,"Buenos Aires 56","297901234","Atención al cliente",md5("pwdEmp28"),008);
INSERT INTO empleado VALUES(NULL,"López","Pedro","DNI",12345706,"San Juan 34","298012345","Atención al cliente",md5("pwdEmp29"),009);
INSERT INTO empleado VALUES(NULL,"Zapata","Lorena","DNI",12345707,"Avenida Salta 89","298123456","Atención al cliente",md5("pwdEmp30"),010);
INSERT INTO empleado VALUES(NULL,"Gómez","Rodrigo","DNI",12345708,"Resistencia 56","298234567","Atención al cliente",md5("pwdEmp31"),011);
INSERT INTO empleado VALUES(NULL,"Torres","Natalia","DNI",12345709,"Tucumán 23","298345678","Atención al cliente",md5("pwdEmp32"),012);
INSERT INTO empleado VALUES(NULL,"Ruiz","Guillermo","DNI",12345710,"San Luis 45","298456789","Atención al cliente",md5("pwdEmp33"),013);
INSERT INTO empleado VALUES(NULL,"Ponce","Valentina","DNI",12345711,"Buenos Aires 56","298567890","Atención al cliente",md5("pwdEmp34"),014);
INSERT INTO empleado VALUES(NULL,"Vega","Ezequiel","DNI",12345712,"La Plata 34","298678901","Atención al cliente",md5("pwdEmp35"),015);
INSERT INTO empleado VALUES(NULL,"Cruz","Gabriel","DNI",12345713,"Río Cuarto 23","298789012","Atención al cliente",md5("pwdEmp36"),016);
INSERT INTO empleado VALUES(NULL,"Mora","Claudia","DNI",12345714,"Bahía Blanca 45","298890123","Atención al cliente",md5("pwdEmp37"),017);
INSERT INTO empleado VALUES(NULL,"Hernández","Ricardo","DNI",12345715,"Avenida Neuquén 56","298901234","Atención al cliente",md5("pwdEmp38"),018);
INSERT INTO empleado VALUES(NULL,"Sosa","Ana María","DNI",12345716,"Mendoza 34","299012345","Atención al cliente",md5("pwdEmp39"),019);
INSERT INTO empleado VALUES(NULL,"Luna","Marcos","DNI",12345717,"Mar del Plata 89","299123456","Atención al cliente",md5("pwdEmp40"),020);

/*
CLIENTES-------------------------------------------------------------------------------------------------------
*/

INSERT INTO cliente VALUES(NULL,"García","Juan","DNI",98726738,"Av. Libertador 1234","296757657",str_to_date('15/11/1942', '%d/%m/%Y'));
INSERT INTO cliente VALUES(NULL,"Pérez","Ana","DNI",98723438,"San Martín 567","296723657",str_to_date('18/05/1990', '%d/%m/%Y'));
INSERT INTO cliente VALUES(NULL,"Gómez","Luis","DNI",98723438,"San Martín 567","296723657",str_to_date('18/05/1990', '%d/%m/%Y'));
INSERT INTO cliente VALUES(NULL,"Ruiz","Carlos","DNI",00000001,"Independencia 890","324324324",str_to_date('20/06/1991', '%d/%m/%Y'));
INSERT INTO cliente VALUES(NULL,"Molina","Álvaro","DNI",00000002,"Libertad 234","324324324",str_to_date('20/06/1991', '%d/%m/%Y'));
INSERT INTO cliente VALUES(NULL,"Morales","Aaron","DNI",00000003,"Soler 456","324324324",str_to_date('22/06/1991', '%d/%m/%Y'));
INSERT INTO cliente VALUES(NULL,"Paredes","Abraham","DNI",00000004,"Av. Belgrano 789","324324324",str_to_date('23/06/1991', '%d/%m/%Y'));
INSERT INTO cliente VALUES(NULL,"Cordero","David","DNI",00000005,"Salle Rivadavia 345","324324324",str_to_date('24/06/1991', '%d/%m/%Y'));
INSERT INTO cliente VALUES(NULL,"Benítez","Carla","DNI",00000006,"Av. San Juan 567","324324324",str_to_date('25/06/1991', '%d/%m/%Y'));
INSERT INTO cliente VALUES(NULL,"Navarro","Gabriel","DNI",00000007,"Tucumán 678","324324324",str_to_date('26/06/1991', '%d/%m/%Y'));
INSERT INTO cliente VALUES(NULL,"González","Paola","DNI",00000008,"Av. Córdoba 789","324324324",str_to_date('27/06/1991', '%d/%m/%Y'));
INSERT INTO cliente VALUES(NULL,"Márquez","Esteban","DNI",00000009,"Montevideo 890","324324324",str_to_date('28/06/1991', '%d/%m/%Y'));
INSERT INTO cliente VALUES(NULL,"Sosa","Laura","DNI",00000091,"Brasil 123","324324324",str_to_date('29/06/1991', '%d/%m/%Y'));
INSERT INTO cliente VALUES(NULL,"Vargas","Martín","DNI",00000081,"Av. Belgrano 234","324324324",str_to_date('20/01/1991', '%d/%m/%Y'));
INSERT INTO cliente VALUES(NULL,"Cruz","Pedro","DNI",00000071,"Santa Fe 345","324324324",str_to_date('20/02/1991', '%d/%m/%Y'));
INSERT INTO cliente VALUES(NULL,"Ramírez","Ana","DNI",00000061,"Av. Rivadavia 456","324324324",str_to_date('20/03/1991', '%d/%m/%Y'));
INSERT INTO cliente VALUES(NULL,"Silva","Luis","DNI",00000051,"Jujuy 567","324324324",str_to_date('20/04/1991', '%d/%m/%Y'));
INSERT INTO cliente VALUES(NULL,"Pérez","Ricardo","DNI",00000041,"Av. Santa Fe 678","324324324",str_to_date('20/05/1991', '%d/%m/%Y'));
INSERT INTO cliente VALUES(NULL,"Gutiérrez","María","DNI",00000031,"San Luis 789","324324324",str_to_date('20/06/1991', '%d/%m/%Y'));
INSERT INTO cliente VALUES(NULL,"Torres","José","DNI",00000021,"Entre Ríos 890","324324324",str_to_date('20/07/1991', '%d/%m/%Y'));
INSERT INTO cliente VALUES(NULL,"Lopez","Ricardo","DNI",00000011,"Av. Córdoba 123","324324324",str_to_date('20/08/1991', '%d/%m/%Y'));
INSERT INTO cliente VALUES(NULL,"Flores","Mónica","DNI",00000101,"San Martín 234","324324324",str_to_date('20/09/1991', '%d/%m/%Y'));
INSERT INTO cliente VALUES(NULL,"Hernández","Javier","DNI",00000201,"Av. Belgrano 345","324324324",str_to_date('20/10/1991', '%d/%m/%Y'));
INSERT INTO cliente VALUES(NULL,"Romero","Elena","DNI",00000301,"Libertad 456","324324324",str_to_date('20/11/1991', '%d/%m/%Y'));
INSERT INTO cliente VALUES(NULL,"Sánchez","Nicolás","DNI",00000401,"Av. San Juan 567","324324324",str_to_date('20/12/1991', '%d/%m/%Y'));
INSERT INTO cliente VALUES(NULL,"Moreno","Marta","DNI",00000501,"Montevideo 678","324324324",str_to_date('20/06/1992', '%d/%m/%Y'));
INSERT INTO cliente VALUES(NULL,"Vásquez","Antonio","DNI",00000601,"Av. Rivadavia 789","324324324",str_to_date('20/06/1993', '%d/%m/%Y'));
INSERT INTO cliente VALUES(NULL,"Guerrero","Rosa","DNI",00000701,"Tucumán 890","324324324",str_to_date('20/06/1994', '%d/%m/%Y'));
INSERT INTO cliente VALUES(NULL,"Méndez","Fernando","DNI",00000801,"Av. Córdoba 123","324324324",str_to_date('20/06/1995', '%d/%m/%Y'));
INSERT INTO cliente VALUES(NULL,"González","Alejandra","DNI",00000901,"Santa Fe 234","324324324",str_to_date('20/06/1996', '%d/%m/%Y'));
INSERT INTO cliente VALUES(NULL,"Serrano","Luis","DNI",00008001,"Av. Belgrano 345","324324324",str_to_date('20/06/1997', '%d/%m/%Y'));
INSERT INTO cliente VALUES(NULL,"García","Valeria","DNI",00009001,"San Martín 456","324324324",str_to_date('20/06/1998', '%d/%m/%Y'));
INSERT INTO cliente VALUES(NULL,"Molina","Héctor","DNI",00007001,"Av. Rivadavia 567","324324324",str_to_date('20/06/1999', '%d/%m/%Y'));
INSERT INTO cliente VALUES(NULL,"Fernández","Natalia","DNI",00006001,"Tucumán 678","324324324",str_to_date('20/06/2000', '%d/%m/%Y'));
INSERT INTO cliente VALUES(NULL,"Benítez","Eduardo","DNI",00005001,"Av. San Juan 789","324324324",str_to_date('20/06/2001', '%d/%m/%Y'));
INSERT INTO cliente VALUES(NULL,"Gómez","Sonia","DNI",00004001,"CLibertad 890","324324324",str_to_date('20/06/2002', '%d/%m/%Y'));
INSERT INTO cliente VALUES(NULL,"García","Tomás","DNI",00003001,"Av. Córdoba 123","324324324",str_to_date('20/06/2003', '%d/%m/%Y'));
INSERT INTO cliente VALUES(NULL,"Lopez","Pablo","DNI",00002001,"Santa Fe 234","324324324",str_to_date('20/06/2004', '%d/%m/%Y'));
INSERT INTO cliente VALUES(NULL,"Méndez","Rafael","DNI",00001001,"Av. Belgrano 345","324324324",str_to_date('20/06/2005', '%d/%m/%Y'));
INSERT INTO cliente VALUES(NULL,"Ramos","Laura","DNI",00010001,"Rivadavia 456","324324324",str_to_date('20/06/1981', '%d/%m/%Y'));
INSERT INTO cliente VALUES(NULL,"Muñoz","Silvia","DNI",00020001,"Av. San Juan 567","324324324",str_to_date('01/01/1991', '%d/%m/%Y'));
INSERT INTO cliente VALUES(NULL,"Martínez","Germán","DNI",00030001,"Tucumán 678","324324324",str_to_date('20/06/1991', '%d/%m/%Y'));
INSERT INTO cliente VALUES(NULL,"Alvarez","Silvia","DNI",00040001,"Av. Córdoba 789","324324324",str_to_date('20/06/1991', '%d/%m/%Y'));
INSERT INTO cliente VALUES(NULL,"Moreno","Fernando","DNI",00050001,"Santa Fe 890","324324324",str_to_date('20/06/1991', '%d/%m/%Y'));
INSERT INTO cliente VALUES(NULL,"Gómez","Verónica","DNI",00060001,"Av. Belgrano 123","324324324",str_to_date('20/06/1991', '%d/%m/%Y'));
INSERT INTO cliente VALUES(NULL,"Muñoz","Jorge","DNI",00070001,"Rivadavia 234","324324324",str_to_date('20/06/1991', '%d/%m/%Y'));
INSERT INTO cliente VALUES(NULL,"Díaz","Luis","DNI",00080001,"Av. San Juan 345","324324324",str_to_date('20/06/1991', '%d/%m/%Y'));
INSERT INTO cliente VALUES(NULL,"Pérez","Camila","DNI",00090001,"Tucumán 456","324324324",str_to_date('20/06/1991', '%d/%m/%Y'));
INSERT INTO cliente VALUES(NULL,"Arias","Mariana","DNI",00800001,"Av. Córdoba 567","324324324",str_to_date('20/06/1991', '%d/%m/%Y'));
INSERT INTO cliente VALUES(NULL,"Castro","Nayeli","DNI",00600001,"Santa Fe 678","324324324",str_to_date('20/06/1991', '%d/%m/%Y'));
INSERT INTO cliente VALUES(NULL,"Vázquez","Natalia","DNI",00700001,"Av. Belgrano 789","324324324",str_to_date('20/06/1991', '%d/%m/%Y'));
INSERT INTO cliente VALUES(NULL,"Valdez","Omar","DNI",00500001,"Rivadavia 890","324324324",str_to_date('20/06/1991', '%d/%m/%Y'));
INSERT INTO cliente VALUES(NULL,"García","Odette","DNI",00400001,"Av. San Juan 123","324324324",str_to_date('20/07/1993', '%d/%m/%Y'));
INSERT INTO cliente VALUES(NULL,"Ortiz","Omar","DNI",00300001,"Tucumán 234","324324324",str_to_date('21/06/1992', '%d/%m/%Y'));
INSERT INTO cliente VALUES(NULL,"Mendoza","Judith","DNI",00200001,"Av. Córdoba 345","324324324",str_to_date('20/06/1992', '%d/%m/%Y'));
INSERT INTO cliente VALUES(NULL,"Escobar","Johana","DNI",00100001,"Santa Fe 456","324324324",str_to_date('01/06/1991', '%d/%m/%Y'));
INSERT INTO cliente VALUES(NULL,"Bravo","Jazmín","DNI",01000001,"Av. Belgrano 567","324324324",str_to_date('02/06/1991', '%d/%m/%Y'));
INSERT INTO cliente VALUES(NULL,"Sánchez","Jennifer","DNI",02000001,"Rivadavia 678","324324324",str_to_date('03/06/1991', '%d/%m/%Y'));
INSERT INTO cliente VALUES(NULL,"Cano","Jeziel","DNI",43000001,"Av. San Juan 789","324324324",str_to_date('04/06/1991', '%d/%m/%Y'));
INSERT INTO cliente VALUES(NULL,"Flores","Jibril","DNI",04000001,"Tucumán 890","324324324",str_to_date('20/06/1991', '%d/%m/%Y'));
INSERT INTO cliente VALUES(NULL,"Bravo","Jilian Kiu","DNI",05000001,"Av. Córdoba 123","324324324",str_to_date('05/06/1991', '%d/%m/%Y'));
INSERT INTO cliente VALUES(NULL,"García","Josemir","DNI",06000001,"Santa Fe 234","324324324",str_to_date('06/06/1991', '%d/%m/%Y'));
INSERT INTO cliente VALUES(NULL,"Ramírez","Joseph","DNI",07000001,"Av. Belgrano 345","324324324",str_to_date('20/06/1991', '%d/%m/%Y'));
INSERT INTO cliente VALUES(NULL,"Hernández","Josephine","DNI",08000001,"Rivadavia 456","324324324",str_to_date('20/06/1991', '%d/%m/%Y'));
INSERT INTO cliente VALUES(NULL,"Cruz","Juno","DNI",09000001,"Av. San Juan 567","324324324",str_to_date('20/06/1991', '%d/%m/%Y'));
INSERT INTO cliente VALUES(NULL,"Vega","Junior","DNI",05060701,"Tucumán 678","324324324",str_to_date('20/06/1991', '%d/%m/%Y'));
INSERT INTO cliente VALUES(NULL,"Sosa","Laura","Pasaporte",00000091,"Av. Belgrano 678","324324324",str_to_date('29/06/1991', '%d/%m/%Y'));
INSERT INTO cliente VALUES(NULL,"Benítez","Carla","Pasaporte",00000081,"Santa Fe 789","324324324",str_to_date('20/01/1991', '%d/%m/%Y'));
INSERT INTO cliente VALUES(NULL,"Ramírez","Luis","Visa_t",00000071,"Av. San Juan 890","324324324",str_to_date('20/02/1991', '%d/%m/%Y'));


/*
PLAZOS FIJOS-------------------------------------------------------------------------------------------------------
*/

INSERT INTO plazo_fijo VALUES(NULL, 10000.20, "2010-01-01", "2021-01-01", 10.25, 10.25, 001);
INSERT INTO plazo_fijo VALUES(NULL, 120000.21, "2010-02-01", "2022-08-01", 19.25, 10.25, 002);
INSERT INTO plazo_fijo VALUES(NULL, 130000.22, "2010-03-01", "2023-10-01", 15.25, 10.25, 003);
INSERT INTO plazo_fijo VALUES(NULL, 140000.78, "2010-04-01", "2024-11-01", 10.25, 10.25, 004);
INSERT INTO plazo_fijo VALUES(NULL, 150000.90, "2010-05-01", "2025-12-01", 45.25, 10.25, 005);
INSERT INTO plazo_fijo VALUES(NULL, 160000.00, "2010-06-01", "2026-02-01", 10.55, 10.25, 006);
INSERT INTO plazo_fijo VALUES(NULL, 170000.00, "2010-07-01", "2027-03-01", 15.25, 10.25, 007);
INSERT INTO plazo_fijo VALUES(NULL, 180000.00, "2010-08-01", "2028-04-01", 54.25, 10.25, 008);
INSERT INTO plazo_fijo VALUES(NULL, 190000.00, "2010-09-01", "2029-05-01", 13.25, 10.25, 009);
INSERT INTO plazo_fijo VALUES(NULL, 1990000.00, "2010-10-01", "2030-06-01", 65.25, 10.25, 010);
INSERT INTO plazo_fijo VALUES(NULL, 1880000.00, "2010-11-01", "2031-07-01", 16.25, 10.25, 011);
INSERT INTO plazo_fijo VALUES(NULL, 1770000.00, "2010-12-01", "2032-08-01", 04.25, 10.25, 012);
INSERT INTO plazo_fijo VALUES(NULL, 1660000.00, "2010-12-01", "2033-09-01", 16.25, 10.25, 013);
INSERT INTO plazo_fijo VALUES(NULL, 1550000.34, "2011-01-01", "2034-10-01", 05.25, 10.25, 014);
INSERT INTO plazo_fijo VALUES(NULL, 1440000.14, "2012-02-01", "2035-11-01", 10.25, 10.25, 015);
INSERT INTO plazo_fijo VALUES(NULL, 1330000.24, "2013-01-01", "2036-12-01", 13.25, 10.25, 016);
INSERT INTO plazo_fijo VALUES(NULL, 1220000.52, "2014-01-01", "2037-01-01", 1.25, 10.25, 017);
INSERT INTO plazo_fijo VALUES(NULL, 1110000.75, "2015-01-01", "2038-01-01", 1.35, 10.25, 018);
INSERT INTO plazo_fijo VALUES(NULL, 1340000.37, "2016-01-01", "2039-01-01", 1.25, 10.25, 019);
INSERT INTO plazo_fijo VALUES(NULL, 1560000.53, "2017-01-01", "2040-01-01", 10.25, 10.25, 001);
INSERT INTO plazo_fijo VALUES(NULL, 1640000.63, "2018-01-01", "2041-01-01", 14.25, 10.25, 002);
INSERT INTO plazo_fijo VALUES(NULL, 1560000.83, "2019-01-01", "2042-01-01", 10.25, 10.25, 003);
INSERT INTO plazo_fijo VALUES(NULL, 15450000.93, "2020-01-01", "2043-01-01", 12.25, 10.25, 004);
INSERT INTO plazo_fijo VALUES(NULL, 14540000.03, "2001-01-01", "2044-01-01", 0.25, 10.25, 005);
INSERT INTO plazo_fijo VALUES(NULL, 1450000.01, "2002-01-01", "2025-01-01", 10.25, 10.25, 006);
INSERT INTO plazo_fijo VALUES(NULL, 904500.33, "2003-01-01", "2026-01-01", 0.25, 10.25, 007);
INSERT INTO plazo_fijo VALUES(NULL, 1987.53, "2004-01-01", "2027-01-01", 10.25, 10.25, 008);
INSERT INTO plazo_fijo VALUES(NULL, 105465.45, "2005-01-01", "2028-01-01", 10.25, 10.25, 009);
INSERT INTO plazo_fijo VALUES(NULL, 10564.98, "2006-01-01", "2029-01-01", 1.25, 10.25, 010);
INSERT INTO plazo_fijo VALUES(NULL, 10456.99, "2007-01-01", "2030-01-01", 10.25, 10.25, 011);
INSERT INTO plazo_fijo VALUES(NULL, 100890.89, "2008-01-01", "2031-01-01", 10.25, 10.25, 012);
INSERT INTO plazo_fijo VALUES(NULL, 14540000.03, "2001-01-01", "2044-01-01", 1.25, 10.25, 013);
INSERT INTO plazo_fijo VALUES(NULL, 1450000.01, "2002-01-01", "2025-01-01", 10.35, 10.25, 014);
INSERT INTO plazo_fijo VALUES(NULL, 904500.33, "2003-01-01", "2026-01-01", 10.25, 10.25, 015);
INSERT INTO plazo_fijo VALUES(NULL, 1987.53, "2004-01-01", "2027-01-01", 13.25, 10.25, 016);
INSERT INTO plazo_fijo VALUES(NULL, 180000.00, "2010-08-01", "2028-04-01", 45.25, 10.25, 017);
INSERT INTO plazo_fijo VALUES(NULL, 190000.00, "2010-09-01", "2029-05-01", 13.25, 10.25, 018);
INSERT INTO plazo_fijo VALUES(NULL, 1990000.00, "2010-10-01", "2030-06-01", 15.25, 10.25, 019);
INSERT INTO plazo_fijo VALUES(NULL, 1880000.00, "2010-11-01", "2031-07-01", 15.25, 10.25, 020);

/*
TASA_PLAZO_FIJO-------------------------------------------------------------------------------------------------------
*/

INSERT INTO tasa_plazo_fijo VALUES(001,100.00,1000.00,51.00);
INSERT INTO tasa_plazo_fijo VALUES(002,10.00 ,1000.00,52.00);
INSERT INTO tasa_plazo_fijo VALUES(003,10.25 ,1000.00,53.00);
INSERT INTO tasa_plazo_fijo VALUES(004,109.00,1000.10,54.00);
INSERT INTO tasa_plazo_fijo VALUES(005,110.00,1000.20,55.00);
INSERT INTO tasa_plazo_fijo VALUES(006,120.00,1000.30,56.00);
INSERT INTO tasa_plazo_fijo VALUES(007,130.00,1000.40,57.00);
INSERT INTO tasa_plazo_fijo VALUES(008,140.12,1000.50,58.00);
INSERT INTO tasa_plazo_fijo VALUES(009,150.00,1000.60,59.00);
INSERT INTO tasa_plazo_fijo VALUES(010,160.10,1000.70,60.00);
INSERT INTO tasa_plazo_fijo VALUES(011,170.05,1000.80,70.00);
INSERT INTO tasa_plazo_fijo VALUES(021,180.00,1000.90,80.10);
INSERT INTO tasa_plazo_fijo VALUES(031,190.00,1009.10,90.09);
INSERT INTO tasa_plazo_fijo VALUES(041,120.00,1008.00,40.08);
INSERT INTO tasa_plazo_fijo VALUES(051,123.14,1007.00,20.07);
INSERT INTO tasa_plazo_fijo VALUES(061,109.09,1006.00,20.06);
INSERT INTO tasa_plazo_fijo VALUES(071,100.00,1005.00,10.05);
INSERT INTO tasa_plazo_fijo VALUES(081,100.00,1004.00,50.04);
INSERT INTO tasa_plazo_fijo VALUES(091,105.00,1003.00,50.03);
INSERT INTO tasa_plazo_fijo VALUES(171,102.00,1002.00,50.02);
INSERT INTO tasa_plazo_fijo VALUES(991,103.00,1001.00,50.01);

/*
PLAZOS_CLIENTES-------------------------------------------------------------------------------------------------------
*/

INSERT INTO plazo_cliente VALUES (00000001, 00001);
INSERT INTO plazo_cliente VALUES (00000002, 00002);
INSERT INTO plazo_cliente VALUES (00000003, 00003);
INSERT INTO plazo_cliente VALUES (00000004, 00004);
INSERT INTO plazo_cliente VALUES (00000005, 00005);
INSERT INTO plazo_cliente VALUES (00000006, 00006);
INSERT INTO plazo_cliente VALUES (00000007, 00007);
INSERT INTO plazo_cliente VALUES (00000008, 00008);
INSERT INTO plazo_cliente VALUES (00000009, 00009);
INSERT INTO plazo_cliente VALUES (00000010, 00010);
INSERT INTO plazo_cliente VALUES (00000011, 00011);
INSERT INTO plazo_cliente VALUES (00000012, 00012);
INSERT INTO plazo_cliente VALUES (00000013, 00013);
INSERT INTO plazo_cliente VALUES (00000014, 00014);
INSERT INTO plazo_cliente VALUES (00000015, 00015);
INSERT INTO plazo_cliente VALUES (00000016, 00016);
INSERT INTO plazo_cliente VALUES (00000017, 00017);
INSERT INTO plazo_cliente VALUES (00000018, 00018);
INSERT INTO plazo_cliente VALUES (00000019, 00019);
INSERT INTO plazo_cliente VALUES (00000020, 00020);
INSERT INTO plazo_cliente VALUES (00000021, 00005);
INSERT INTO plazo_cliente VALUES (00000022, 00006);
INSERT INTO plazo_cliente VALUES (00000023, 00007);
INSERT INTO plazo_cliente VALUES (00000024, 00008);
INSERT INTO plazo_cliente VALUES (00000025, 00009);
INSERT INTO plazo_cliente VALUES (00000026, 00010);
INSERT INTO plazo_cliente VALUES (00000027, 00011);
INSERT INTO plazo_cliente VALUES (00000028, 00012);
INSERT INTO plazo_cliente VALUES (00000029, 00013);
INSERT INTO plazo_cliente VALUES (00000030, 00014);
INSERT INTO plazo_cliente VALUES (00000031, 00015);
INSERT INTO plazo_cliente VALUES (00000032, 00016);
INSERT INTO plazo_cliente VALUES (00000033, 00017);
INSERT INTO plazo_cliente VALUES (00000034, 00018);
INSERT INTO plazo_cliente VALUES (00000035, 00019);
INSERT INTO plazo_cliente VALUES (00000036, 00020);
INSERT INTO plazo_cliente VALUES (00000037, 00005);
INSERT INTO plazo_cliente VALUES (00000038, 00006);


/*
PRESTAMO-------------------------------------------------------------------------------------------------------
*/

INSERT INTO prestamo VALUES(NULL,"2020/11/01",02,100.05,23.25,10.25,10.25,0031,00039);
INSERT INTO prestamo VALUES(NULL,"2014/11/01",02,100.05,10.25,10.25,10.25,0032,00038);
INSERT INTO prestamo VALUES(NULL,"2014/11/01",02,100.05,4.25,10.25,10.25,0033,00037);
INSERT INTO prestamo VALUES(NULL,"2010/11/01",02,100.05,40.25,10.25,10.25,0034,00036);
INSERT INTO prestamo VALUES(NULL,"2010/11/01",02,100.05,50.25,10.25,10.25,0038,00035);
INSERT INTO prestamo VALUES(NULL,"2010/11/01",02,100.05,12.25,10.25,10.25,0039,00034);
INSERT INTO prestamo VALUES(NULL,"2010/11/01",04,100.05,24.25,10.25,10.25,0010,00024);
INSERT INTO prestamo VALUES(NULL,"2010/11/01",02,100.05,10.25,10.25,10.25,0011,00023);
INSERT INTO prestamo VALUES(NULL,"2010/11/01",04,100.05,82.25,10.25,10.25,0012,00022);
INSERT INTO prestamo VALUES(NULL,"2010/11/01",02,100.05,10.25,10.25,10.25,0013,00021);
INSERT INTO prestamo VALUES(NULL,"2010/11/01",02,100.05,34.25,10.25,10.25,0014,00020);
INSERT INTO prestamo VALUES(NULL,"2010/11/01",02,100.05,8.25,10.25,10.25,0020,00019);
INSERT INTO prestamo VALUES(NULL,"2018/11/01",02,100.05,2.25,10.25,10.25,0003,00018);
INSERT INTO prestamo VALUES(NULL,"2017/11/01",02,100.05,10.25,10.25,10.25,0003,00017);
INSERT INTO prestamo VALUES(NULL,"2016/11/01",02,100.05,5.25,10.25,10.25,0003,00016);
INSERT INTO prestamo VALUES(NULL,"2015/11/01",02,100.05,10.25,10.25,10.25,0005,00015);
INSERT INTO prestamo VALUES(NULL,"2014/11/01",02,100.05,10.25,10.25,10.25,0006,00014);
INSERT INTO prestamo VALUES(NULL,"2013/11/01",02,100.05,10.25,10.25,10.25,0003,00013);
INSERT INTO prestamo VALUES(NULL,"2012/11/01",03,100.05,10.25,10.25,10.25,0003,00012);
INSERT INTO prestamo VALUES(NULL,"2011/11/01",04,100.05,10.25,10.25,10.25,0033,00011);
INSERT INTO prestamo VALUES(NULL,"2010/11/01",02,100.05,10.25,10.25,10.25,0017,00010);
INSERT INTO prestamo VALUES(NULL,"2010/11/01",01,100.05,10.25,10.25,10.25,0003,00009);
INSERT INTO prestamo VALUES(NULL,"2010/11/01",01,100.05,3.25,10.25,10.25,0023,00008);
INSERT INTO prestamo VALUES(NULL,"2019/11/01",05,100.05,2.25,10.25,10.25,0023,00007);
INSERT INTO prestamo VALUES(NULL,"2011/11/01",06,100.05,7.25,10.25,10.25,0023,00006);
INSERT INTO prestamo VALUES(NULL,"2012/11/01",02,100.05,54.25,10.25,10.25,0032,00005);
INSERT INTO prestamo VALUES(NULL,"2017/11/01",06,100.05,10.25,10.25,10.25,0021,00004);
INSERT INTO prestamo VALUES(NULL,"2018/11/01",05,100.05,12.25,10.25,10.25,0004,00003);
INSERT INTO prestamo VALUES(NULL,"2019/11/01",04,100.05,11.25,10.25,10.25,0021,00002);
INSERT INTO prestamo VALUES(NULL,"2020/11/01",03,100.05,19.25,10.25,10.25,0023,00001);

/*
TASA_PRESTAMO-------------------------------------------------------------------------------------------------------
*/

INSERT INTO tasa_prestamo VALUES(001,1.00,2000.25,01.00);
INSERT INTO tasa_prestamo VALUES(002,1000,4000.25,52.00);
INSERT INTO tasa_prestamo VALUES(003,2000,6000.25,35.00);
INSERT INTO tasa_prestamo VALUES(004,4000,8000.25,42.00);
INSERT INTO tasa_prestamo VALUES(005,5000,10000.25,5.30);
INSERT INTO tasa_prestamo VALUES(006,6000,12000.25,7.26);

/*
CAJA_AHORRO-------------------------------------------------------------------------------------------------------
*/

INSERT INTO caja_ahorro VALUES(1,1,100.99);
INSERT INTO caja_ahorro VALUES(2,11,200.99);
INSERT INTO caja_ahorro VALUES(3,12,1.00);
INSERT INTO caja_ahorro VALUES(4,13,0.29);
INSERT INTO caja_ahorro VALUES(5,14,50000.95);
INSERT INTO caja_ahorro VALUES(6,15,10034.99);
INSERT INTO caja_ahorro VALUES(7,16,10043.99);
INSERT INTO caja_ahorro VALUES(8,17,199.99);
INSERT INTO caja_ahorro VALUES(9,18,900.99);
INSERT INTO caja_ahorro VALUES(10,19,400.99);
INSERT INTO caja_ahorro VALUES(11,111,6700.99);
INSERT INTO caja_ahorro VALUES(12,112,2100.99);
INSERT INTO caja_ahorro VALUES(13,113,6500.99);
INSERT INTO caja_ahorro VALUES(14,114,99985.99);


/*
CLIENTE_CA-------------------------------------------------------------------------------------------------------
*/

INSERT INTO cliente_ca VALUES(1,14);
INSERT INTO cliente_ca VALUES(2,13);
INSERT INTO cliente_ca VALUES(10,12);
INSERT INTO cliente_ca VALUES(11,11);
INSERT INTO cliente_ca VALUES(3,10);
INSERT INTO cliente_ca VALUES(4,09);
INSERT INTO cliente_ca VALUES(6,08);
INSERT INTO cliente_ca VALUES(5,07);
INSERT INTO cliente_ca VALUES(10,06);
INSERT INTO cliente_ca VALUES(7,05);
INSERT INTO cliente_ca VALUES(8,04);
INSERT INTO cliente_ca VALUES(9,03);
INSERT INTO cliente_ca VALUES(12,02);
INSERT INTO cliente_ca VALUES(15,01);

/*
TARJETA-------------------------------------------------------------------------------------------------------
*/

INSERT INTO tarjeta VALUES(1,MD5(1),MD5(216),"2023/01/09",1,14);
INSERT INTO tarjeta VALUES(101,MD5(1),MD5(216),"2023/01/09",1,14);
INSERT INTO tarjeta VALUES(102,MD5(2),MD5(215),"2023/01/09",2,13);
INSERT INTO tarjeta VALUES(103,MD5(3),MD5(214),"2023/01/09",10,12);
INSERT INTO tarjeta VALUES(104,MD5(4),MD5(213),"2023/01/09",11,11);
INSERT INTO tarjeta VALUES(105,MD5(5),MD5(212),"2023/01/09",3,10);
INSERT INTO tarjeta VALUES(106,MD5(6),MD5(29),"2023/01/09",4,09);
INSERT INTO tarjeta VALUES(107,MD5(7),MD5(28),"2023/01/09",6,08);
INSERT INTO tarjeta VALUES(108,MD5(8),MD5(27),"2023/01/09",5,07);
INSERT INTO tarjeta VALUES(109,MD5(9),MD5(26),"2023/01/09",10,06);
INSERT INTO tarjeta VALUES(110,MD5(10),MD5(25),"2023/01/09",7,05);
INSERT INTO tarjeta VALUES(120,MD5(11),MD5(24),"2023/01/09",7,05);
INSERT INTO tarjeta VALUES(130,MD5(12),MD5(23),"2023/01/09",8,04);
INSERT INTO tarjeta VALUES(140,MD5(13),MD5(22),"2023/01/09",9,03);
INSERT INTO tarjeta VALUES(150,MD5(14),MD5(21),"2023/01/09",12,02);
INSERT INTO tarjeta VALUES(160,MD5(15),MD5(20),"2023/01/09",15,01);

/*
CAJA-------------------------------------------------------------------------------------------------------
*/

INSERT INTO caja VALUES(1);
INSERT INTO caja VALUES(2);
INSERT INTO caja VALUES(3);
INSERT INTO caja VALUES(4);
INSERT INTO caja VALUES(5);
INSERT INTO caja VALUES(6);
INSERT INTO caja VALUES(7);
INSERT INTO caja VALUES(8);
INSERT INTO caja VALUES(9);
INSERT INTO caja VALUES(10);

/*
VENTANILLA-------------------------------------------------------------------------------------------------------
*/

INSERT INTO ventanilla VALUES(1,12);
INSERT INTO ventanilla VALUES(2,11);
INSERT INTO ventanilla VALUES(3,10);
INSERT INTO ventanilla VALUES(4,10);
INSERT INTO ventanilla VALUES(5,1);
INSERT INTO ventanilla VALUES(6,2);
INSERT INTO ventanilla VALUES(7,3);
INSERT INTO ventanilla VALUES(8,4);
INSERT INTO ventanilla VALUES(9,5);
INSERT INTO ventanilla VALUES(10,6);

/*
ATM-------------------------------------------------------------------------------------------------------
*/
INSERT INTO caja VALUES(100);

INSERT INTO atm(cod_caja,cod_postal,direccion)
	SELECT cod_caja,cod_postal,direccion FROM ventanilla NATURAL JOIN sucursal;

INSERT INTO atm(cod_caja, cod_postal, direccion) VALUES(100, 1001, "San andres 800");

/*
TRANSACCION-------------------------------------------------------------------------------------------------------
*/

INSERT INTO transaccion VALUES(NULL,"2018/01/09","12:05:06",100.00);
INSERT INTO transaccion VALUES(NULL,"2019/02/09","12:00:06",100.00);
INSERT INTO transaccion VALUES(NULL,"2010/03/09","13:05:06",100.00);
INSERT INTO transaccion VALUES(NULL,"2011/04/09","12:05:06",100.00);
INSERT INTO transaccion VALUES(NULL,"2012/05/09","12:05:06",100.00);
INSERT INTO transaccion VALUES(NULL,"2013/06/09","17:05:02",100.00);
INSERT INTO transaccion VALUES(NULL,"2014/07/09","12:05:04",100.00);
INSERT INTO transaccion VALUES(NULL,"2015/08/09","12:05:06",100.00);
INSERT INTO transaccion VALUES(NULL,"2016/09/09","12:05:01",100.00);
INSERT INTO transaccion VALUES(NULL,"2016/10/09","12:00:00",100.00);
INSERT INTO transaccion VALUES(NULL,"2014/10/09","12:00:00",190.00);

/*
DEBITO-------------------------------------------------------------------------------------------------------
*/

INSERT INTO debito VALUES(1,"descripcion1...",1,14);
INSERT INTO debito VALUES(2,"descripcion2...",2,13);
INSERT INTO debito VALUES(3,"descripcion3...",10,12);
INSERT INTO debito VALUES(4,"descripcion4...",11,11);
INSERT INTO debito VALUES(5,"descripcion5...",3,10);
INSERT INTO debito VALUES(6,"descripcion6...",4,09);
INSERT INTO debito VALUES(7,"descripcion7...",6,08);
INSERT INTO debito VALUES(8,"descripcion8...",5,07);
INSERT INTO debito VALUES(9,"descripcion9...",10,06);
INSERT INTO debito VALUES(10,"descripcion10...",7,05);

/*
TRANSACCION_POR_CAJA-------------------------------------------------------------------------------------------------------
*/

INSERT INTO transaccion_por_caja VALUES(1,5);
INSERT INTO transaccion_por_caja VALUES(2,6);
INSERT INTO transaccion_por_caja VALUES(3,7);
INSERT INTO transaccion_por_caja VALUES(4,8);
INSERT INTO transaccion_por_caja VALUES(5,9);
INSERT INTO transaccion_por_caja VALUES(6,5);
INSERT INTO transaccion_por_caja VALUES(7,6);
INSERT INTO transaccion_por_caja VALUES(8,7);
INSERT INTO transaccion_por_caja VALUES(9,8);
INSERT INTO transaccion_por_caja VALUES(10,9);
INSERT INTO transaccion_por_caja VALUES(11,9);

/*
DEPOSITO-------------------------------------------------------------------------------------------------------
*/

INSERT INTO deposito VALUES(1,11);
INSERT INTO deposito VALUES(2,12);
INSERT INTO deposito VALUES(3,13);
INSERT INTO deposito VALUES(4,11);

/*
EXTRACCION-------------------------------------------------------------------------------------------------------
*/

INSERT INTO extraccion VALUES(5,10,06);
INSERT INTO extraccion VALUES(6,15,01);
INSERT INTO extraccion VALUES(7,1,14);
INSERT INTO extraccion VALUES(8,3,10);

/*
TRANSFERENCIA-------------------------------------------------------------------------------------------------------
*/

INSERT INTO transferencia VALUES(9,8,04,14);
INSERT INTO transferencia VALUES(10,9,03,13);

