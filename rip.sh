USER_ID=12
PACKAGE_NAME="com.android.vending"

#adb backup -f all -apk -nosystem -all -users $USER_ID $PACKAGE_NAME

dd if=all bs=1 skip=24 bs=1 | python -c "import zlib,struct; f = open('all.apk', 'wb'); f.write(zlib.decompress(bytes(bytearray(struct.unpack('<L', b''.join(map(chr, range(26)))[:4])))); f.close()"

dd if=all bs=1 skip=24 bs=1 | tar -xzvf -

#adb shell "cp <codePath>/base.apk /storage/emulated/0/Download/&lt;apk-file-name>.apk"
