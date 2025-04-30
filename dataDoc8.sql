-- Insert DOCUMENT record for document 8
INSERT INTO DOCUMENT (id, url, title, author, date) VALUES
(8, 'https://www.bbc.com/mundo/articles/cnvzy3ryqe8o', 
 'Russia-Ukraine War: Key Developments', 'BBC Mundo', CURRENT_TIMESTAMP);

-- Insert high-value terms only
INSERT INTO TERM (id, name) VALUES (801, 'ucrania') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (801, 'ucrania') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (801, 801) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (8, 801, 6);

INSERT INTO TERM (id, name) VALUES (802, 'rusia') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (802, 'rusia') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (802, 802) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (8, 802, 3);

INSERT INTO TERM (id, name) VALUES (803, 'guerra') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (803, 'guerra') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (803, 803) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (8, 803, 3);

INSERT INTO TERM (id, name) VALUES (804, 'invasin') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (804, 'invasin') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (804, 804) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (8, 804, 2);

INSERT INTO TERM (id, name) VALUES (805, 'fuerza') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (805, 'fuerza') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (805, 805) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (8, 805, 3);

INSERT INTO TERM (id, name) VALUES (806, 'territorio') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (806, 'territorio') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (806, 806) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (8, 806, 2);

INSERT INTO TERM (id, name) VALUES (807, 'ciudad') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (807, 'ciudad') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (807, 807) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (8, 807, 4);

INSERT INTO TERM (id, name) VALUES (808, 'pokrovsk') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (808, 'pokrovsk') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (808, 808) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (8, 808, 2);

INSERT INTO TERM (id, name) VALUES (809, 'avanc') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (809, 'avanc') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (809, 809) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (8, 809, 2);

INSERT INTO TERM (id, name) VALUES (810, 'frent') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (810, 'frent') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (810, 810) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (8, 810, 2);

INSERT INTO TERM (id, name) VALUES (811, 'kilmetro') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (811, 'kilmetro') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (811, 811) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (8, 811, 2);

INSERT INTO TERM (id, name) VALUES (812, 'ucraniana') ON CONFLICT (name) DO NOTHING;
INSERT INTO WORD (id, word) VALUES (812, 'ucraniana') ON CONFLICT (word) DO NOTHING;
INSERT INTO REPRESENTS (term_id, word_id) VALUES (812, 812) ON CONFLICT DO NOTHING;
INSERT INTO HAS (document_id, term_id, frequency) VALUES (8, 812, 2);
