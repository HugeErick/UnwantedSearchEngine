-- Insert DOCUMENT record for document 5
INSERT INTO DOCUMENT (id, url, title, author, date) VALUES
(5, 'https://www.elmundo.es/internacional/2025/04/25/680b1cb2a75cca8941290ec6-directo.html', 
 'Live Coverage: Russia-Ukraine War', 'El Mundo', CURRENT_TIMESTAMP);

-- Insert high-value terms only
INSERT INTO TERM (id, name) VALUES (501, 'ucrania') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (501, 'ucrania') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (501, 501) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (5, 501, 4);

INSERT INTO TERM (id, name) VALUES (502, 'rusia') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (502, 'rusia') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (502, 502) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (5, 502, 3);

INSERT INTO TERM (id, name) VALUES (503, 'drone') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (503, 'drone') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (503, 503) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (5, 503, 3);

INSERT INTO TERM (id, name) VALUES (504, 'fuerza') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (504, 'fuerza') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (504, 504) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (5, 504, 2);

INSERT INTO TERM (id, name) VALUES (505, 'paz') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (505, 'paz') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (505, 505) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (5, 505, 2);

INSERT INTO TERM (id, name) VALUES (506, 'acuerdo') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (506, 'acuerdo') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (506, 506) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (5, 506, 2);

INSERT INTO TERM (id, name) VALUES (507, 'rubio') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (507, 'rubio') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (507, 507) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (5, 507, 2);

INSERT INTO TERM (id, name) VALUES (508, 'muerto') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (508, 'muerto') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (508, 508) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (5, 508, 2);

INSERT INTO TERM (id, name) VALUES (509, 'ucraniana') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (509, 'ucraniana') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (509, 509) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (5, 509, 2);

INSERT INTO TERM (id, name) VALUES (510, 'domingo') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (510, 'domingo') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (510, 510) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (5, 510, 2);

INSERT INTO TERM (id, name) VALUES (511, 'area') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (511, 'area') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (511, 511) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (5, 511, 2);

INSERT INTO TERM (id, name) VALUES (512, 'inform') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (512, 'inform') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (512, 512) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (5, 512, 4);
