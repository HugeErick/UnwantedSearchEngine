-- Insert DOCUMENT record for document 1
INSERT INTO DOCUMENT (id, url, title, author, date) VALUES
(1, 'document_1', 'Ukrainian-Russian Conflict Analysis', 'Vox News', CURRENT_TIMESTAMP);

-- Insert TERM and WORD records with HAS and REPRESENTS relationships
-- Only inserting terms that are NOT in English or Spanish stop word lists

-- Term: ukrainian (not a stop word)
INSERT INTO TERM (id, name) VALUES (1, 'ukrainian') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (1, 'ukrainian') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (1, 1) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (1, 1, 3);

-- Term: russianukrainian (not a stop word)
INSERT INTO TERM (id, name) VALUES (2, 'russianukrainian') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (2, 'russianukrainian') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (2, 2) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (1, 2, 2);

-- Term: genocid (not a stop word)
INSERT INTO TERM (id, name) VALUES (3, 'genocid') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (3, 'genocid') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (3, 3) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (1, 3, 2);

-- Term: expert (not a stop word)
INSERT INTO TERM (id, name) VALUES (4, 'expert') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (4, 'expert') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (4, 4) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (1, 4, 2);

-- Term: nation (not a stop word)
INSERT INTO TERM (id, name) VALUES (5, 'nation') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (5, 'nation') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (5, 5) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (1, 5, 2);

-- Term: rule (not a stop word)
INSERT INTO TERM (id, name) VALUES (6, 'rule') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (6, 'rule') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (6, 6) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (1, 6, 3);

-- Term: proven (not a stop word)
INSERT INTO TERM (id, name) VALUES (7, 'proven') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (7, 'proven') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (7, 7) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (1, 7, 2);

-- Term: matter (not a stop word)
INSERT INTO TERM (id, name) VALUES (8, 'matter') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (8, 'matter') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (8, 8) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (1, 8, 2);

-- Term: regim (not a stop word)
INSERT INTO TERM (id, name) VALUES (9, 'regim') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (9, 'regim') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (9, 9) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (1, 9, 2);

-- Term: tie (not a stop word)
INSERT INTO TERM (id, name) VALUES (10, 'tie') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (10, 'tie') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (10, 10) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (1, 10, 2);

-- Term: world (not a stop word)
INSERT INTO TERM (id, name) VALUES (11, 'world') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (11, 'world') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (11, 11) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (1, 11, 2);

-- Term: russia (not a stop word)
INSERT INTO TERM (id, name) VALUES (12, 'russia') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (12, 'russia') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (12, 12) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (1, 12, 5);

-- Term: putin (not a stop word)
INSERT INTO TERM (id, name) VALUES (13, 'putin') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (13, 'putin') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (13, 13) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (1, 13, 3);

-- Term: repeat (not a stop word)
INSERT INTO TERM (id, name) VALUES (14, 'repeat') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (14, 'repeat') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (14, 14) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (1, 14, 2);

-- Term: claim (not a stop word)
INSERT INTO TERM (id, name) VALUES (15, 'claim') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (15, 'claim') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (15, 15) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (1, 15, 2);

-- Term: predict (not a stop word)
INSERT INTO TERM (id, name) VALUES (16, 'predict') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (16, 'predict') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (16, 16) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (1, 16, 3);

-- Term: end (not a stop word)
INSERT INTO TERM (id, name) VALUES (17, 'end') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (17, 'end') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (17, 17) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (1, 17, 2);

-- Term: power (not a stop word)
INSERT INTO TERM (id, name) VALUES (18, 'power') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (18, 'power') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (18, 18) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (1, 18, 2);

-- Term: make (not a stop word)
INSERT INTO TERM (id, name) VALUES (19, 'make') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (19, 'make') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (19, 19) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (1, 19, 3);

-- Term: vox (not a stop word)
INSERT INTO TERM (id, name) VALUES (20, 'vox') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (20, 'vox') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (20, 20) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (1, 20, 2);

-- Term: news (not a stop word)
INSERT INTO TERM (id, name) VALUES (21, 'news') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (21, 'news') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (21, 21) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (1, 21, 2);

-- Term: demilitar (not a stop word)
INSERT INTO TERM (id, name) VALUES (22, 'demilitar') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (22, 'demilitar') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (22, 22) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (1, 22, 2);

-- Term: sens (not a stop word)
INSERT INTO TERM (id, name) VALUES (23, 'sens') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (23, 'sens') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (23, 23) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (1, 23, 2);

-- Term: russian (not a stop word)
INSERT INTO TERM (id, name) VALUES (24, 'russian') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (24, 'russian') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (24, 24) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (1, 24, 7);

-- Term: question (not a stop word)
INSERT INTO TERM (id, name) VALUES (25, 'question') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (25, 'question') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (25, 25) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (1, 25, 2);

-- Term: polit (not a stop word)
INSERT INTO TERM (id, name) VALUES (26, 'polit') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (26, 'polit') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (26, 26) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (1, 26, 3);

-- Term: denazif (not a stop word)
INSERT INTO TERM (id, name) VALUES (27, 'denazif') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (27, 'denazif') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (27, 27) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (1, 27, 2);

-- Term: one (not a stop word)
INSERT INTO TERM (id, name) VALUES (28, 'one') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (28, 'one') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (28, 28) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (1, 28, 3);

-- Term: understand (not a stop word)
INSERT INTO TERM (id, name) VALUES (29, 'understand') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (29, 'understand') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (29, 29) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (1, 29, 2);

-- Term: war (not a stop word)
INSERT INTO TERM (id, name) VALUES (30, 'war') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (30, 'war') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (30, 30) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (1, 30, 5);

-- Term: kyiv (not a stop word)
INSERT INTO TERM (id, name) VALUES (31, 'kyiv') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (31, 'kyiv') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (31, 31) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (1, 31, 2);

-- Term: ukrain (not a stop word)
INSERT INTO TERM (id, name) VALUES (32, 'ukrain') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (32, 'ukrain') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (32, 32) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (1, 32, 9);

-- Term: control (not a stop word)
INSERT INTO TERM (id, name) VALUES (33, 'control') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (33, 'control') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (33, 33) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (1, 33, 2);

-- Term: soviet (not a stop word)
INSERT INTO TERM (id, name) VALUES (34, 'soviet') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (34, 'soviet') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (34, 34) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (1, 34, 2);

-- Term: invad (not a stop word)
INSERT INTO TERM (id, name) VALUES (35, 'invad') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (35, 'invad') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (35, 35) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (1, 35, 2);

-- Term: emerg (not a stop word)
INSERT INTO TERM (id, name) VALUES (36, 'emerg') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (36, 'emerg') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (36, 36) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (1, 36, 2);

-- Term: histor (not a stop word)
INSERT INTO TERM (id, name) VALUES (37, 'histor') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (37, 'histor') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (37, 37) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (1, 37, 3);

-- Term: imperi (not a stop word)
INSERT INTO TERM (id, name) VALUES (38, 'imperi') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (38, 'imperi') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (38, 38) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (1, 38, 2);

-- Term: rhetor (not a stop word)
INSERT INTO TERM (id, name) VALUES (39, 'rhetor') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (39, 'rhetor') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (39, 39) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (1, 39, 2);

-- Term: whi (not a stop word)
INSERT INTO TERM (id, name) VALUES (40, 'whi') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (40, 'whi') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (40, 40) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (1, 40, 3);

-- Term: relat (not a stop word)
INSERT INTO TERM (id, name) VALUES (41, 'relat') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (41, 'relat') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (41, 41) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (1, 41, 2);
