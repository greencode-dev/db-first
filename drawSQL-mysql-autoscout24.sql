CREATE TABLE `cars`(
    `id` BIGINT UNSIGNED NOT NULL AUTO_INCREMENT PRIMARY KEY,
    `brand` VARCHAR(50) NOT NULL COMMENT 'Marca (es: Mercedes-Benz, Lamborghini)',
    `model` VARCHAR(100) NOT NULL COMMENT 'Modello completo (es: Golf VIII 2.0 GTI Performance)',
    `type` VARCHAR(30) NOT NULL COMMENT 'Categoria Veicolo (es: SUV, Berlina, Station Wagon, City car)',
    `mileage` INT UNSIGNED NOT NULL COMMENT 'Chilometraggio',
    `year` SMALLINT UNSIGNED NOT NULL COMMENT 'Anno di Immatricolazione',
    `fuel_type` VARCHAR(20) NOT NULL COMMENT 'Carburante (es: Benzina, Ibrida, GPL)',
    `engine_displacement` INT UNSIGNED NOT NULL COMMENT 'Cilindrata (es. 1600)',
    `horsepower` INT UNSIGNED NOT NULL COMMENT 'Cavalli Vapore o kW',
    `emission_class` VARCHAR(50) NOT NULL COMMENT 'Classe ambientale (es: Euro 6d-Temp)',
    `trasmission` VARCHAR(20) NOT NULL COMMENT 'Cambio (Manuale o Automatico)',
    `doors_number` TINYINT UNSIGNED NOT NULL COMMENT 'Numero Porte (es: 3 o 5)',
    `exterior_color` VARCHAR(30) NOT NULL COMMENT 'Colore della Carrozzeria (es: Grigio Antracite)',
    `interior_material` VARCHAR(255) NULL COMMENT 'Tappezzeria (es: Pelle, alcantara o tessuto)',
    `owners_count` TINYINT UNSIGNED NULL COMMENT 'Numero di precedenti proprietari',
    `vin` VARCHAR(17) NULL COMMENT 'Vehicle Identification Number o Numero di Telaio',
    `is_accident_free` BOOLEAN NULL COMMENT 'Stato sinistri (1 = Senza Sinistri, 0 = Con Sinistri)',
    `plate_number` VARCHAR(7) NULL COMMENT 'Targa del Veicolo',
    `main_image` VARCHAR(255) NULL COMMENT 'URL foto principale del veicolo',
    `price` DECIMAL(10, 2) NOT NULL COMMENT 'Prezzo di vendita',
    `is_available` BOOLEAN NOT NULL DEFAULT 1 COMMENT 'Stato di disponibilità (1 = Disponibile, 0 = Non Disponibile)',
    `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'Data e ora di creazione del record',
    `updated_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT 'Data e ora dell\'ultima modifica del record'
);
ALTER TABLE
    `cars` ADD INDEX `cars_brand_index`(`brand`);
ALTER TABLE
    `cars` ADD INDEX `cars_type_index`(`type`);
ALTER TABLE
    `cars` ADD UNIQUE `cars_vin_unique`(`vin`);
ALTER TABLE
    `cars` ADD UNIQUE `cars_plate_number_unique`(`plate_number`);