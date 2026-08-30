# emacs-config

GNU Emacs 31.1向けの、builtin-firstなTerminal Emacs設定。
Emacs標準の編集モデルを維持し、検索、プロジェクト移動、LSPをEmacsの仕組みへ統合する。

## 方針

Neovimのキー配置やUIは再現しない。
Neovimで重視していた操作の流れを、Emacs標準の機能と慣習に沿って組み立てる。

標準機能を優先し、少量のElispでは補えない部分だけに外部packageを使う。
packageの取得元はGNU ELPAとNonGNU ELPAに限定し、インストール前の内容確認と署名検証を有効にする。

標準キーバインドは極力変更しない。
追加操作にはEmacsの既存prefixか、利用者向けに予約された`C-c`領域を使う。

Rust、TypeScript、TSXではEglotを利用する。
Kotlinは`kotlin-mode`による構文強調と編集を既定とし、Alpha版LSPは明示的に起動したバッファだけで使う。

## 主な操作

| 目的 | 操作 |
| --- | --- |
| プロジェクトのファイルを開く | `C-x p f` (`project-find-file`) |
| バッファを切り替える | `C-x b` (`consult-buffer`) |
| 現在のバッファを検索 | `M-s l` (`consult-line`) |
| プロジェクトをripgrep検索 | `M-s r` (`consult-ripgrep`) |
| シンボル一覧から移動 | `M-g i` (`consult-imenu`) |
| 候補へアクションを実行 | `C-.` (`embark-act`) |
| 文脈に合うアクションを即実行 | `C-;` (`embark-dwim`) |
| Diredを開く | `C-x d` |
| Diredを編集可能にする | `C-x C-q` (`wdired-change-to-wdired-mode`) |
| Markdownを閲覧する | `C-c m` (`riii-markdown-view`) |
| Magitの状態画面を開く | `C-c g` |
| 定義と参照 | `M-.` / `M-?` (Xref) |
| コードアクション | `C-c l a` |
| バッファを整形 | `C-c l f` |
| シンボル名を変更 | `C-c l r` |
| Kotlin LSPを起動 | `M-x riii-kotlin-eglot` |

Consultの検索中に`C-.`を押し、`E` (`embark-export`)を選ぶと結果を一覧へ展開できる。
`consult-line`の結果はOccurバッファで`e`、`consult-ripgrep`の結果はGrepバッファで`e`を押すと、Emacs 31.1の編集モードへ入れる。

Corfuは意図しない補完処理の実行を避けるため、自動表示を無効にしている。
プログラム用バッファでは`TAB`または`M-TAB`で明示的に補完を開始する。
