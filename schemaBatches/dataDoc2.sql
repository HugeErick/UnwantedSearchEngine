-- Insert DOCUMENT record for document 2
INSERT INTO DOCUMENT (id, url, title, author, date) VALUES
(2, 'document_2', 'Russia-Ukraine Easter Conflict', 'El País', CURRENT_TIMESTAMP);

-- Insert only non-stopword terms with their frequencies
-- Filtered out Spanish stop words: de, con, del, haber, han, un, las, el, en, que, por, la, y, ha, etc.

-- Term: domingo (not a stop word)
INSERT INTO TERM (id, name) VALUES (101, 'domingo') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (101, 'domingo') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (101, 101) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (2, 101, 2);

-- Term: est (not a stop word)
INSERT INTO TERM (id, name) VALUES (102, 'est') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (102, 'est') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (102, 102) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (2, 102, 2);

-- Term: fin (not a stop word)
INSERT INTO TERM (id, name) VALUES (103, 'fin') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (103, 'fin') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (103, 103) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (2, 103, 2);

-- Term: durant (not a stop word)
INSERT INTO TERM (id, name) VALUES (104, 'durant') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (104, 'durant') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (104, 104) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (2, 104, 2);

-- Term: asalto (not a stop word)
INSERT INTO TERM (id, name) VALUES (105, 'asalto') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (105, 'asalto') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (105, 105) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (2, 105, 2);

-- Term: llegada (not a stop word)
INSERT INTO TERM (id, name) VALUES (106, 'llegada') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (106, 'llegada') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (106, 106) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (2, 106, 2);

-- Term: tambin (not a stop word)
INSERT INTO TERM (id, name) VALUES (107, 'tambin') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (107, 'tambin') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (107, 107) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (2, 107, 2);

-- Term: ltima (not a stop word)
INSERT INTO TERM (id, name) VALUES (108, 'ltima') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (108, 'ltima') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (108, 108) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (2, 108, 2);

-- Term: acusa (not a stop word)
INSERT INTO TERM (id, name) VALUES (109, 'acusa') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (109, 'acusa') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (109, 109) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (2, 109, 2);

-- Term: adem (not a stop word)
INSERT INTO TERM (id, name) VALUES (110, 'adem') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (110, 'adem') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (110, 110) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (2, 110, 2);

-- Term: ms (not a stop word)
INSERT INTO TERM (id, name) VALUES (111, 'ms') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (111, 'ms') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (111, 111) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (2, 111, 2);

-- Term: paz (not a stop word)
INSERT INTO TERM (id, name) VALUES (112, 'paz') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (112, 'paz') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (112, 112) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (2, 112, 2);

-- Term: ucranio (not a stop word)
INSERT INTO TERM (id, name) VALUES (113, 'ucranio') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (113, 'ucranio') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (113, 113) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (2, 113, 2);

-- Term: drone (not a stop word)
INSERT INTO TERM (id, name) VALUES (114, 'drone') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (114, 'drone') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (114, 114) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (2, 114, 2);

-- Term: ucrania (not a stop word)
INSERT INTO TERM (id, name) VALUES (115, 'ucrania') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (115, 'ucrania') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (115, 115) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (2, 115, 6);

-- Term: tregua (not a stop word)
INSERT INTO TERM (id, name) VALUES (116, 'tregua') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (116, 'tregua') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (116, 116) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (2, 116, 2);

-- Term: aqu (not a stop word)
INSERT INTO TERM (id, name) VALUES (117, 'aqu') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (117, 'aqu') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (117, 117) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (2, 117, 2);

-- Term: hora (not a stop word)
INSERT INTO TERM (id, name) VALUES (118, 'hora') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (118, 'hora') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (118, 118) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (2, 118, 4);

-- Term: fuerza (not a stop word)
INSERT INTO TERM (id, name) VALUES (119, 'fuerza') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (119, 'fuerza') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (119, 119) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (2, 119, 2);

-- Term: posicion (not a stop word)
INSERT INTO TERM (id, name) VALUES (120, 'posicion') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (120, 'posicion') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (120, 120) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (2, 120, 3);

-- Term: rusia (not a stop word)
INSERT INTO TERM (id, name) VALUES (121, 'rusia') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (121, 'rusia') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (121, 121) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (2, 121, 4);

-- Term: disparado (not a stop word)
INSERT INTO TERM (id, name) VALUES (122, 'disparado') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (122, 'disparado') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (122, 122) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (2, 122, 2);

