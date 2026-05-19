# TreeTrack 🌳

Predicción de especies arbóreas óptimas para reforestar en México, usando Machine Learning y datos abiertos del INEGI, CONAFOR y Open-Meteo.

**Gratuito y de código abierto.**

---

## ¿Qué hace?

Dado un punto GPS en México, el modelo predice qué especies tienen mayor probabilidad de sobrevivir y prosperar en ese lugar, considerando clima, suelo, altitud, e historial forestal de la zona.

El usuario recibe:
- Top 5 especies recomendadas con score de probabilidad
- Explicación de por qué cada especie es adecuada (SHAP values)
- Época óptima de siembra
- Viveros CONAFOR cercanos

---

## Stack

| Capa | Tecnología |
|---|---|
| Backend | FastAPI + Python 3.11 |
| ML | scikit-learn · XGBoost · SHAP |
| Datos climáticos | Open-Meteo API (gratuita) |
| Datos geográficos | INEGI API |
| Dataset entrenamiento | INFyS 2015-2020 (CONAFOR/SEMARNAT) |
| Frontend | React + Vite |
| Base de datos | PostgreSQL + PostGIS |
| Hosting backend | Railway |
| Hosting frontend | Vercel |

---

## Correr en local

### Requisitos
- Python 3.11
- Node 20
- (Opcional) Docker para PostgreSQL

### Backend
```bash
cd backend
pip install -r requirements.txt
cp .env.example .env        # agrega tu token INEGI
uvicorn app.main:app --reload --port 8000
```

### Frontend
```bash
cd frontend
npm install
cp .env.example .env        # VITE_API_URL=http://localhost:8000
npm run dev
```

La API estará en `http://localhost:8000/docs` (Swagger automático de FastAPI).

---

## Datasets utilizados

| Dataset | Fuente | Descripción |
|---|---|---|
| INFyS 2015-2020 | CONAFOR / INEGI | ~26,000 conglomerados con especie, condición, coordenadas |
| Cartas de uso de suelo | INEGI Serie VII | Tipo de vegetación por polígono |
| Mapa de suelos | INEGI 1:250,000 | Tipo de suelo por coordenada |
| Clima histórico | Open-Meteo ERA5 | Temperatura, precipitación, heladas por punto GPS |
| DEM | INEGI ContinuoMex | Altitud y pendiente |

Los datos crudos no están en el repo (`data/raw/` está en `.gitignore`). Ver `data/README.md` para instrucciones de descarga.

---

## Estructura del repo

```
treetrack/
├── .devcontainer/     # Config de GitHub Codespaces
├── backend/
│   ├── app/           # FastAPI (routers, services, schemas)
│   ├── ml/            # Entrenamiento y artefactos del modelo
│   └── notebooks/     # EDA y experimentación
├── frontend/          # React + Vite
├── data/              # Procesado (raw en .gitignore)
└── .github/workflows/ # CI/CD → Railway + Vercel
```

---

## Contribuir

Pull requests bienvenidos. Abre un issue primero para discutir cambios grandes.
