-- Insert DOCUMENT record for document 3
INSERT INTO DOCUMENT (id, url, title, author, date) VALUES
(3, 'https://cnnespanol.cnn.com/2025/02/24/mundo/por-que-rusia-guerra-ucrania-motivos-orix', 
 'Why is Russia at War with Ukraine?', 'CNN Español', CURRENT_TIMESTAMP);

-- Insert terms and words first, then represents with safety checks
-- Term: trump (important name, frequency 3)
INSERT INTO TERM (id, name) VALUES (301, 'trump') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (301, 'trump') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (301, 301) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (3, 301, 3);

-- Term: rusia (key subject, frequency 3)
INSERT INTO TERM (id, name) VALUES (302, 'rusia') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (302, 'rusia') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (302, 302) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (3, 302, 3);

-- Term: ucrania (key subject, frequency 6)
INSERT INTO TERM (id, name) VALUES (303, 'ucrania') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (303, 'ucrania') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (303, 303) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (3, 303, 6);

-- Term: guerra (key concept, frequency 3)
INSERT INTO TERM (id, name) VALUES (304, 'guerra') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (304, 'guerra') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (304, 304) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (3, 304, 3);

-- Term: febrero (specific date, frequency 2)
INSERT INTO TERM (id, name) VALUES (305, 'febrero') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (305, 'febrero') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (305, 305) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (3, 305, 2);

-- Term: soldado (military term, frequency 2)
INSERT INTO TERM (id, name) VALUES (306, 'soldado') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (306, 'soldado') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (306, 306) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (3, 306, 2);

-- Term: territorio (geopolitical term, frequency 2)
INSERT INTO TERM (id, name) VALUES (307, 'territorio') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (307, 'territorio') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (307, 307) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (3, 307, 2);

-- Term: prorruso (political term, frequency 2)
INSERT INTO TERM (id, name) VALUES (308, 'prorruso') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (308, 'prorruso') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (308, 308) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (3, 308, 2);

-- Term: zelenski (key name, frequency 2)
INSERT INTO TERM (id, name) VALUES (309, 'zelenski') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (309, 'zelenski') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (309, 309) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (3, 309, 2);

-- Term: eeuu (country acronym, frequency 2)
INSERT INTO TERM (id, name) VALUES (310, 'eeuu') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (310, 'eeuu') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (310, 310) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (3, 310, 2);

-- Term: president (title, frequency 3)
INSERT INTO TERM (id, name) VALUES (311, 'president') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (311, 'president') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (311, 311) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (3, 311, 3);

-- Term: europa (geopolitical term, frequency 2)
INSERT INTO TERM (id, name) VALUES (312, 'europa') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (312, 'europa') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (312, 312) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (3, 312, 2);

-- Term: mundo (important concept, frequency 2)
INSERT INTO TERM (id, name) VALUES (313, 'mundo') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (313, 'mundo') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (313, 313) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (3, 313, 2);

-- Term: paz (important concept, frequency 2)
INSERT INTO TERM (id, name) VALUES (314, 'paz') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (314, 'paz') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (314, 314) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (3, 314, 2);

-- Term: rebeld (political term, frequency 2)
INSERT INTO TERM (id, name) VALUES (315, 'rebeld') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (315, 'rebeld') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (315, 315) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (3, 315, 2);

-- Term: donb (geopolitical region, frequency 2)
INSERT INTO TERM (id, name) VALUES (316, 'donb') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (316, 'donb') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (316, 316) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (3, 316, 2);
