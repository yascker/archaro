#!/bin/bash

# Script para configurar la zona horaria y otros parámetros del sistema

# Establecer la zona horaria a Buenos Aires, Argentina
ln -sf /usr/share/zoneinfo/America/Argentina/Buenos_Aires /etc/localtime

# Sincronizar el reloj del hardware con la hora del sistema
hwclock --systohc

# Generar la configuración de locales para el idioma español (Argentina)
echo "es_AR.UTF-8 UTF-8" > /etc/locale.gen
locale-gen  # Ejecutar la generación de locales

# Establecer el idioma del sistema a español (Argentina)
echo "LANG=es_AR.UTF-8" > /etc/locale.conf

# Configurar el mapa de teclado a español
echo "KEYMAP=es" > /etc/vconsole.conf

# Establecer el nombre del host del sistema a "archaro"
echo "archaro" > /etc/hostname
