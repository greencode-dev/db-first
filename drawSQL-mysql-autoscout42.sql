CREATE TABLE `cars`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `ad_number` VARCHAR(12) NOT NULL COMMENT 'Codice Inserzione',
    `brand` VARCHAR(50) NOT NULL COMMENT 'Marca (es: Mercedes-Benz, Lamborghini)',
    `model` VARCHAR(50) NOT NULL COMMENT 'Modello completo (es: Golf VIII 2.0 GTI Performance)',
    `trim_level` VARCHAR(100) NULL COMMENT 'Allestimento',
    `type` VARCHAR(30) NOT NULL COMMENT 'Categoria Veicolo (es: SUV, Berlina, Station Wagon, City car)',
    `mileage` INT UNSIGNED NOT NULL COMMENT 'Chilometri Percorsi',
    `condition` ENUM('Nuovo', 'Usato', 'Km 0') NOT NULL COMMENT 'Condizione del Veicolo',
    `registration_year` YEAR NOT NULL COMMENT 'Anno di Immatricolazione',
    `fuel_type` ENUM(
        'Benzina',
        'Diesel',
        'Elettrica',
        'Ibrida',
        'GPL',
        'Metano'
    ) NOT NULL COMMENT 'Carburante',
    `engine_displacement` SMALLINT UNSIGNED NOT NULL COMMENT 'Cilindrata (es. 1600)',
    `horsepower` SMALLINT UNSIGNED NOT NULL COMMENT 'Cavalli Vapore o kW',
    `emission_class` VARCHAR(50) NOT NULL COMMENT 'Classe ambientale (es: Euro 6d-Temp)',
    `trasmission` ENUM(
        'Manuale',
        'Automatico',
        'Sequenziale'
    ) NOT NULL COMMENT 'Cambio (Manuale o Automatico)',
    `drive_type` ENUM(
        'Anteriore',
        'Posteriore',
        'Integrale'
    ) NOT NULL COMMENT 'Trazione',
    `doors_number` TINYINT UNSIGNED NOT NULL COMMENT 'Numero Porte (es: 3 o 5)',
    `seats` TINYINT UNSIGNED NULL COMMENT 'Numero Posti',
    `exterior_color` VARCHAR(30) NOT NULL COMMENT 'Colore della Carrozzeria (es: Grigio Antracite)',
    `interior_material` VARCHAR(255) NULL COMMENT 'Tappezzeria (es: Pelle, alcantara o tessuto)',
    `owners_count` TINYINT UNSIGNED NULL COMMENT 'Numero di precedenti proprietari',
    `is_accident_free` BOOLEAN NULL COMMENT 'Stato sinistri (1 = Senza Sinistri, 0 = Con Sinistri)',
    `last_service` DATE NULL COMMENT 'Ultima revisione/Tagliando',
    `last_inspection` DATE NULL,
    `plate_number` VARCHAR(8) NULL COMMENT 'Targa del Veicolo',
    `vin` VARCHAR(18) NULL COMMENT 'Vehicle Identification Number o Numero di Telaio',
    `main_image` VARCHAR(255) NULL COMMENT 'URL foto principale del veicolo',
    `is_promoted` BOOLEAN NOT NULL DEFAULT 0 COMMENT 'In Promozione',
    `price` DECIMAL(10, 2) NOT NULL COMMENT 'Prezzo di Vendita',
    `discount_percentage` TINYINT UNSIGNED NOT NULL DEFAULT 0 COMMENT 'Percentuale di sconto',
    `final_price` DECIMAL(10, 2) NOT NULL DEFAULT 'price * (1 - (discount_percentage / 100))' COMMENT 'Prezzo Finale Generated: price * (1 - discount_percentage / 100)',
    `is_available` BOOLEAN NOT NULL DEFAULT 1 COMMENT 'Stato di disponibilità (1 = Disponibile, 0 = Non Disponibile)',
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Data e ora di creazione del record',
    `updated_at` TIMESTAMP NOT NULL DEFAULT 'CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP' COMMENT 'Data e ora dell\'ultima modifica del record'
);
ALTER TABLE
    `cars` ADD INDEX `brand_type_condition_fuel_type_trasmission_drive_type_index`(
        `brand`,
        `type`,
        `condition`,
        `fuel_type`,
        `trasmission`,
        `drive_type`
    );
ALTER TABLE
    `cars` ADD UNIQUE `cars_ad_number_unique`(`ad_number`);
ALTER TABLE
    `cars` ADD INDEX `cars_brand_index`(`brand`);
ALTER TABLE
    `cars` ADD INDEX `cars_type_index`(`type`);
ALTER TABLE
    `cars` ADD INDEX `cars_condition_index`(`condition`);
ALTER TABLE
    `cars` ADD INDEX `cars_fuel_type_index`(`fuel_type`);
ALTER TABLE
    `cars` ADD INDEX `cars_trasmission_index`(`trasmission`);
ALTER TABLE
    `cars` ADD INDEX `cars_drive_type_index`(`drive_type`);
ALTER TABLE
    `cars` ADD UNIQUE `cars_plate_number_unique`(`plate_number`);
ALTER TABLE
    `cars` ADD UNIQUE `cars_vin_unique`(`vin`);