# Rails-practice

## ディレクトリ構成

```
rails-practice/
├── README.md
├── .env                    # 環境変数を定義するファイル
├── Dockerfile              # Rails用のDockerイメージ構築ファイル
├── compose.yml             # Docker Compose設定ファイル（複数コンテナの起動設定）
├── db_data/                # MySQLの永続化データを保存するボリュームディレクトリ
├── service/                # Railsアプリケーション本体
│   ├── app/                # アプリの主なロジック（MVC構造）
│   │   ├── assets/         # スタイルシート、画像、JavaScriptなどの静的ファイル
│   │   ├── channels/       # ActionCable（WebSocket）用の設定
│   │   ├── controllers/    # ユーザーからのリクエスト処理
│   │   ├── helpers/        # ビュー用のヘルパーメソッド
│   │   ├── javascript/     # JavaScript管理用（importmapなど）
│   │   ├── jobs/           # 非同期ジョブ
│   │   ├── mailers/        # メール送信ロジック
│   │   ├── models/         # データベースとのやりとり（ビジネスロジック）
│   │   └── views/          # HTMLテンプレート（見た目の部分）
│   ├── bin/                # Railsやセットアップ用の実行ファイル
│   ├── config/             # アプリケーションの各種設定
│   │   ├── database.yml    # DB設定ファイル
│   │   ├── routes.rb       # URLと処理を結びつけるルーティング
│   │   └── storage.yml     # ActiveStorage設定
│   ├── config.ru           # Rackサーバー起動用設定
│   ├── db/                 # マイグレーションやseedsファイル
│   ├── lib/                # 自作ライブラリやモジュール
│   ├── log/                # 実行時ログ
│   ├── public/             # 公開ディレクトリ（favicon、エラーページなど）
│   ├── storage/            # アップロードファイルの保存先（ActiveStorage）
│   ├── test/               # テストコード群
│   ├── tmp/                # 一時ファイルの保存先（キャッシュやソケットなど）
│   ├── vendor/             # 外部ライブラリやプラグイン
│   ├── Gemfile             # 使用するgem（ライブラリ）を記述
│   ├── Gemfile.lock        # 実際にインストールされたgemのバージョン固定
│   ├── Rakefile            # rakeタスク定義
```
