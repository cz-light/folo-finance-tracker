require('dotenv').config();
const express = require('express');
const cors = require('cors');

const authRoutes        = require('./routes/auth');
const transactionRoutes = require('./routes/transactions');
const categoryRoutes    = require('./routes/categories');
const budgetRoutes      = require('./routes/budgets');

const app = express();

app.use(cors({ origin: process.env.CLIENT_URL }));
//uncomment to take client out of testing
//app.use(cors());
app.use(express.json());

app.get('/health', (req, res) => {
  res.json({ status: 'ok', message: 'Folo API is running' });
});

const pool = require('./db');

app.get('/api/ping-db', async (req, res) => {
  try {
    const result = await pool.query('SELECT NOW() as time');
    res.json({ db_time: result.rows[0].time });
  } catch (err) {
    res.status(500).json({ error: err.message });
  }
});

app.use('/api/auth',         authRoutes);
app.use('/api/transactions', transactionRoutes);
app.use('/api/categories',   categoryRoutes);
app.use('/api/budgets',      budgetRoutes);

app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).json({ error: 'Something went wrong' });
});

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
  console.log(`Folo server running on port ${PORT}`);
});