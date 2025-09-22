# LaTeX Container for Japanese Documents

このプロジェクトは、日本語LaTeX文書の作成に必要なパッケージとフォントを含むDockerコンテナを提供します。

## 特徴

- Ubuntu 24.04ベース
- 完全なTeXLive インストール
- 日本語フォント（IPA、Noto CJK）
- LaTeX関連ツール（latexmk、pandoc等）
- 複数プラットフォーム対応（AMD64、ARM64）

## 使用方法

### GitHub Container Registry から使用

```bash
# 最新版をプル
docker pull ghcr.io/ouvill/latexjp:latest

# LaTeX文書をコンパイル（カレントディレクトリをマウント）
docker run --rm -v $(pwd):/workspace ghcr.io/ouvill/latexjp:latest platex document.tex

# LuaLaTeXを使用
docker run --rm -v $(pwd):/workspace ghcr.io/ouvill/latexjp:latest lualatex document.tex

# latexmkを使用（推奨）
docker run --rm -v $(pwd):/workspace ghcr.io/ouvill/latexjp:latest latexmk -pdflua document.tex
```

### インタラクティブな使用

```bash
# コンテナに入ってインタラクティブに作業
docker run -it --rm -v $(pwd):/workspace ghcr.io/ouvill/latexjp:latest bash
```

### Docker Composeでの使用例

```yaml
services:
  latex:
    image: ghcr.io/ouvill/latexjp:latest
    volumes:
      - .:/workspace
    working_dir: /workspace
    command: latexmk -pdflua document.tex
```

## ローカルでのビルド

```bash
# リポジトリをクローン
git clone https://github.com/Ouvill/latexjp.git
cd latexjp

# イメージをビルド
docker build -t latexjp .

# 使用
docker run --rm -v $(pwd):/workspace latexjp platex document.tex
```

## GitHub Actions ワークフロー

このリポジトリには自動でGitHub Container Registry (GHCR) にコンテナイメージをビルド・プッシュするGitHub Actionsワークフローが含まれています。

### 自動ビルドのトリガー

- `main`または`master`ブランチへのプッシュ
- タグ（`v*`形式）の作成
- プルリクエスト
- 手動実行（workflow_dispatch）

### タグ付けルール

- `latest`: デフォルトブランチの最新コミット
- ブランチ名: ブランチ名がタグとして付与
- セマンティックバージョン: `v1.0.0`形式のタグから`1.0.0`、`1.0`、`1`が生成

## インストールされているパッケージ

- TeXLive Full
- 日本語LaTeXパッケージ
- LuaTeX、XeTeX
- latexmk（LaTeX自動コンパイルツール）
- pandoc（文書変換ツール）
- 各種日本語フォント

## ライセンス

このプロジェクトのライセンスについては、[LICENSE.md](LICENSE.md)を参照してください。

## 貢献

バグ報告や機能要求は、GitHubのIssueで受け付けています。プルリクエストも歓迎します。
