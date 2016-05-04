# api

ここは質問票の管理作成などを行うための API を提供するバックエンド部分のコードを管理します。

開発には以下のものを用います。

* Ruby 2.3.0
* Rails 5.0 beta4

なお特に断らない場合、コマンドなどは Mac OS X での実行を前提としています。
Ubuntu などの Linux でも同様に動作することが期待されますが、Windows は動作しないことが多くあります。

Windows での開発はまず、
[VirtualBox](http://www.oracle.com/technetwork/server-storage/virtualbox/downloads/index.html?ssSourceSiteId=otnjp) などの仮想マシン上に
[Ubuntu Server](http://www.ubuntu.com/download/server) をインストールした上で、
その Ubuntu 上で開発することをお勧めします。

## ディレクトリレイアウト

Rails の標準的なディレクトリレイアウトに準じています。

~~~
Gemfile
Gemfile.lock
README.md
Rakefile
app
bin
config
config.ru
db
lib
log
public
test
tmp
vendor
~~~

## 開発環境の準備

既存の Ruby や Rails とぶつからないようにするために [RVM](https://rvm.io/) を利用して、
開発用の環境を用意します。その後、Rails のインストールを行います。

### RVM のインストール

ターミナルで、以下のコマンドを実行してインストールを行います。

~~~sh
$ gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
$ curl -sSL https://get.rvm.io | bash -s stable
~~~

1 つ目のコマンドは、rvm.io で利用している公開鍵のインポートを行っています。

2 つ目のコマンドで、インストール用のシェルスクリプトをダウンロードし、それを実行しています。

rvm help とターミナルで入力し、以下のようなヘルプが表示されればインストールは完了です。

~~~sh
$ rvm help
= rvm

* https://rvm.io/
* https://github.com/rvm/rvm/

== DESCRIPTION:

RVM is the Ruby enVironment Manager (rvm).
~~~~

### 開発用の Ruby 環境の用意

RVM を利用すると、利用する Ruby のバージョンや、インストールされたライブラリのセットなどを切り替えられます。

まず install コマンドと gemset create コマンドで、開発用の環境を用意します。
次に use コマンドで開発用の環境へとスイッチします。

~~~sh
$ rvm install 2.3.0
$ rvm gemset create lod2016s
$ rvm use 2.3.0@lod2016s
~~~

### Bundler のインストール

Bundler は Ruby のライブラリ管理ツールです。これを利用すれば、Gemfile / Gemfile.lock に記載されている情報をもとに、
必要なライブラリをインストールできます。

標準ではインストールされていないので、以下のコマンドを実行してインストールします。

~~~sh
$ gem install bundler
~~~

### ライブラリのインストール

bundle コマンドを利用して、利用するライブラリをインストールします。

~~~sh
$ bundle install
~~~

インストール後、以下のコマンドを実行してバージョン番号が正しく表示されればインストール完了です。

~~~sh
$ ./bin/rails -v
Rails 5.0.0.beta4
~~~
