-- Generated by Oracle SQL Developer Data Modeler 23.1.0.087.0806
--   at:        2024-04-08 23:50:48 YEKT
--   site:      Oracle Database 11g
--   type:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE car (
    vin              VARCHAR2(30) NOT NULL,
    gos              VARCHAR2(10) NOT NULL,
    gps_track        VARCHAR2(30) NOT NULL,
    car_make         VARCHAR2(30) NOT NULL,
    release          DATE,
    car_id           NUMBER NOT NULL,
    client_client_id NUMBER NOT NULL,
    model_model_id   NUMBER NOT NULL
);

ALTER TABLE car ADD CONSTRAINT car_pk PRIMARY KEY ( car_id );

CREATE TABLE client (
    number_of_violations                   INTEGER NOT NULL,
    client_id                              NUMBER NOT NULL, 
--  ERROR: Column name length exceeds maximum allowed length(30) 
    pasport_details_pasport_details_id     NUMBER NOT NULL, 
--  ERROR: Column name length exceeds maximum allowed length(30) 
    "Driver's_license_Driver's_license_ID" NUMBER NOT NULL
);

ALTER TABLE client ADD CONSTRAINT client_pk PRIMARY KEY ( client_id );

CREATE TABLE "Driver's_license" (
    driver_violation_history VARCHAR2(100) NOT NULL,
    "Driver's_license_ID"    NUMBER NOT NULL
);

ALTER TABLE "Driver's_license" ADD CONSTRAINT "Driver's_license_PK" PRIMARY KEY ( "Driver's_license_ID" );

CREATE TABLE feedback (
    rating           INTEGER NOT NULL,
    "Comment"        VARCHAR2(1000),
    feedback_id      NUMBER NOT NULL,
    client_client_id NUMBER NOT NULL
);

ALTER TABLE feedback ADD CONSTRAINT feedback_pk PRIMARY KEY ( feedback_id );

CREATE TABLE insurance (
    start_of_insurance DATE NOT NULL,
    end_of_insurance   DATE,
    insurance_id       NUMBER NOT NULL,
    car_car_id         NUMBER NOT NULL
);

ALTER TABLE insurance ADD CONSTRAINT insurance_pk PRIMARY KEY ( insurance_id );

CREATE TABLE location (
    street           VARCHAR2(50) NOT NULL,
    number_of_street VARCHAR2(10) NOT NULL,
    location_id      NUMBER NOT NULL,
    region_region_id NUMBER NOT NULL
);

ALTER TABLE location ADD CONSTRAINT location_pk PRIMARY KEY ( location_id );

CREATE TABLE model (
    manufacturer VARCHAR2(30) NOT NULL,
    engine_power INTEGER NOT NULL,
    model_id     NUMBER NOT NULL
);

ALTER TABLE model ADD CONSTRAINT model_pk PRIMARY KEY ( model_id );

CREATE TABLE "Old_Driver's_license" (
    driver_violation_history               VARCHAR2(100) NOT NULL,
    "Old_Driver's_license_ID"              NUMBER NOT NULL, 
--  ERROR: Column name length exceeds maximum allowed length(30) 
    "Driver's_license_Driver's_license_ID" NUMBER NOT NULL
);

ALTER TABLE "Old_Driver's_license" ADD CONSTRAINT "Old_Driver's_license_PK" PRIMARY KEY ( "Old_Driver's_license_ID" );

CREATE TABLE old_pasport_details (
    old_passport_id                    VARCHAR2(20) NOT NULL,
    old_name                           VARCHAR2(25) NOT NULL,
    old_surname                        VARCHAR2(25) NOT NULL,
    old_patronymic                     VARCHAR2(25) NOT NULL,
    old_pasport_details_id             NUMBER NOT NULL, 
--  ERROR: Column name length exceeds maximum allowed length(30) 
    pasport_details_pasport_details_id NUMBER NOT NULL
);

ALTER TABLE old_pasport_details ADD CONSTRAINT old_pasport_details_pk PRIMARY KEY ( old_pasport_details_id );

CREATE TABLE parking_permit (
    parking              CHAR(1) NOT NULL,
    parking_permit_id    NUMBER NOT NULL,
    car_car_id           NUMBER NOT NULL,
    location_location_id NUMBER NOT NULL,
    region_region_id     NUMBER
);

ALTER TABLE parking_permit ADD CONSTRAINT parking_permit_pk PRIMARY KEY ( parking_permit_id );

CREATE TABLE pasport_details (
    passport_id        VARCHAR2(20) NOT NULL,
    name               VARCHAR2(20) NOT NULL,
    surname            VARCHAR2(25) NOT NULL,
    patronymic         VARCHAR2(25),
    pasport_details_id NUMBER NOT NULL
);

ALTER TABLE pasport_details ADD CONSTRAINT pasport_details_pk PRIMARY KEY ( pasport_details_id );

ALTER TABLE pasport_details ADD CONSTRAINT pasport_details_passport_id_un UNIQUE ( passport_id );

CREATE TABLE rate (
    type             VARCHAR2(15) NOT NULL,
    price            FLOAT NOT NULL,
    rate_id          NUMBER NOT NULL,
    client_client_id NUMBER NOT NULL,
    rent_rent_id     NUMBER NOT NULL
);

ALTER TABLE rate ADD CONSTRAINT rate_pk PRIMARY KEY ( rate_id );

CREATE TABLE region (
    name                   VARCHAR2(20) NOT NULL,
    region_id              NUMBER NOT NULL,
    insurance_insurance_id NUMBER NOT NULL
);

ALTER TABLE region ADD CONSTRAINT region_pk PRIMARY KEY ( region_id );

CREATE TABLE rent (
    start_of_time DATE NOT NULL,
    end_of_time   DATE,
    type          VARCHAR2(15) NOT NULL,
    rent_id       NUMBER NOT NULL
);

ALTER TABLE rent ADD CONSTRAINT rent_pk PRIMARY KEY ( rent_id );

CREATE TABLE service_history (
    mileage            INTEGER NOT NULL,
    last_servise       DATE NOT NULL,
    service_history_id NUMBER NOT NULL,
    car_car_id         NUMBER NOT NULL
);

ALTER TABLE service_history ADD CONSTRAINT service_history_pk PRIMARY KEY ( service_history_id );

ALTER TABLE car
    ADD CONSTRAINT car_client_fk FOREIGN KEY ( client_client_id )
        REFERENCES client ( client_id );

ALTER TABLE car
    ADD CONSTRAINT car_model_fk FOREIGN KEY ( model_model_id )
        REFERENCES model ( model_id );

ALTER TABLE client
    ADD CONSTRAINT "Client_Driver's_license_FK" FOREIGN KEY ( "Driver's_license_Driver's_license_ID" )
        REFERENCES "Driver's_license" ( "Driver's_license_ID" );

ALTER TABLE client
    ADD CONSTRAINT client_pasport_details_fk FOREIGN KEY ( pasport_details_pasport_details_id )
        REFERENCES pasport_details ( pasport_details_id );

ALTER TABLE feedback
    ADD CONSTRAINT feedback_client_fk FOREIGN KEY ( client_client_id )
        REFERENCES client ( client_id );

ALTER TABLE insurance
    ADD CONSTRAINT insurance_car_fk FOREIGN KEY ( car_car_id )
        REFERENCES car ( car_id );

ALTER TABLE location
    ADD CONSTRAINT location_region_fk FOREIGN KEY ( region_region_id )
        REFERENCES region ( region_id );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE "Old_Driver's_license"
    ADD CONSTRAINT "Old_Driver's_license_Driver's_license_FK" FOREIGN KEY ( "Driver's_license_Driver's_license_ID" )
        REFERENCES "Driver's_license" ( "Driver's_license_ID" );

--  ERROR: FK name length exceeds maximum allowed length(30) 
ALTER TABLE old_pasport_details
    ADD CONSTRAINT old_pasport_details_pasport_details_fk FOREIGN KEY ( pasport_details_pasport_details_id )
        REFERENCES pasport_details ( pasport_details_id );

ALTER TABLE parking_permit
    ADD CONSTRAINT parking_permit_car_fk FOREIGN KEY ( car_car_id )
        REFERENCES car ( car_id );

ALTER TABLE parking_permit
    ADD CONSTRAINT parking_permit_location_fk FOREIGN KEY ( location_location_id )
        REFERENCES location ( location_id );

ALTER TABLE parking_permit
    ADD CONSTRAINT parking_permit_region_fk FOREIGN KEY ( region_region_id )
        REFERENCES region ( region_id );

ALTER TABLE rate
    ADD CONSTRAINT rate_client_fk FOREIGN KEY ( client_client_id )
        REFERENCES client ( client_id );

ALTER TABLE rate
    ADD CONSTRAINT rate_rent_fk FOREIGN KEY ( rent_rent_id )
        REFERENCES rent ( rent_id );

ALTER TABLE region
    ADD CONSTRAINT region_insurance_fk FOREIGN KEY ( insurance_insurance_id )
        REFERENCES insurance ( insurance_id );

ALTER TABLE service_history
    ADD CONSTRAINT service_history_car_fk FOREIGN KEY ( car_car_id )
        REFERENCES car ( car_id );

CREATE SEQUENCE car_car_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER car_car_id_trg BEFORE
    INSERT ON car
    FOR EACH ROW
    WHEN ( new.car_id IS NULL )
BEGIN
    :new.car_id := car_car_id_seq.nextval;
END;
/

CREATE SEQUENCE client_client_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER client_client_id_trg BEFORE
    INSERT ON client
    FOR EACH ROW
    WHEN ( new.client_id IS NULL )
BEGIN
    :new.client_id := client_client_id_seq.nextval;
END;
/

CREATE SEQUENCE "Driver's_license_Driver's_lice" START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER "Driver's_license_Driver's_lice" BEFORE
    INSERT ON "Driver's_license"
    FOR EACH ROW
    WHEN ( new."Driver's_license_ID" IS NULL )
BEGIN
    :new."Driver's_license_ID" := "Driver's_license_Driver's_lice".nextval;
END;
/

CREATE SEQUENCE feedback_feedback_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER feedback_feedback_id_trg BEFORE
    INSERT ON feedback
    FOR EACH ROW
    WHEN ( new.feedback_id IS NULL )
BEGIN
    :new.feedback_id := feedback_feedback_id_seq.nextval;
END;
/

CREATE SEQUENCE insurance_insurance_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER insurance_insurance_id_trg BEFORE
    INSERT ON insurance
    FOR EACH ROW
    WHEN ( new.insurance_id IS NULL )
BEGIN
    :new.insurance_id := insurance_insurance_id_seq.nextval;
END;
/

CREATE SEQUENCE location_location_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER location_location_id_trg BEFORE
    INSERT ON location
    FOR EACH ROW
    WHEN ( new.location_id IS NULL )
BEGIN
    :new.location_id := location_location_id_seq.nextval;
END;
/

CREATE SEQUENCE model_model_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER model_model_id_trg BEFORE
    INSERT ON model
    FOR EACH ROW
    WHEN ( new.model_id IS NULL )
BEGIN
    :new.model_id := model_model_id_seq.nextval;
END;
/

CREATE SEQUENCE "Old_Driver's_license_Old_Drive" START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER "Old_Driver's_license_Old_Drive" BEFORE
    INSERT ON "Old_Driver's_license"
    FOR EACH ROW
    WHEN ( new."Old_Driver's_license_ID" IS NULL )
BEGIN
    :new."Old_Driver's_license_ID" := "Old_Driver's_license_Old_Drive".nextval;
END;
/

CREATE SEQUENCE old_pasport_details_old_paspor START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER old_pasport_details_old_paspor BEFORE
    INSERT ON old_pasport_details
    FOR EACH ROW
    WHEN ( new.old_pasport_details_id IS NULL )
BEGIN
    :new.old_pasport_details_id := old_pasport_details_old_paspor.nextval;
END;
/

CREATE SEQUENCE parking_permit_parking_permit_ START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER parking_permit_parking_permit_ BEFORE
    INSERT ON parking_permit
    FOR EACH ROW
    WHEN ( new.parking_permit_id IS NULL )
BEGIN
    :new.parking_permit_id := parking_permit_parking_permit_.nextval;
END;
/

CREATE SEQUENCE pasport_details_pasport_detail START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER pasport_details_pasport_detail BEFORE
    INSERT ON pasport_details
    FOR EACH ROW
    WHEN ( new.pasport_details_id IS NULL )
BEGIN
    :new.pasport_details_id := pasport_details_pasport_detail.nextval;
END;
/

CREATE SEQUENCE rate_rate_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER rate_rate_id_trg BEFORE
    INSERT ON rate
    FOR EACH ROW
    WHEN ( new.rate_id IS NULL )
BEGIN
    :new.rate_id := rate_rate_id_seq.nextval;
END;
/

CREATE SEQUENCE region_region_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER region_region_id_trg BEFORE
    INSERT ON region
    FOR EACH ROW
    WHEN ( new.region_id IS NULL )
BEGIN
    :new.region_id := region_region_id_seq.nextval;
END;
/

CREATE SEQUENCE rent_rent_id_seq START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER rent_rent_id_trg BEFORE
    INSERT ON rent
    FOR EACH ROW
    WHEN ( new.rent_id IS NULL )
BEGIN
    :new.rent_id := rent_rent_id_seq.nextval;
END;
/

CREATE SEQUENCE service_history_service_histor START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER service_history_service_histor BEFORE
    INSERT ON service_history
    FOR EACH ROW
    WHEN ( new.service_history_id IS NULL )
BEGIN
    :new.service_history_id := service_history_service_histor.nextval;
END;
/



-- Oracle SQL Developer Data Modeler Summary Report: 
-- 
-- CREATE TABLE                            15
-- CREATE INDEX                             0
-- ALTER TABLE                             32
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                          15
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                         15
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              0
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   6
-- WARNINGS                                 0
