#!/bin/sh

SOURCE_URL="http://takeda-toshiya.my.coocan.jp/common/source.7z"
SOURCE_FILE="source.7z"

echo "==================================================================="
echo "このスクリプトはCommon Source Code Projectのソースを"
echo "ダウンロードし、パッチを適用します。"
echo ""
echo "元ソース: $SOURCE_URL"
echo "このプロジェクトはGPLv2 or Laterでライセンスされています。"
echo "詳細については、同梱のLICENSEファイルをご覧ください。"
echo ""
echo "※(4/28/2025)版以外は正常に動作しない可能性があります。"
echo "==================================================================="
echo ""

read -p "続行しますか？ (y/n): " confirmation
if [ "$confirmation" != "y" ]; then
    echo "操作をキャンセルしました"
    exit 1
fi

rm -rf orig
rm -rf src
curl -L -o "$SOURCE_FILE" "$SOURCE_URL"
if [ $? -ne 0 ]; then
    echo "ダウンロードに失敗しました"
    exit 1
fi

mkdir orig
echo "アーカイブを展開しています..."
7z x source.7z -o./orig/
if [ $? -ne 0 ]; then
    echo "アーカイブの展開に失敗しました"
    exit 1
fi

cp -r ./orig/source/src src
cd src

echo "パッチを適用しています..."
patch -p1 < ../cscp_sdl2.patch
if [ $? -ne 0 ]; then
    echo "パッチの適用に失敗しました"
    cd ..
    exit 1
fi
cd ..

echo "done!"
