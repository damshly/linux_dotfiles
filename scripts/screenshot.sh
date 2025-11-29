#!/bin/bash

# تأكد إنو المجلد موجود
mkdir -p ~/Pictures

# لقطة شاشة كاملة
grim ~/Pictures/screenshot-$(date +%F_%T).png
