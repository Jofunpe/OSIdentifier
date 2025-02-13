# OSIdentifier
Este script determina el sistema operativo de una máquina a partir de su dirección IP. Se basa en enviar un ping y extraer el valor TTL de la respuesta ICMP para inferir si el objetivo utiliza:

- **Linux/Unix:** TTL ≈ 64  
- **Windows:** TTL ≈ 128

> **Nota:** Aunque en el panel de ayuda se mencionan otros sistemas (macOS, Solaris, freeBSD, Android, iOS), el script actualmente solo distingue entre Linux y Windows.

---

## Cómo Funciona

1. **Ping a la IP:**  
   El script envía un ping a la dirección IP proporcionada.

2. **Extracción del TTL:**  
   De la respuesta, extrae el valor del TTL.

3. **Detección del SO:**  
   Compara el TTL obtenido con valores típicos:
   - TTL ≤ 64: Se asume que es un sistema Linux.
   - TTL entre 65 y 128: Se asume que es un sistema Windows.

4. **Salida:**  
   Muestra el resultado en pantalla, indicando el TTL y la posible clasificación del sistema operativo.

---

## Uso

Para usarlo, simplemente ejecuta el script seguido de la IP víctima.  
Para acceder al panel de ayuda, ejecuta el script con el parámetro `-h` o `--help`, o sin parámetros.

---

## Autor 

Script desarrollado por jofunpe, más info en https://jofunpe.com

