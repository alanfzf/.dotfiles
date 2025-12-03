# note as we use this script in nix there's no need for shebang

model="gpt-5-mini"
diff_output="$(git diff --cached)"

if [ -z "$diff_output" ]; then
  echo "No staged changes."
  exit 1
fi


prompt="
Por favor sugiere 10 mensajes de commit, dado el siguiente diff:

\`\`\`diff
$diff_output
\`\`\`

**Instrucciones**:
1. Por favor solo responde con los mensajes de commit sugeridos, sin explicaciones adicionales.
2. **Formato** <tipo>[alcance][!]: descripción
   - **tipo**: build, feat, fix, chore, ci, docs, perf, refactor, revert, style, test
   - **alcance**: opcional, puede ser cualquier cosa que indique el área del código afectada
   - **!**: opcional, indica un cambio que rompe compatibilidad
   - **descripción**: breve resumen de los cambios realizados
2. **Relevancia**: Evitar mencionar el nombre de un módulo a menos que sea directamente relevante para el cambio.
3. Claridad y brevedad: Cada mensaje debe comunicar de forma clara y concisa el cambio realizado, tratar de evitar superar los 50 caracteres

**Ejemplos**:
1. build: actualizar configuración de Webpack para soportar módulos ES
2. feat: agregar filtro de búsqueda avanzada en la vista de productos
3. fix: corregir error que impedía guardar usuarios sin correo secundario
4. chore: limpiar dependencias no utilizadas en package.json
5. ci: ajustar workflow de GitHub Actions para ejecutar pruebas en Node 20
6. docs: actualizar guía de instalación con nuevos requisitos del sistema
7. perf: optimizar consulta SQL para reducir el tiempo de carga del dashboard
8. refactor: reorganizar componentes para mejorar la legibilidad del código
9. revert: revert 'feat: agregar autenticación por OTP'
10. style: aplicar formateo estándar según prettier
11. test: agregar pruebas unitarias para el módulo de validación de formularios
"

# result=$()
copilot --model "$model" -s -p "$prompt" \
  | fzf --ansi \
  | cat
