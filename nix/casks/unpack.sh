shopt -s extglob
DEST="$PWD"
TEMP=$(mktemp -d -t ci-XXXXXXXXXX)
MOUNTED=0

function cleanup {
    if [ $MOUNTED -eq 1 ]; then
        /usr/bin/hdiutil detach "$TEMP" -force
    fi
    rm -rf "$TEMP"
}

trap cleanup EXIT

FILE_NAME=$(basename "$src")

case "$FILE_NAME" in
    *.zip)
        unzip -d "$TEMP" "$src"
        cd "$TEMP" && cp -a . "$DEST" && cd "$DEST"
        ;;
    *.dmg)
        echo "Y" | /usr/bin/hdiutil attach -nobrowse -readonly "$src" -mountpoint "$TEMP"
        MOUNTED=1
        cd "$TEMP" && cp -a !(Applications) "$DEST/"
        ;;
    *.tar.bz2)
        tar -xjf "$src" -C "$TEMP"
        cd "$TEMP" && cp -a . "$DEST" && cd "$DEST"
        ;;
    *)
        echo "Unknown file type: $FILE_NAME"
        exit 1
        ;;
esac
