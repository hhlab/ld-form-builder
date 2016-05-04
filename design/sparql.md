RDF 化された質問票と、その回答を検索するための、[SPARQL](https://www.w3.org/TR/rdf-sparql-query/) のサンプルをまとめています。

## データセット中心の問い合わせ

### データセットの一覧を取得

~~~
BASE <http://www.hyakuju.keio.ac.jp/vocabulary/questionnaire/response/>

select distinct ?dataset where{
  ?dataset a <DataSet>.
}
~~~

### データセットと、そこで使用した質問票の取得

~~~
BASE <http://www.hyakuju.keio.ac.jp/vocabulary/questionnaire/response/>

select distinct ?dataset, ?form where{
  ?dataset a <DataSet>;
    <DataSet#to> ?form.
}
~~~

#### 質問票のタイトルをつけるなら

~~~
BASE <http://www.hyakuju.keio.ac.jp/vocabulary/questionnaire/response/>
PREFIX dc: <http://purl.org/dc/elements/1.1/>

select distinct ?url, ?form, ?title where{
  ?url a <DataSet>;
       <DataSet#to> ?form.
  ?form dc:title ?title.
}
~~~

### 特定のデータセット中の回答一覧

<DataSetのURL> には、データセットのURLが入るとする。

~~~
BASE <http://www.hyakuju.keio.ac.jp/vocabulary/questionnaire/response/>

select distinct ?responder, ?question, ?value where{
  <DataSetのURL> <DataSet#data> ?data.
  ?data ?data_items ?response.
  ?response a <Response>;
    <Response#by> ?responder;
    <Response#body> ?body.
  ?body ?body_items ?answer.
  ?answer <Answer#value> ?value;
    <Answer#to> ?question.
}
~~~

## 回答中心の問い合わせ

### 特定の回答を行った質問項目と、タイトル

<AnswerのURL> は、Answer のURLで置き換えられる。

~~~
BASE <http://www.hyakuju.keio.ac.jp/vocabulary/questionnaire/response/>
PREFIX dc: <http://purl.org/dc/elements/1.1/>

select distinct ?question, ?title where{
  <AnswerのURL> <Answer#to> ?question;
  ?question <dc:title> ?title;
}
~~~

## 回答者中心の問い合わせ

### 回答者一覧を取得

~~~
BASE <http://www.hyakuju.keio.ac.jp/vocabulary/questionnaire/response/>

select distinct ?responder where{
  ?responder a <Responder>.
}
~~~

### 回答者と、回答の一覧

~~~
BASE <http://www.hyakuju.keio.ac.jp/vocabulary/questionnaire/response/>

select distinct ?responder, ?response where{
  ?responder a <Responder>;
    <Responder#responses> ?list.
  ?list ?item ?response.
  ?response a <Response>.
}
~~~

### 特定の回答者の回答を含むデータセットの一覧

<回答者のURL> は、対象回答者の URL に置き換えられる。

~~~
BASE <http://www.hyakuju.keio.ac.jp/vocabulary/questionnaire/response/>

select distinct ?dataset where{
  ?dataset <DataSet#data> ?list.
  ?list ?item ?response.
  ?response a <Response>;
    <Response#by> <回答者のURL>.
}
~~~

### 特定の回答者による回答一覧

<回答者のURL> は、対象回答者の URL に置き換えられる。

~~~
BASE <http://www.hyakuju.keio.ac.jp/vocabulary/questionnaire/response/>

select distinct ?response where{
  <回答者のURL> <Responder#responses> ?list.
  ?list ?item ?response.
  ?response a <Response>.
}
~~~

### 特定の回答者が回答した質問に対する問い合わせ

<回答者のURL> は、各回答者の持つURLに置き換えられる。

~~~
BASE <http://www.hyakuju.keio.ac.jp/vocabulary/questionnaire/response/>

select distinct ?question where{
  ?answer <Answer#by> <回答者のURL>;
    <Answer#to> ?question;
    <Answer#value> ?value.
}
~~~

### 特定の回答者による回答を含むデータセット

~~~
BASE <http://www.hyakuju.keio.ac.jp/vocabulary/questionnaire/response/>

select distinct ?dataset where{
  ?response <Response#by> <回答者のURL>.
  ?dataset a <DataSet>;
    <DataSet#data> ?list.
  ?list ?item ?response.
}
~~~

## その他

### 全データの取得

~~~
select distinct ?s, ?v, ?o where{
  ?s ?v ?o.
}
~~~
