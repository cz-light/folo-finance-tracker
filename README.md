# Folo — Personal Finance Tracker

> Track income, expenses, and budgets with a clean
> dashboard and real-time category insights.

**Live demo:** _coming soon_
**Portfolio:** https://cz-light.github.io

---

## Tech stack
- **Frontend:** React · TypeScript · Recharts
- **Backend:** Node.js · Express
- **Database:** PostgreSQL · Prisma ORM
- **Auth:** JWT
- **Deployed:** Vercel (frontend) · Render (backend)

---

## Features
- [ ] User signup and login (JWT auth)
- [ ] Add, edit, delete transactions
- [ ] Category tags per transaction
- [ ] Monthly budget limits per category
- [ ] Spending dashboard with charts
- [ ] REST API with full CRUD

---

## Screenshots
_Coming soon_

---

## Local setup
```bash
git clone https://github.com/cz-light/folo-finance-tracker
cd folo-finance-tracker
cp .env.example .env   # fill in your values
# follow client and server setup below
```

### Server
```bash
cd server
npm install
npm run dev
```

### Client
```bash
cd client
npm install
npm start
```

---

## Project structure
```
folo-finance-tracker/
├── client/          # React frontend
│   └── src/
│       ├── components/
│       ├── pages/
│       ├── hooks/
│       └── utils/
├── server/          # Node.js backend
│   └── src/
│       ├── routes/
│       ├── controllers/
│       ├── middleware/
│       ├── models/
│       └── utils/
└── docs/
    └── screenshots/
```

---

## What I learned
_To be written on project completion._