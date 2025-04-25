# Common Source Code Project SDL2版

このプロジェクトは、TAKEDA, toshiyaさんの「Common Source Code Project」をSDL2環境で動作するように移植したものです。

## 概要

- 元となったCommon Source Code Projectは2024年1月1日版を使用しています
- SDL2を利用することで、クロスプラットフォームでの実行を可能にしています
- 全体的に実装途中の実験的プロジェクトであり、動作が不安定な場合があります

## ビルド方法

```bash
make
```

現状、SHARP X1のみの対応になります。

MakefileにはSHARP X1に必要なソースが記述され、-D_X1 という定義によりX1向けのビルドがされる状態になっています。この部分を書き換える事で他機種にも対応させられる可能性があります。

## 特記事項

- このプロジェクトはAIによる開発の実験的な取り組みの一環として作成されており、一部不思議なコードが含まれている場合があります
- 実験的な性質上、バグや問題点の報告をいただいても対応できない場合があることをご了承ください

## 謝辞

この場を借りて、素晴らしいエミュレータプロジェクトを開発・公開してくださったTAKEDA, toshiyaさんに心より感謝申し上げます。Common Source Code Projectがなければ、このプロジェクトは実現しませんでした。

## ライセンス

このプロジェクトは GNU General Public License Version 2 (GPLv2) の下で公開されています。詳細は [license/COPYING.txt](license/COPYING.txt) をご覧ください。

原作者のCommon Source Code Projectに関する著作権は、TAKEDA, toshiyaさんに帰属します。 