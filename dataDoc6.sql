-- Insert DOCUMENT record for document 6
INSERT INTO DOCUMENT (id, url, title, author, date) VALUES
(6, 'https://www.elperiodico.com/es/internacional/20250427/guerra-ucrania-rusia-ultima-hora-directo-103935417', 
 'Live Updates: Ukraine-Russia War', 'El Periódico', CURRENT_TIMESTAMP);

-- Insert high-value terms only
INSERT INTO TERM (id, name) VALUES (601, 'ucrania') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (601, 'ucrania') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (601, 601) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (6, 601, 4);

INSERT INTO TERM (id, name) VALUES (602, 'rusia') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (602, 'rusia') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (602, 602) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (6, 602, 4);

INSERT INTO TERM (id, name) VALUES (603, 'guerra') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (603, 'guerra') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (603, 603) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (6, 603, 3);

INSERT INTO TERM (id, name) VALUES (604, 'europa') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (604, 'europa') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (604, 604) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (6, 604, 2);

INSERT INTO TERM (id, name) VALUES (605, 'president') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (605, 'president') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (605, 605) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (6, 605, 2);

INSERT INTO TERM (id, name) VALUES (606, 'propuesta') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (606, 'propuesta') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (606, 606) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (6, 606, 3);

INSERT INTO TERM (id, name) VALUES (607, 'fuego') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (607, 'fuego') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (607, 607) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (6, 607, 2);

INSERT INTO TERM (id, name) VALUES (608, 'alto') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (608, 'alto') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (608, 608) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (6, 608, 2);

INSERT INTO TERM (id, name) VALUES (609, 'internacion') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (609, 'internacion') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (609, 609) ON CONFLICT DO NOTHING;
