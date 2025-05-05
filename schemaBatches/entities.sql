-- Create the DOCUMENT table
CREATE TABLE IF NOT EXISTS DOCUMENT (
    id SERIAL PRIMARY KEY,
    url TEXT NOT NULL,
    title TEXT NOT NULL,
    author TEXT,
    date TIMESTAMP
);

-- Create the TERM table
CREATE TABLE IF NOT EXISTS TERM (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL UNIQUE
);

-- Create the WORD table
CREATE TABLE IF NOT EXISTS WORD (
    id SERIAL PRIMARY KEY,
    word TEXT NOT NULL UNIQUE
);

-- Create the HAS relationship table (many-to-many between DOCUMENT and TERM)
CREATE TABLE IF NOT EXISTS HAS (
    document_id INTEGER REFERENCES DOCUMENT(id),
    term_id INTEGER REFERENCES TERM(id),
    frequency REAL NOT NULL,
    PRIMARY KEY (document_id, term_id)
);

-- Create the REPRESENTS relationship table (many-to-many between TERM and WORD)
CREATE TABLE IF NOT EXISTS REPRESENTS (
    term_id INTEGER REFERENCES TERM(id),
    word_id INTEGER REFERENCES WORD(id),
    PRIMARY KEY (term_id, word_id)
);

-- Create the SYNONYMS table
CREATE TABLE IF NOT EXISTS SYNONYMS (
    term_id INT8 NOT NULL REFERENCES TERM(id),
    synonym_name VARCHAR(255) NOT NULL,
    PRIMARY KEY (term_id, synonym_name)
);
