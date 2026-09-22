-- migrations/1_create_topology.up.sql


--polyhedrons definition

CREATE TABLE polyhedrons (
    id varchar NOT NULL,
	CONSTRAINT polyhedrons_pk PRIMARY KEY (id)
);

-- vertices definition

CREATE TABLE vertices (
    polyhedron varchar NOT NULL REFERENCES polyhedrons(id),
    id INTEGER GENERATED ALWAYS AS IDENTITY NOT NULL,

    x double precision NOT NULL,
    y double precision NOT NULL,
    z double precision NOT NULL,

    latitude double precision
        GENERATED ALWAYS AS (degrees(asin(z))) STORED,

    longitude double precision
        GENERATED ALWAYS AS (degrees(atan2(y, x))) STORED,

    CONSTRAINT vertices_pk PRIMARY KEY (id)
);

-- edges definition

CREATE TABLE edges (
    polyhedron varchar NOT NULL REFERENCES polyhedrons(id),
    a INTEGER NOT NULL REFERENCES vertices(id),
    b INTEGER NOT NULL REFERENCES vertices(id),

    CONSTRAINT edges_pk PRIMARY KEY (a, b),
    CONSTRAINT edges_ordered CHECK (a < b)
);

-- faces definition

CREATE TABLE faces (
    polyhedron varchar NOT NULL REFERENCES polyhedrons(id),
    id INTEGER GENERATED ALWAYS AS IDENTITY NOT NULL,

    centroid_x double precision NOT NULL,
    centroid_y double precision NOT NULL,
    centroid_z double precision NOT NULL,

    centroid_latitude double precision
        GENERATED ALWAYS AS (degrees(asin(centroid_z))) STORED,

    centroid_longitude double precision
        GENERATED ALWAYS AS (degrees(atan2(centroid_y, centroid_x))) STORED,

    CONSTRAINT faces_pk PRIMARY KEY (id)

);
