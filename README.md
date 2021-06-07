# やさしいHP

## アプリケーション概要
URL：<http://54.92.62.133/> PC向けwebアプリケーション

要件定義 URL: <https://docs.google.com/spreadsheets/d/1PT0Prc3pesKkML98s2cFBdiz8tix_J9Dj2FXkbAd7Kc/edit#gid=0>


Basic認証 

ID番号: j_app 
暗証番号: kind_japanese

テスト用アカウント

mail: test@test.com
暗証番号:test123

## ペルソナ

メインは２０歳の男性、日本が大好きな台湾人の好青年
母国の台湾料理屋でアルバイトをしながら、日本語学校に通っている。
いつもは学校とアルバイトの往復でそれ以外の人の日本人とも交流したい。
しかし、安全な人と交流する手段があまり見つかっていない。
日本のHPも難しい日本語で書かれているので読む気になれない。
せっかくコロナの中、日本に来たのにもっとたくさんの日本人と交流したい（会いたい）
→やさしいHPをきっかけに日本人と交流できる、直接会って話す事もできるかも（コロナ対策は万全に）

## 利用方法

このアプリはペルソナでも書いた通り主に日本に住む外国人向けの
シンプルな投稿アプリです。日本語に興味のある外国人または日本人が、
その事について投稿できます。
投稿した内容を検索したり、ログインすれば投稿した内容にコメントすることもできます。
ただ、全ての日本語がやさしい日本語と呼ばれる
日本語学習、初級の人のための、より親切で簡単な日本語を使用しています。
（やさしい日本語については下記に説明）


## アプリの目的
私自身、ニュージーランドという異国の地での留学経験があるため、そんな時に簡単な英語で操作性が高く、現地の外国人の友達を探せるwebアプリがあればいいなという思いからこのアプリを開発しました。また私は日本語教師の資格を持っているので、やさしい日本語で全て書かれたアプリがあれば日本に住んで日本語を勉強している外国の人が使いやすいのではないかと考え、全文やさしい日本語で書体を統一しました。このアプリを通してこのコロナ禍で孤独を感じている在日外国人の人の助けになればいいなと思います。

## Demo (実演)

### トップページ（投稿一覧）

[![Image from Gyazo](https://i.gyazo.com/0ed57589912b9b8981d679969d1e9439.gif)](https://gyazo.com/0ed57589912b9b8981d679969d1e9439)

ユーザーが投稿した文章を一覧で見ることができます。トップ画像、上部に組み込まれている３つの文章は、外国人ユーザーが投稿する時に選べるトピックの文章です。
ページ下部では、ユーザーが選択した文章を少し大きく色を変えて見やすくし新規登録で登録した名前などのユーザー情報もポストイット形式で表示させています。 

トップ画面は黄色とハート主体の優しいイメージでよりポップな印象を与えることで、より投稿したい気持ちをあげています。

### 新規登録画面

[![Image from Gyazo](https://i.gyazo.com/e3c267ffcb72045d8ac5ac37b646cf84.gif)](https://gyazo.com/e3c267ffcb72045d8ac5ac37b646cf84)

新規登録する時などもヘッダー右側の[新しくやさしいHP」へ私は入ります]と主語、述語のある文章で書かれていてわかりやすい誘導にしてあります。登録時においても自己紹介方式で簡単に登録出来ます。絶対に登録してほしいので、空白で投稿した時のエラー文に関してもやさしい日本語でわかりやすく説明してあります。

[![Image from Gyazo](https://i.gyazo.com/2e5f63b58d930d8f9c8677987433ea93.gif)](https://gyazo.com/2e5f63b58d930d8f9c8677987433ea93)
ログイン画面についても、同じ仕様になっています。





# Table Design

## users table

| Column             | Type    | Options                |
| ------------------ | ------- | ---------------------- |
| name               | string  | null:false             |
| email              | string  | null:false,unique:true |
| encrypted_password | string  | null: false            |
| birth_country      | string  | null: false            |
| prefecture_id      | integer | null: false            |
| identity           | string  | 任意                    |


### Association

- has_many :topics
- has_one :sns_credential


## topics table

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| sentence_id        | integer    | null: false                   |
| description        | text       | null: false                   |
| user               | references | foreign_key:true              |

### Association

- belongs_to :user
- has_many :comments


## comments テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| text                 | text       | null: false                    |
| topic                | references | foreign_key:true               |
| user                 | references | foreign_key:true               |

### Association

- belongs_to :topic
- belongs_to :user


# sns_credentials テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| provider             | string     |                                |
| uid                  | string     |                                |
| user                 | references | foreign_key:true               |

### Association

- belongs_to :user