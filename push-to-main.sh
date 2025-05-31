#!/bin/bash

# === CONFIGURACIÓN ===
REMOTE_URL="git@github.com:notifuturo/notifuturo.git"

# Movernos a la carpeta del script
cd "$(dirname "$0")" || exit 1

# Inicializar repositorio si no existe
if [ ! -d .git ]; then
  echo "🔧 Inicializando repositorio Git..."
  git init
fi

# Añadir remoto origin si no existe
if git remote | grep -q origin; then
  echo "🔁 Remoto origin ya existe."
else
  echo "🔗 Añadiendo remoto origin..."
  git remote add origin "$REMOTE_URL"
fi

# Preparar archivos para commit
echo "📦 Añadiendo archivos..."
git add .

# Crear commit (si hay cambios)
echo "📝 Haciendo commit..."
git commit -m "Reemplazo completo del repositorio con nuevo sitio Hugo" || echo "⚠️ No hay cambios nuevos para commitear."

# Forzar push a la rama main
echo "🚀 Subiendo al repositorio GitHub (rama main)..."
git branch -M main
git push -f origin main

echo "✅ ¡Sitio publicado correctamente en la rama main de GitHub!"
