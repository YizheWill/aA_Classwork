
PRAGMA foreign_keys = ON;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL

);
INSERT INTO
  users (fname, lname)
VALUES
  ('James', 'Spearman'),
  ('Yizhe', 'Wang');

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  users_id INTEGER NOT NULL,
  FOREIGN KEY (users_id) REFERENCES users(id)
);

INSERT INTO
  questions (title, body, users_id) -- what about the id?
VALUES
  ('what are we supposed to be doing?', 'I feel lost!', (SELECT id FROM users WHERE fname = 'James')),
  ('2020', 'Will this ever end?', (SELECT id FROM users WHERE fname = 'Yizhe'));

CREATE TABLE questions_follows (
  id INTEGER PRIMARY KEY,
  users_id INTEGER,
  questions_id INTEGER,
  FOREIGN KEY (users_id) REFERENCES users(id),
  FOREIGN KEY (questions_id) REFERENCES questions(id)
);

INSERT INTO
  questions_follows (users_id,questions_id)
VALUES
  ((SELECT id FROM users WHERE fname = 'James'),(SELECT id FROM questions WHERE title = 'what are we supposed to be doing?')),
  ((SELECT id FROM users WHERE fname = 'James'),(SELECT id FROM questions WHERE title = '2020')),
  ((SELECT id FROM users WHERE fname = 'Yizhe'),(SELECT id FROM questions WHERE title = 'what are we supposed to be doing?'));
  

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  subject_question_id INTEGER NOT NULL,
  parent_reply_id INTEGER,
  users_id INTEGER NOT NULL,
  body TEXT,
  FOREIGN KEY (subject_question_id) REFERENCES questions(id),
  FOREIGN KEY (parent_reply_id) REFERENCES replies(id),
  FOREIGN KEY (users_id) REFERENCES users(id)
);

INSERT INTO
  replies (subject_question_id,parent_reply_id,users_id,body)
VALUES
  ((SELECT id FROM questions WHERE title = 'what are we supposed to be doing?'),NULL,(SELECT id FROM users WHERE fname = 'Yizhe'),'Joe knows'),
  ((SELECT id FROM questions WHERE title = 'what are we supposed to be doing?'),(SELECT id FROM replies WHERE body = 'Joe knows'),(SELECT id FROM users WHERE fname = 'James'),'I don''t what to write'),
  ((SELECT id FROM questions WHERE title = '2020'),NULL,(SELECT id FROM users WHERE fname = 'James'),'Please let 2021 come soon');
  

CREATE TABLE question_likes (
  id INTEGER PRIMARY KEY,
  users_id INTEGER NOT NULL,
  questions_id INTEGER,
  FOREIGN KEY (users_id) REFERENCES users(id),
  FOREIGN KEY (questions_id) REFERENCES questions(id)
);

-- Insert rows into table 'TableName'
INSERT INTO question_likes
  (users_id, questions_id)
VALUES
  ((SELECT id FROM users WHERE fname = 'James'),(SELECT id FROM questions WHERE title = 'what are we supposed to be doing?')),
  ((SELECT id FROM users WHERE fname = 'James'),(SELECT id FROM questions WHERE title = '2020')),
  ((SELECT id FROM users WHERE fname = 'Yizhe'),(SELECT id FROM questions WHERE title = 'what are we supposed to be doing?'));

