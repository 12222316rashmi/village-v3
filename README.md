<div align="center">

<h1>🏥 SHSEWS</h1>
<h3>Smart Health Surveillance & Early Warning System</h3>
<p><em>AI-powered disease outbreak prediction for rural villages — powered by LightGBM, water quality analysis, and real-time ensemble ML models</em></p>

<br/>

![React](https://img.shields.io/badge/React-20232A?style=for-the-badge&logo=react&logoColor=61DAFB)
![TypeScript](https://img.shields.io/badge/TypeScript-007ACC?style=for-the-badge&logo=typescript&logoColor=white)
![Python](https://img.shields.io/badge/Python-3776AB?style=for-the-badge&logo=python&logoColor=white)
![Tailwind CSS](https://img.shields.io/badge/Tailwind_CSS-38B2AC?style=for-the-badge&logo=tailwind-css&logoColor=white)
![Supabase](https://img.shields.io/badge/Supabase-3ECF8E?style=for-the-badge&logo=supabase&logoColor=white)
![Vite](https://img.shields.io/badge/Vite-646CFF?style=for-the-badge&logo=vite&logoColor=white)

<br/>

| 📡 System Uptime | 📉 Outbreak Reduction | 🗄️ Data Points | ⚡ Alert Response |
|:-:|:-:|:-:|:-:|
| **99.7%** | **47%** | **50M+** | **3.2s** |

</div>

---

## 📸 Screenshots

<table>
  <tr>
    <td align="center" width="50%">
      <strong>🏠 Home — AI-Powered Disease Prevention</strong><br/><br/>
      <img src="public/S1.png" alt="Homepage Hero" width="100%"/>
    </td>
    <td align="center" width="50%">
      <strong>🧠 ML Prediction Configuration</strong><br/><br/>
      <img src="public/S1A.png" alt="ML Prediction Config" width="100%"/>
    </td>
  </tr>
  <tr>
    <td align="center" width="50%">
      <strong>📊 Village Intelligence Dashboard</strong><br/><br/>
      <img src="public/S5.png" alt="Village Health Intelligence" width="100%"/>
    </td>
    <td align="center" width="50%">
      <strong>⚠️ AI Alerts & ML Recommendations</strong><br/><br/>
      <img src="public/S3.png" alt="AI Alerts and Recommendations" width="100%"/>
    </td>
  </tr>
  <tr>
    <td align="center" width="50%">
      <strong>📈 Trend Analysis — Disease, Water & Environment</strong><br/><br/>
      <img src="public/S2.png" alt="Trend Charts" width="100%"/>
    </td>
    <td align="center" width="50%">
      <strong>🤖 Ensemble Model Performance</strong><br/><br/>
      <img src="public/S4.png" alt="Model Performance" width="100%"/>
    </td>
  </tr>
</table>

---

## ✨ Key Features

- **🔮 7-Day Outbreak Prediction** — LightGBM and water quality ML models forecast disease outbreaks up to 7 days in advance
- **🤖 Dual-Model Ensemble** — Combines historical surveillance data (LightGBM, 94.2% accuracy) with water chemical analysis (89.7% accuracy) for a 96.1% ensemble accuracy
- **📡 Real-Time Monitoring** — Continuous tracking of disease cases, water quality (pH, turbidity, contamination), and environmental conditions across 11 villages
- **⚠️ AI-Generated Alerts** — Instant automated alerts for high case counts, critical water contamination, and abnormal pH levels
- **💡 ML Recommendations** — Actionable guidance (deploy testing kits, enhance water treatment, increase ASHA monitoring frequency)
- **🗺️ Multi-Village Coverage** — Unified dashboard monitoring Villages A–K with per-village drill-down
- **🔐 Role-Based Access** — Separate dashboards for ASHA workers, PHC staff, District officers, and State administrators
- **📊 Rich Analytics** — Interactive charts for Disease Case Trends, Water Quality Trends, Environmental Trends, and Health System Load

---

## 🏗️ Architecture

```
┌─────────────────────────────────────────────────────┐
│                   React Frontend                     │
│  Vite · TypeScript · Tailwind CSS · shadcn/ui        │
│                                                      │
│  Home ─ ASHA Dashboard ─ PHC ─ District ─ State      │
│  ML Prediction Page ─ Village Reports               │
└────────────────────┬────────────────────────────────┘
                     │ REST / Edge Functions
          ┌──────────┴──────────┐
          │     Supabase        │           ┌────────────────────┐
          │  Auth · Database    │◄─────────►│  Python ML Server  │
          │  Edge Functions     │           │  LightGBM · Flask  │
          └─────────────────────┘           │  Water Quality ML  │
                                            └────────────────────┘
```

---

## 🤖 ML Models

| Model | Data Source | Accuracy | Precision | F1-Score |
|---|---|---|---|---|
| **LightGBM** | Historical surveillance | 94.2% | 91.8% | 93.1% |
| **Final Water Quality** | Chemical analysis | 89.7% | 87.3% | 88.5% |
| **Ensemble (Combined)** | Both sources | **96.1%** | — | — |

---

## 🚀 Getting Started

### Prerequisites

- [Node.js](https://nodejs.org/) ≥ 18 with npm
- [Python](https://python.org/) ≥ 3.9 (for the ML backend)

### 1. Clone & Install

```sh
git clone <YOUR_GIT_URL>
cd <YOUR_PROJECT_NAME>
npm install
```

### 2. Start the Frontend

```sh
npm run dev
```

The app will be available at `http://localhost:8080`.

### 3. Start the ML Backend (optional)

```sh
cd backend
pip install -r requirements.txt
python ml_prediction_server.py
```

### 4. Train the Models (optional)

```sh
cd model
pip install -r requirements.txt
python train.py
```

---

## 🗂️ Project Structure

```
├── src/
│   ├── pages/              # Route-level pages (Home, Dashboards, ML, Login)
│   ├── components/         # Shared UI components (HeroSlider, MLPrediction, etc.)
│   ├── integrations/       # Supabase client & types
│   └── hooks/              # Custom React hooks
├── backend/                # Python Flask ML prediction server
├── model/                  # Model training scripts & requirements
├── data/                   # Village CSV datasets (A–K)
├── supabase/
│   ├── functions/          # Edge functions (ml-prediction, submit-report, alerts, etc.)
│   └── migrations/         # Database schema migrations
└── public/                 # Static assets & screenshots
```

---

## 🧑‍💻 Tech Stack

| Layer | Technology |
|---|---|
| **Frontend** | React 18, TypeScript, Vite |
| **Styling** | Tailwind CSS, shadcn/ui |
| **Backend/Auth** | Supabase (PostgreSQL + Edge Functions) |
| **ML Server** | Python, Flask, LightGBM |
| **Charts** | Recharts |
| **Data** | CSV village datasets (11 villages, synthetic water quality) |

---

## 📄 License

This project is built for public health research and rural health surveillance. Feel free to fork, adapt, and deploy for your region.

---

<div align="center">
  <sub>Built with ❤️ for rural health — Ministry of Health & Family Welfare, Government of India</sub>
</div>
