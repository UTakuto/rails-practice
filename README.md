# Rails-practice
>今回環境構築で行ったのは以下のとおりです。

<br>

## 使用技術
| 技術名 | バージョン |
|-------|---------|
| Ruby  | 3.3.8   |
| Rails | 7.1.5.1 |
| MySQL | 8.3     |
| Mac   ||
| Docker||
| Docker Compose ||

<br>

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

<br>

## .env 記述例
>プロジェクトルートに .env ファイルを作成し、以下を記述してください：
### それぞれについての説明
>
> **MySQL rootユーザーのパスワード**  
> `MYSQL_ROOT_PASSWORD=example_root_pass`
>
> **作成するデータベース名**  
> `MYSQL_DATABASE=example_db`
>
> **アプリで使用するMySQLユーザー名**  
> `MYSQL_USER=example_user`
>
> **上記ユーザーのパスワード**  
> `MYSQL_PASSWORD=example_user_pass`
>
> **MySQLのポート（ローカルマシンからアクセス用）**  
> `MYSQL_PORT=3307`
>
> **phpMyAdminのポート（http://localhost:8080 でアクセス）**  
> `PHPMYADMIN_PORT=8080`
>
> **Railsアプリのポート（http://localhost:3000 でアクセス）**  
> `RAILS_PORT=3000`
>
> **MySQLのホスト名（docker-composeのサービス名と一致させる）**  
> `MYSQL_HOST=db`

### 一括コピー用
```
MYSQL_ROOT_PASSWORD=example_root_pass
MYSQL_DATABASE=example_db
MYSQL_USER=example_user
MYSQL_PASSWORD=example_user_pass
MYSQL_PORT=3307
PHPMYADMIN_PORT=8080
RAILS_PORT=3000
MYSQL_HOST=db
```
<br>

## セットアップ手順（初回）
```
# イメージのビルド（初回のみ）
docker compose build --no-cache

# rails new（Gemfileが空の場合のみ）
docker compose run --no-deps --rm web bundle exec rails new . --force --database=mysql

# コンテナ起動
docker compose up -d

# DB作成
docker compose exec web rails db:create
```

<br>

>### 開発中の基本コマンド
```
# コンテナ起動
docker compose up -d

# コンテナに入る
docker compose exec web bash

# DBマイグレーションなど
rails db:migrate

# railsサーバの起動（RAILS_PORTに従う）
rails s -b 0.0.0.0 -p $RAILS_PORT
```

>### 停止・削除
```
# コンテナ停止
docker compose down

# ボリュームも含めて削除（初期化）
docker compose down --volumes --remove-orphans
```
