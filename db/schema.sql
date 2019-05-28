CREATE TABLE entity (
    id INT UNIQUE NOT NULL AUTO_INCREMENT,
    name VARCHAR(256) NOT NULL UNIQUE,
    relation_type ENUM ('donor', 'recipient', 'both') NOT NULL,
    contributor_type ENUM ('corporations', 'individuals') NOT NULL,
    recipient_type ENUM ('registered party','candidate', 'P.L.Q./Q.L.P.', 'P.Q.', 'A.D.Q.') NOT NULL,
    political_party VARCHAR(256) NOT NULL,    
	PRIMARY KEY(id)
);

CREATE TABLE donation (
    id INT UNIQUE NOT NULL AUTO_INCREMENT,
    contributor_name VARCHAR(256),
    recipient_name VARCHAR(256),
    amount DECIMAL(18, 2) NOT NULL,
    donation_year INT,
    source VARCHAR(256) NOT NULL,
	PRIMARY KEY(id),
	FOREIGN KEY (contributor_name) REFERENCES entity(name),
	FOREIGN KEY (recipient_name) REFERENCES entity(name)
);

CREATE UNIQUE INDEX entity_index ON entity (name);
CREATE UNIQUE INDEX donation_index ON donation (source, amount, contributor_name, recipient_name);
