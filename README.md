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

### 新規登録、ログイン画面

[![Image from Gyazo](https://i.gyazo.com/e3c267ffcb72045d8ac5ac37b646cf84.gif)](https://gyazo.com/e3c267ffcb72045d8ac5ac37b646cf84)

新規登録する時などもヘッダー右側の[新しくやさしいHP」へ私は入ります]と主語、述語のある文章で書かれていてわかりやすい誘導にしてあります。登録時においても自己紹介方式で簡単に登録出来ます。絶対に登録してほしいので、空白で投稿した時のエラー文に関してもやさしい日本語でわかりやすく説明してあります。FacebookのURL登録に関しては、その人が本当に安全な人なのかという観点から任意で登録できるように工夫しました。

[![Image from Gyazo](https://i.gyazo.com/2e5f63b58d930d8f9c8677987433ea93.gif)](https://gyazo.com/2e5f63b58d930d8f9c8677987433ea93)
ログイン画面についても、同じ仕様になっています。

### 「やさしい日本語にほんご」の ５つの わかりません ページ （kind_japanese controller)

[![Image from Gyazo](https://i.gyazo.com/b519b88b5a72f1868ec087a889849085.gif)](https://gyazo.com/b519b88b5a72f1868ec087a889849085)

トップページ上部の赤く点滅している文章をクリックするとやさしい日本語についての５つの疑問点を紹介するページに飛ぶようになっています。
これは日本語を教えることに興味のある日本人にも見てほしいページです。Q＆A方式で見やすく、わかりやすく表示させました。ここで少しだけやさしい日本語について紹介しておくと

* １ 漢字にはふりがなをふる
* ２ 主語や述語などを省略しない
* ３ 分かち書き（文節の間にはスペースをあける）

他にも文末はです、ますの形を使う、カタカナ語を使わない、などルールは色々ありますが基本的にアプリ全文、これらのルールに基づいて書かれています。このページで文章を投稿したくなった人のために直接ここから投稿画面に飛べるようにリンクも設置してあります。

### 投稿画面
[![Image from Gyazo](https://i.gyazo.com/025de8c21a97ccf2d4fd2ea243b7b71a.gif)](https://gyazo.com/025de8c21a97ccf2d4fd2ea243b7b71a)

トップページに固定して置かれている青色の投稿ボタンから基本的には投稿画面に移行します。viewに関してもボタンと統一して青色の画面に変更し気分を一新させる狙いがあります。ここで文章を選択し、それについての説明文を記入できます。選択できる文章は外国人ユーザー向けのの３つと日本語に興味のある日本人向けに「私は日本語を教えます」の文章も加えてあります。この部分は開発者が日本語を教えるためのきっかけにこのアプリを使いたいという強い気持ちです。
ちなみにここでもエラー文はやさしい日本語で統一しています。

### 詳細画面

[![Image from Gyazo](https://i.gyazo.com/dd51128dac5762d39ad61ea7ca05a603.gif)](https://gyazo.com/dd51128dac5762d39ad61ea7ca05a603)

トップページのポストイットをクリックすると投稿した時の説明文が見れる詳細ページにとびます。ログインしているユーザーはここでコメントのやりとりができます。
[![Image from Gyazo](https://i.gyazo.com/dab20bd14eb00b41a68e54b41dd0e519.gif)](https://gyazo.com/dab20bd14eb00b41a68e54b41dd0e519)

本人が詳細ページに移行すると編集と削除のわかりやすいアイコンと指示文が現れます。本人も説明文に追記できるようにコメント欄も表示してあります。削除する時には間違ってボタンを押した時に消さないようにワンクッション、消すかどうかの警告が出るようにしています（ここのコメントもやさしい日本語）

### 検索画面

[![Image from Gyazo](https://i.gyazo.com/a9674b4d689b39b7c437f7c5d8bbc2fb.gif)](https://gyazo.com/a9674b4d689b39b7c437f7c5d8bbc2fb)

トップページから指のアイコンを押すと検索ページにとび、連続して自分の気になる文章の説明文を読むことができます。最後にもう気づかれている方もいらっしゃると思いますが、パンくず機能に関してもやさしい日本語で統一しています。全文、やさしい日本語です！！！（rubyタグ設置するの大変）

## 実装したい機能
facebook登録機能に関して、AWSのデプロイ環境では料金がかかりそうなので実装したいがしていない
（herokuでは実装済）


## Requirement
Ruby 2.6.5

Ruby on Rails 6.1.3.2

## Author
作成者  田中 克明(たなか かつあき)

E-mail ken.tanaka0612@gmail.com

## 参考文献
弘前大学人文学部社会言語学研究室

 <https://web.archive.org/web/20191027180317/http://human.cc.hirosaki-u.ac.jp/kokugo/EJ3mokuji.htm>

文化庁 

<https://www.bunka.go.jp/koho_hodo_oshirase/hodohappyo/pdf/92531901_01.pdf> 11枚目



# データベース 設計

## ER図
[![Image from Gyazo](https://i.gyazo.com/d1f09440bc73db3500fb84545d70dbf4.png)](https://gyazo.com/d1f09440bc73db3500fb84545d70dbf4)

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