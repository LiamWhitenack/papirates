-- migrations/1_create_topology.up.sql


--polyhedrons definition

CREATE TABLE polyhedrons (
    id varchar NOT NULL,
    readable_id varchar,
    CONSTRAINT polyhedrons_pk PRIMARY KEY (id)
);

-- unit_vectors definition

CREATE TABLE unit_vectors (
    id varchar NOT NULL,

    x double precision NOT NULL,
    y double precision NOT NULL,
    z double precision NOT NULL,
    latitude double precision NOT NULL,
    longitude double precision NOT NULL,

    CONSTRAINT unit_vectors_pk PRIMARY KEY (id),
    CONSTRAINT unit_vectors_spherical_check
    CHECK (abs(x * x + y * y + z * z - 1) < 1e-10)
);

-- faces definition

CREATE TABLE faces (
    id varchar NOT NULL,

    polyhedron varchar NOT NULL REFERENCES polyhedrons (id),
    centroid integer NOT NULL REFERENCES unit_vectors (id),

    CONSTRAINT faces_pk PRIMARY KEY (id)

);

-- edges definition

CREATE TABLE edges (
    id varchar NOT NULL,

    face integer NOT NULL REFERENCES faces (id),
    a integer NOT NULL REFERENCES unit_vectors (id),
    b integer NOT NULL REFERENCES unit_vectors (id),

    CONSTRAINT edges_pk PRIMARY KEY (a, b),
    CONSTRAINT edges_ordered CHECK (a < b)
);
