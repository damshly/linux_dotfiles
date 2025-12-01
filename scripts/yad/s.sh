#!/bin/bash

CONFIG="$HOME/.config/hypr/hyprland.conf"
TEMP_CONFIG="/tmp/hypr_preview.conf"

# -----------------------------------------
# 1) إنشاء نسخة مؤقتة للعمل عليها
# -----------------------------------------
cp "$CONFIG" "$TEMP_CONFIG"

# -----------------------------------------
# 2) تعديل القيم على النسخة المؤقتة فقط
# -----------------------------------------
apply_changes() {
  sed -i "s/^ *gaps_in *= *.*/gaps_in = $GAPS_IN/" "$TEMP_CONFIG"
  sed -i "s/^ *gaps_out *= *.*/gaps_out = $GAPS_OUT/" "$TEMP_CONFIG"
  sed -i "s/^ *animations *= *.*/animations = $ANIMATIONS/" "$TEMP_CONFIG"
}

# -----------------------------------------
# 3) عرض نافذة YAD لجمع الإعدادات
# -----------------------------------------
values=$(yad --form \
  --title="Hyprland Settings" \
  --field="Inner Gaps":NUM "$GAPS_IN" \
  --field="Outer Gaps":NUM "$GAPS_OUT" \
  --field="Animations (yes/no)" "$ANIMATIONS" \
  --button="Preview:2" \
  --button="Apply:0" \
  --button="Cancel:1")

action=$?
IFS="|" read -r GAPS_IN GAPS_OUT ANIMATIONS <<<"$values"

if [[ $action -eq 1 ]]; then
  echo "Canceled… رجّع كلشي"
  rm "$TEMP_CONFIG"
  exit 0
fi

# -----------------------------------------
# 4) إذا الزر كان Preview → طبّق على المؤقت فقط
# -----------------------------------------
if [[ $action -eq 2 ]]; then
  apply_changes
  hyprctl reload "$TEMP_CONFIG"
  echo "Preview applied (temporary reload)"
  exit 0
fi

# -----------------------------------------
# 5) وإذا كان Apply → طبّق مؤقت ثم استبدل الأصلي
# -----------------------------------------
apply_changes
cp "$TEMP_CONFIG" "$CONFIG"
hyprctl reload
rm "$TEMP_CONFIG"

echo "Settings applied successfully"
