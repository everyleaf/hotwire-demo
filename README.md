# hotwire-demo

Rails7 で構築された非Hotwireのアプリを、Hotwire各技術で改良していくリポジトリです。
各PRのブランチでHotwireの使い方のサンプルを[demo-n]の順に追うことができます。

## 想定対象・利用目的
 
 Railsは使っているけどHotwireのキャッチアップはまだできてないな、使ってみたいな、というような方の気軽な練習になればと思っています

## Hotwire概説/各PR解説資料（Rubyアソシエーション　セミナー『Hotwireことはじめ』より）
[Hotwire ことはじめ .pdf](https://github.com/everyleaf/hotwire-demo/files/10302496/Hotwire.2.pdf)

## 各PR（順にやっていくと、Hotiwireを使ってないアプリがHotiwire化していきます）

[[demo-1]Hotwireを使うように設定、Turbo Drive対応](https://github.com/everyleaf/hotwire-demo/pull/13)

[[demo-2]Turbo Frameを使って一覧部分を読み込む](https://github.com/everyleaf/hotwire-demo/pull/9)

[[demo-3]Turbo Streamを使って二箇所を更新する](https://github.com/everyleaf/hotwire-demo/pull/10)


[[demo-4]WebSocketを使ったブロードキャスト方式に変更](https://github.com/everyleaf/hotwire-demo/pull/11)

[[demo-5]Stimulusを使ったイベントによるフォーム内容チェック](https://github.com/everyleaf/hotwire-demo/pull/12)



## ディレクトリ構成

```
.
├── README.md
├── data　# redisが起動した場合のデータ
│   └── redis
├── docker-compose.yml # PostgreSQL（と、ブランチによってredis）のdocker-compose
└── hotwire-tw-demo # Railsアプリ本体
    ├── Gemfile
    .
    ・
```
### 起動手順

#### PostgreSQL（と、ブランチによってredis）の起動

```
$ docker-compose up -d
```

#### Railsの設定・起動

```
$ cd hotwire-tw-demo
$ yarn install
$ bin/rails db:create db:migrate
$ bin/dev
```

##　コントリビュート方法 

色々と不足がありそうなので、Issue, PR 等歓迎です
