# アプリケーション名
![title](https://user-images.githubusercontent.com/73346157/113313813-9616c300-9346-11eb-84c5-1a17864bf741.png)

# アプリケーション概要
「忍びアシスト」は、忍術バトルRPG「シノビガミ」をプレイする際に必要な各キャラクターの「秘密」「奥義」「変調」「感情」をセッション中に管理しやすくするためのアプリです。  
セッション中に情報が錯綜したり、セッション中のGMの負担があまりにも大きすぎたりしたこと、またキャラクター同士の関係性を記録したいということから、本アプリを作成しました。

# URL
Heroku: https://shinobi-assist-31491.herokuapp.com/  
AWS: http://52.197.33.157/

### テスト用アカウント
- GM用アカウント
メールアドレス：test_gm@test.com  
パスワード：11111a

- PL用アカウント
ヘッダーの「ゲストログイン」ボタンをクリックしてください。

# 目指した課題解決
- 情報の錯綜  
セッション中は秘密・奥義・変調・感情の情報について、誰が何の情報を持っているかわからなくなること頻発していました。  
情報を正しく把握していないと戦闘時に確実に不利になってしまいます。  
秘密と奥義に関しては、「誰に誰の情報を公開しているか」をGMがワンクリックで切り替えると、公開に切り替えられたPCに対して情報を公開できます。  
変調と感情は全体に公開している情報なので、情報を入力すると全員みれるようになります。

- GMの負担軽減  
セッション中はGMが情報や戦闘の処理でかなり負担が大きく、人数が増える程その負担も大きくなります。  
GMの負担が大きすぎるとセッションの進行が滞ったりPLの行動に対応できなくなったりする可能性があります。  
秘密と奥義はセッション前に準備することができる、セッション中の重要な情報です。  
セッション前にキャラクター名・秘密・奥義の情報を入力し、必要であれば秘密や奥義の追加・編集と名前の変更を可能にしました。

# 用語
- シノビガミ  
忍術や特技を設定した空想上のキャラクター(忍び)を作り、情報の探りあいや忍び同士の関係性、戦闘などを楽しむゲームです。ダイスで忍びの行動を決めます。  

- GM(Game Master)  
ゲームを進行させる司会役のような役割を持った人のことです。  

- PL(Player)  
ゲームを遊ぶ人のことです。PL1人につき、キャラクターを1人保有しています。  

- PC(Player Character)  
PLがプレイするキャラクターのことです。多くのセッションで、PC1、PC2…と番号が振られています。  

- セッション  
ゲームをプレイすることです。主に情報戦ターンと戦闘のターンがあります。

# 利用方法
1. GMの操作：セッションルームの準備  
「部屋作成」の欄にて、部屋名・PC人数・パスワード・パスワード確認の項目を入力し、「部屋作成」ボタンをクリックしてください。
パスワードはPLが部屋へ入室する際に必要になります。  
画面が遷移したら、キャラクターの情報を入力してください。  
「キャラクター情報を入力」をクリックし、キャラクター名・秘密・奥義を入力し、フォーム下部にある「追加」をクリックするとデータが保存されます。  
データが保存されると、名前・秘密・奥義・変調・感情の項目が現れます。  
秘密・奥義のカードにマウスを重ねると、各情報の追加・編集ができるボタンがあります。  
追加ボタンをクリックすると、秘密または奥義を追加するフォームが現れ、内容を入力して「追加」ボタンをクリックすると該当の情報が追加されます。  
また、「秘密1」や「奥義1」などクリックすると、それぞれの詳細を見ることができます。  
キャラクター名をクリックすると、キャラクター名を変更するフォームが開きます。  
「変更」をクリックすると、キャラクター名が変更されます。  
全てのキャラクター情報を入力し終えたら、右上に記載されている「招待コード」をコピーし、パスワード・PL番号と一緒にPLへ伝えましょう。  

2. GMの操作：セッション中の操作  
セッション中に関わる操作は以下の通りです。  
- 秘密・奥義・変調・感情に共通する操作：  
各カードにマウスを重ねると、それぞれの情報を管理するための吹き出しが現れます。  
変調と感情はPLにも見える情報ですが、秘密と奥義はデフォルトでPLに見えない状態になっています。  
- 秘密・奥義に共通する操作：  
秘密と奥義は同じ仕様なので、ここでは秘密を例に説明します。  
「編集」では、内容を変更してから「編集」をクリックすると、選択された秘密の内容が編集されます。  
「公開・非公開の設定」では、選択された秘密を誰に公開・非公開にしているかを確認・変更できます。  
変更する際は、「非公開」という文字をクリックすると「公開」という文字に切り替わり、秘密が公開されます。  
デフォルトでは「非公開」に設定されています。  
- 変調・感情に共通する操作：  
変調と感情はほぼ同じ仕様なので、ここでは変調を例に説明します。  
「追加/削除」ボタンをクリックすると、変調情報を追加・削除するフォームが現れます。  
上部のフォームでは「変調を選択」部分をクリックすることで、変調を選択することができます。  
選択完了後、「追加」ボタンをクリックすることで変調が追加されます。  
下部のフォームでは、変調の横にある「削除×」ボタンをクリックすることで該当の変調を削除することができます。  
- 感情の操作：  
上部のフォームにある「誰に」で、感情を向けるPCを選択することができます。  
デフォルトで自分以外のPC番号の若いPCが選択されています。  

3. GMの操作：セッション後の操作  
セッション後の操作を説明します。  
- プレイ履歴作成  
このボタンをクリックするとプレイ履歴を作成するフォームへ遷移します。  
プレイ履歴には、部屋名と各キャラクター情報(秘密・奥義・感情)がデフォルトで記載されます。  
表題とセッション内容の修正完了後、「履歴作成」ボタンをクリックすることで、セッション履歴が作成されます。  
- 部屋削除  
このボタンをクリックすると部屋が削除されます。  
部屋が削除されると、その回のセッション履歴を作れなくなります。  

4. PLの操作：セッション前  
セッション前の操作を説明します。  
GMからPC番号・招待コード・パスワードの情報をもらってください。  
「部屋入室」の欄にて、PC番号・招待コード・パスワードの項目を入力し、「部屋入室」ボタンをクリックします。  

5. PLの操作：セッション中  
セッション中の操作を説明します。  
- 秘密・奥義・変調・感情 に共通する操作：
各カードにマウスを重ねると、それぞれの情報を管理するための吹き出しが現れます。  
秘密と奥義に関しては、自分のPCの情報またはGMが公開した情報しか見ることができません。  
以下の動画の例では、PLはPC番号1として入室し、GMはPC2の秘密をPC1に公開しています。  
- 変調・感情に共通する操作  
変調と感情はGMの仕様と同じなので、「GMの操作：セッション中の操作」の「変調・感情に共通する操作」をご参照ください。

# 洗い出した要件
| 機能 | 目的 | 詳細 | ストーリー |
| - | - | - | - |
| ユーザー管理機能 | 登録されたユーザーのみ使えるようにするため | 部屋名・PC人数・パスワードを入力する | 部屋名・PC人数・パスワードを入力してボタンをクリックすると、セッションルームが作成され、そのルームに入室する。 |
| ルーム作成機能 | セッションルームを作成するため | 部屋名・PC人数・パスワードを入力する | 部屋名・PC人数・パスワードを入力してボタンをクリックすると、セッションルームが作成され、そのルームに入室する。 |
| ルーム入室機能 | 作成されたセッションルームに入室するため | PC番号・招待コード・パスワードを入力する | PC番号・招待コード・パスワードを正しく入力してボタンをクリックすると、セッションルームへ入室する。 |
| キャラクター情報作成機能 | ルームにいる全員にPC情報を表示するため | キャラクター名・秘密・奥義を登録する | キャラクター名・秘密・奥義入力してボタンをクリックすると登録される。 |
| 秘密管理機能 | 「秘密」の情報を管理するため | 指定したPCの秘密を追加する。指定したPCの秘密を特定のPCに対して公開する。 | 秘密を入力してボタンをクリックすると秘密が追加される。各PCの「非公開」をクリックすると特定のPCに対して公開状態になる。 |
| 奥義管理機能 | 「奥義」の情報を管理するため | 指定したPCの奥義を追加する。指定したPCの奥義を特定のPCに対して公開する。 | 奥義を入力してボタンをクリックすると奥義が追加される。各PCの「非公開」をクリックすると特定のPCに対して公開状態になる。 |
| 変調管理機能 | 「変調」の情報を管理するため | 指定したPCの変調を追加・削除する | 変調を選択してボタンをクリックすると変調が追加される。追加した変調の「削除」ボタンをクリックすると変調が削除される。 |
| 感情管理機能 | 「感情」の情報を管理するため | 指定したPCの感情を追加・削除する | 感情と感情を結ぶPCを選択してボタンをクリックすると感情が追加される。追加した感情の「削除」ボタンをクリックすると感情が削除される。 |
| セッション履歴記録機能 | セッションの履歴を残すため | セッションの表題と内容を登録する | セッションの表題と内容を入力してボタンをクリックすると、セッション履歴が追加・編集される。削除ボタンをクリックすると指定されたセッション履歴が削除される。 |

# 実装した機能についての画像やGIFおよびその説明
### GMの操作
- セッションルーム作成機能  
部屋名・PC人数・パスワード・パスワード確認の項目を入力し、「部屋作成」ボタンをクリック。  
<img width="674" alt="how_to_enter" src="https://user-images.githubusercontent.com/73346157/113493691-bf894780-951c-11eb-8976-9ca7d8b78d9d.png">

- キャラクター情報作成機能  
「キャラクター情報を入力」をクリックし、キャラクター名・秘密・奥義を入力し、フォーム下部にある「追加」をクリック。  
![Animated GIF-downsized (1)](https://media.giphy.com/media/psaIa4Ntd1k3okWxst/giphy.gif)

- 秘密・奥義管理機能  
「秘密追加」をクリックしてフォームを開き、秘密の内容を入力して「追加」をクリック。  
![Animated GIF-downsized (1)](https://media.giphy.com/media/u6tqmv39XBk7GVFoZM/giphy.gif)  
内容を変更してから「編集」をクリック。  
![Animated GIF-downsized (1)](https://media.giphy.com/media/z0FtZUNALPyC7vN89S/giphy.gif)  
「非公開」という文字をクリックすると「公開」という文字に切り替わり、秘密が公開される。  
![Animated GIF-downsized (1)](https://media.giphy.com/media/wy8Hs3u4mIxj9FQLK8/giphy.gif)
秘密・奥義・変調・感情のカードにマウスオーバーすると、それぞれの情報一覧を見ることができる。
![Animated GIF-downsized (1)](https://media.giphy.com/media/Irdvc5iG4gG1P8CDyz/giphy.gif)

- 変調・感情管理機能  
変調を選択して「追加」をクリック。  
削除するときは、該当の変調の「削除」をクリック。  
![Animated GIF-downsized (1)](https://media.giphy.com/media/WhRyocutjnKYi3pTmW/giphy.gif)

- ルーム入室機能  
PC番号・招待コード・パスワードの項目を入力してクリック。  
<img width="678" alt="pl_prepare_session" src="https://user-images.githubusercontent.com/73346157/113503355-529d9e00-956c-11eb-85fc-4a4f2f21d556.png">

- マイページからのルーム入室機能  
自分で作成したセッションルームから入室したいルーム名をクリック。
![Animated GIF-downsized (1)](https://media.giphy.com/media/iMAssKGVT4cWGUaBQm/giphy.gif)

# 実装予定の機能
- リアルタイム通信機能  
秘密・奥義・変調・感情の情報をPL側がページを更新せずとも閲覧できる機能。  

# データベース設計
![ER drawing](https://user-images.githubusercontent.com/73346157/113534694-6c8ebd80-960c-11eb-92c2-97933b62a8d5.png)

## usersテーブル

| Column             | Type   | Options                   |
| ------------------ | ------ | ------------------------- |
| name               | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |

### Association
- has_many :rooms
- has_many :session_logs
- has_many :roles

## roomsテーブル
| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| room_name       | string     | null: false                    |
| player_number   | integer    | null: false                    |
| password_digest | string     | null: false                    |
| user            | references | null: false, foreign_key: true |
| token           | string     | null: false                    |

### Association
- belongs_to :user
- has_many :characters
- has_many :roles

## rolesテーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| role   | integer    | null: false                    |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association
- belongs_to :user
- belongs_room :room

## charactersテーブル
| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| character_name | string     | null: false                    |
| pc_number      | integer    | null: false                    |
| room           | references | null: false, foreign_key: true |

### Association
- belongs_to :room
- has_many :secrets
- has_many :last_resorts
- has_many :conditions
- has_many :feelings

## secretテーブル
| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| secret_n  | integer    | null: false                    |
| secret    | text       | null: false                    |
| character | references | null: false, foreign_key: true |

### Association
- belongs_to :character
- has_many :open_secrets

## open_secretテーブル
| Column           | Type       | Options                        |
| ---------------- | ---------- | ------------------------------ |
| secret_unveil_to | string     | null: false                    |
| unveiled_id      | integer    | null: false                    |
| secret           | references | null: false, foreign_key: true |

### Association
- belongs_to :secret

## last_resortテーブル
| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| last_resort_n | integer    | null: false                    |
| last_resort   | text       | null: false                    |
| character     | references | null: false, foreign_key: true |

### Association
- belongs_to :character
- has_many :open_last_resorts

## open_last_resortテーブル
| Column       | Type       | Options                        |
| ------------ | ---------- | ------------------------------ |
| lr_unveil_to | string     | null: false                    |
| unveiled_id  | integer    | null: false                    |
| last_resort  | references | null: false, foreign_key: true |

### Association
- belongs_to :secret

## conditionテーブル
| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| state_id  | integer    | null: false                    |
| character | references | null: false, foreign_key: true |

### Association
- belongs_to :character

## feelingテーブル
| Column     | Type       | Options                        |
| ---------- | ---------- | ------------------------------ |
| feel_id    | integer    | null: false                    |
| feeling_to | string     | null: false                    |
| character  | references | null: false, foreign_key: true |

### Association
- belongs_to :character


## session_logテーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| title  | string     | null: false                    |
| log    | text       | null: false                    |
| user   | references | null: false, foreign_key: true |

### Association
- belongs_to :user

# ローカルでの動作方法
`% git clone https://github.com/ysys1195/shinobi_assist_31491.git`  
`% cd shinobi_assist_31491`  
`% bundle install`  
`% rails db:create`  
`% rails db:migrate`  
`$ rails s`  
`　→　http://localhost:3000`

# 開発環境
- フロントエンド：HTML5 / CSS / JavaScript / Jquery / Ajax
- バックエンド：Ruby on Rails(6.0.3.6) / Ruby(2.6.5) /JavaScript
- テスト：Rspec
- データベース：MySQL(5.6.50) / Sequel Pro
- インフラ：Heroku, AWS
- タスク管理：GitHub / Trello