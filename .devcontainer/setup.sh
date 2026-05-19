#!/bin/bash
set -e

echo "==> Instalando dependencias del backend..."
cd backend
pip install --upgrade pip
pip install -r requirements.txt
cd ..

echo "==> Instalando dependencias del frontend..."
cd frontend
npm install
cd ..

echo "==> Copiando archivos .env de ejemplo..."
cp backend/.env.example backend/.env
cp frontend/.env.example frontend/.env

echo ""
echo "✓ TreeTrack listo."
echo ""
echo "  Backend:  cd backend && uvicorn app.main:app --reload --port 8000"
echo "  Frontend: cd frontend && npm run dev"
echo ""
