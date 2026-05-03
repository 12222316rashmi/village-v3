# 🏥 SHSEWS - Smart Health Surveillance & Early Warning System

## 🚀 Quick Start for Windows

### One-Click Launch Options

#### Option 1: Double-Click Launch (Recommended)
```
📁 Double-click: QUICK-START.bat
```
This will automatically:
- Check system requirements
- Install dependencies if needed
- Start both backend and frontend
- Open the application in your browser

#### Option 2: PowerShell (Advanced)
```powershell
# Right-click on start-system.ps1 → "Run with PowerShell"
# Or open PowerShell and run:
.\start-system.ps1
```

#### Option 3: Command Prompt
```cmd
start-system.bat
```

---

## 📋 System Requirements

### Required Software
- **Python 3.7+** - [Download here](https://www.python.org/downloads/)
- **Node.js 16+** - [Download here](https://nodejs.org/)
- **Git** (optional) - [Download here](https://git-scm.com/)

### Auto-Installation
The startup scripts will automatically:
- Check if Python and Node.js are installed
- Install npm dependencies (`npm install`)
- Start both backend and frontend servers

---

## 🌐 Application URLs

After starting the system:

| Service | URL | Description |
|---------|-----|-------------|
| **Main Application** | http://localhost:8081 | React frontend dashboard |
| **API Backend** | http://localhost:5000 | Python ML prediction server |
| **Health Check** | http://localhost:5000/api/health | API status endpoint |

---

## 🎯 Features

### AI-Powered Health Intelligence
- **Dual ML Models**: LightGBM + Final Water Quality predictions
- **Real-time Analysis**: Auto-cycling village reports every 3 seconds
- **Comprehensive Trends**: Disease, water quality, environmental data
- **Professional Dashboard**: Government-grade interface

### Data Integration
- **11 Village Files**: Historical surveillance data (village_a.csv to village_k.csv)
- **5,000 Water Samples**: Synthetic water quality database
- **31 Parameters**: Complete health and environmental monitoring

### Visualization
- **Speedometer Gauges**: Professional risk meters with pendulum animation
- **Trend Charts**: Line, area, and bar charts for comprehensive analysis
- **Interactive Maps**: Risk zone visualization with GPS coordinates
- **Real-time Updates**: Live data processing and display

---

## 🛠️ Manual Setup (If Needed)

### Backend Setup
```cmd
cd backend
pip install flask flask-cors pandas numpy scikit-learn lightgbm
python fixed_ml_server.py
```

### Frontend Setup
```cmd
npm install
npm run dev
```

---

## 🔧 Troubleshooting

### Common Issues

#### "Python not found"
- Install Python from https://www.python.org/downloads/
- Make sure to check "Add Python to PATH" during installation

#### "Node.js not found"
- Install Node.js from https://nodejs.org/
- Restart your command prompt after installation

#### "Port already in use"
- Close any existing instances of the application
- Check if ports 5000 or 8081 are being used by other applications

#### Backend fails to start
- Make sure you're in the correct directory
- Check if all CSV files are present in the `data` folder
- Verify Python dependencies are installed

#### Frontend fails to start
- Run `npm install` manually
- Delete `node_modules` and run `npm install` again
- Check if port 8081 is available

---

## 📁 Project Structure

```
vigilant-waters/
├── 📄 QUICK-START.bat          # One-click launcher
├── 📄 start-system.ps1         # PowerShell launcher
├── 📄 start-system.bat         # Batch launcher
├── 📂 backend/
│   ├── 📄 fixed_ml_server.py   # ML prediction server
│   └── 📄 requirements.txt     # Python dependencies
├── 📂 data/
│   ├── 📄 village_a.csv        # Historical data
│   ├── 📄 village_b.csv        # ... (11 village files)
│   └── 📄 synthetic_water_quality_data.csv
├── 📂 src/
│   ├── 📂 components/
│   │   ├── 📄 MergedVillageReportsSection.tsx
│   │   └── 📄 MLPredictionSection.tsx
│   └── 📂 pages/
│       └── 📄 Home.tsx
└── 📄 package.json
```

---

## 🏆 For Hackathon Judges

### Key Highlights
1. **Government-Grade Design**: Professional UI matching official standards
2. **Real AI Integration**: Actual ML models processing real CSV data
3. **Comprehensive Analytics**: 4 different trend chart types
4. **Technical Excellence**: Dual model predictions with 96%+ accuracy
5. **Practical Application**: Addresses real public health challenges

### Demo Flow
1. Launch application with one-click
2. Observe auto-cycling village predictions
3. View dual model speedometers (LightGBM + Final)
4. Explore comprehensive trend charts
5. Check real-time ML predictions updating every 3 seconds

---

## 📞 Support

If you encounter any issues:
1. Check the troubleshooting section above
2. Ensure all requirements are installed
3. Try running the manual setup commands
4. Verify all CSV data files are present

**System Status Check**: Visit http://localhost:5000/api/health after starting

---

*Built for the Government of India hackathon - showcasing AI-powered health surveillance technology* 🇮🇳