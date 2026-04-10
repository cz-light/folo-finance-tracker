CREATE TABLE users (
  id          SERIAL PRIMARY KEY,
  email       VARCHAR(255) UNIQUE NOT NULL,
  password    VARCHAR(255) NOT NULL,
  name        VARCHAR(255) NOT NULL,
  created_at  TIMESTAMP DEFAULT NOW()
);

CREATE TABLE categories (
  id       SERIAL PRIMARY KEY,
  user_id  INTEGER REFERENCES users(id) ON DELETE CASCADE,
  name     VARCHAR(100) NOT NULL,
  color    VARCHAR(7) DEFAULT '#888888'
);

CREATE TABLE transactions (
  id           SERIAL PRIMARY KEY,
  user_id      INTEGER REFERENCES users(id) ON DELETE CASCADE,
  category_id  INTEGER REFERENCES categories(id) ON DELETE SET NULL,
  amount       NUMERIC(10,2) NOT NULL,
  type         VARCHAR(10) CHECK (type IN ('income','expense')) NOT NULL,
  description  VARCHAR(255),
  date         DATE NOT NULL,
  created_at   TIMESTAMP DEFAULT NOW()
);

CREATE TABLE budgets (
  id           SERIAL PRIMARY KEY,
  user_id      INTEGER REFERENCES users(id) ON DELETE CASCADE,
  category_id  INTEGER REFERENCES categories(id) ON DELETE CASCADE,
  month        VARCHAR(7) NOT NULL,
  limit_amount NUMERIC(10,2) NOT NULL,
  UNIQUE(user_id, category_id, month)
);