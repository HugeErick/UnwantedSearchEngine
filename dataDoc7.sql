-- Insert DOCUMENT record for document 7
INSERT INTO DOCUMENT (id, url, title, author, date) VALUES
(7, 'https://www.nationalgeographic.com.es/mundo-ng/guerra-entre-rusia-y-ucrania-conflicto-explicado-manera-sencilla_17909', 
 'The Russia-Ukraine War Explained Simply', 'National Geographic', CURRENT_TIMESTAMP);

-- Insert high-value terms only
INSERT INTO TERM (id, name) VALUES (701, 'rusia') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (701, 'rusia') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (701, 701) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (7, 701, 5);

INSERT INTO TERM (id, name) VALUES (702, 'ucrania') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (702, 'ucrania') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (702, 702) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (7, 702, 4);

INSERT INTO TERM (id, name) VALUES (703, 'kiev') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (703, 'kiev') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (703, 703) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (7, 703, 4);

INSERT INTO TERM (id, name) VALUES (704, 'conflicto') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (704, 'conflicto') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (704, 704) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (7, 704, 2);

INSERT INTO TERM (id, name) VALUES (705, 'europa') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (705, 'europa') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (705, 705) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (7, 705, 2);

INSERT INTO TERM (id, name) VALUES (706, 'serra') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (706, 'serra') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (706, 706) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (7, 706, 4);

INSERT INTO TERM (id, name) VALUES (707, 'relacion') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (707, 'relacion') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (707, 707) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (7, 707, 3);

INSERT INTO TERM (id, name) VALUES (708, 'histrica') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (708, 'histrica') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (708, 708) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (7, 708, 2);

INSERT INTO TERM (id, name) VALUES (709, 'rus') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (709, 'rus') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (709, 709) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (7, 709, 3);

INSERT INTO TERM (id, name) VALUES (710, 'mediev') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (710, 'mediev') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (710, 710) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (7, 710, 2);

INSERT INTO TERM (id, name) VALUES (711, 'nation') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (711, 'nation') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (711, 711) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (7, 711, 2);

INSERT INTO TERM (id, name) VALUES (712, 'geograph') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (712, 'geograph') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (712, 712) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (7, 712, 2);

INSERT INTO TERM (id, name) VALUES (713, 'francesc') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (713, 'francesc') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (713, 713) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (7, 713, 3);
