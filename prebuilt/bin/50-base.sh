#!/sbin/sh
# 
# /system/addon.d/50-base.sh
# During a upgrade, this script backs up /system/etc/hosts,
# /system is formatted and reinstalled, then the file is restored.
#

. /tmp/backuptool.functions

list_files() {
cat <<EOF
etc/hosts
EOF
}

case "$1" in
  backup)
    list_files | while read FILE DUMMY; do
      backup_file $S/"$FILE"
      backup_file $V/"$FILE"
    done
  ;;
  restore)
    list_files | while read FILE REPLACEMENT; do
      R=""
      R2=""
      [ -n "$REPLACEMENT" ] && R="$S/$REPLACEMENT"
      [ -f "$C/$S/$FILE" ] && restore_file $S/"$FILE" "$R"
      [ -n "$REPLACEMENT" ] && R2="$V/$REPLACEMENT"
      [ -f "$C/$S/$FILE" ] && restore_file $V/"$FILE" "$R2"
    done
  ;;
  pre-backup)
    # Stub
  ;;
  post-backup)
    # Stub
  ;;
  pre-restore)
    # Stub
  ;;
  post-restore)
    # Stub
  ;;
esac
