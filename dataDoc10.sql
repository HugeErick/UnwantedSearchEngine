INSERT INTO DOCUMENT (id, url, title, author, date) VALUES
(10, 'https://news.un.org/es/story/2025/02/1536721', 
 'UN Report on Russia-Ukraine Conflict', 'United Nations', CURRENT_TIMESTAMP);

-- Insert high-value terms only
INSERT INTO TERM (id, name) VALUES (1001, 'ucrania') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (1001, 'ucrania') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (1001, 1001) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (10, 1001, 7);

INSERT INTO TERM (id, name) VALUES (1002, 'rusia') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (1002, 'rusia') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (1002, 1002) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (10, 1002, 4);

INSERT INTO TERM (id, name) VALUES (1003, 'resolucin') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (1003, 'resolucin') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (1003, 1003) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (10, 1003, 5);

INSERT INTO TERM (id, name) VALUES (1004, 'consejo') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (1004, 'consejo') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (1004, 1004) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (10, 1004, 2);

INSERT INTO TERM (id, name) VALUES (1005, 'asamblea') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (1005, 'asamblea') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (1005, 1005) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (10, 1005, 3);

INSERT INTO TERM (id, name) VALUES (1006, 'voto') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (1006, 'voto') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (1006, 1006) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (10, 1006, 4);

INSERT INTO TERM (id, name) VALUES (1007, 'conflicto') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (1007, 'conflicto') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (1007, 1007) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (10, 1007, 3);

INSERT INTO TERM (id, name) VALUES (1008, 'unin') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (1008, 'unin') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (1008, 1008) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (10, 1008, 3);
