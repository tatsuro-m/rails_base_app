# 雛形
`rails new` してからの初期設定を行ったものです。素早い開発に役立ててください。

## 使っているバージョンなど(必要に応じて変更してください)
- ruby:2.6.6
- rails 6.0.3
- postgresql:12.3

## 行った設定（漏れがあるかもしれません、あくまで参考に）
- devise の初期設定（`rails generate devise:install` を実行。viewの生成はしていない。）
- rspec のセットアップ（システムスペックを含む）
- test ディレクトリの削除（使わないので）
- `database.yml` の編集（postgresコンテナに設定した環境変数と合わせてあります）
- `.env` の `.gitignore` への追加

## 手順
1. このリポジトリをcloneします。 `git clone git@github.com:tatsuro-m/rails_base_app.git`
2. gitの情報を初期化します。 `rm -rf .git/`
3. アプリ名を変更します。 `mv rails_base_app new_app_name`
4. `database.yml` のDB名をアプリ名に合わせて変更してください。
5. `Dockerfile`の環境変数 ROOT を変更し、それに合わせて `docker-compose.yml` の volume ディレクトリを変更してください
6. `docker-compose build` & `docker-compose up`
7. `docker-compose exec web rake db:create`
8. `localhost:3000/` にアクセスして画面が表示されること、 `docker-compose exec web rspec` を実行して初期テストがパスすることを確認してください。
9. 確認が終了したら git の管理下に置きます。 `git init`
10. あとはよしなに。。。

## その他注意点など
- イメージには alpine を使っている
- `application.rb` の module 名を変更しなくてはいけないかも？
- RubyMine のリモートインタープリタ設定を行うなら完全に設定が完了した後にした方が良い
- `rubocop.yml` は設定例のコピペなので、適宜変更して良いものができたらこちらにもコミットして欲しい。。。

不備があったらまた直しましょう！！
