# 質問表に対する回答

質問表に対する回答を記述するための語彙について記述します。

なお使用される prefix と URL との対応は、以下の表を参照してください。

|prefix|URL|
|------|---|
|rdf|http://www.w3.org/1999/02/22-rdf-syntax-ns#|
|rdfs|http://www.w3.org/2000/01/rdf-schema#|
|foaf|http://xmlns.com/foaf/0.1/|
|form|http://www.hyakuju.keio.ac.jp/vocabulary/questionnaire/form/|
|respnose|http://www.hyakuju.keio.ac.jp/vocabulary/questionnaire/response/|

## DataSet

|項目|解説|
|---|----|
|URL|response:DataSet|
|rdf:type|rdfs:Class|
|解説|質問表に対する回答の集合。表全体に対応する|

### 属性

|属性名|値域|解説|URL|
|-----|---|---|----|
|createdAt|リテラル（日付）|データセットの作成日時|response:DataSet#createdAt|
|updatedAt|リテラル（日付）|データセットの更新日時|response:DataSet#updatedAt|
|to|form:form|使用した質問票|response:DataSet#to|
|data|rdf:Bag|データ集合|response:DataSet#data|

### データ例

~~~
@prefix http://example.com/survey/
@prefix response http://www.hyakuju.keio.ac.jp/vocabulary/questionnaire/response/

dataset a response:DataSet ;
  response:DataSet#createdAt "2015-01-02T12:34:56Z"^^http://www.w3.org/2001/XMLSchema#dateTime ;
  response:DataSet#updatedAt "2015-01-02T12:34:56Z"^^http://www.w3.org/2001/XMLSchema#dateTime ;
  response:DataSet#to form
  response:DataSet#data [
    a rdf:Bag ;
    _1 [ a response:Response ] ;
    _2 [ a response:Response ] .
  ] .
~~~

## Response

|項目|解説|
|---|----|
|URL|response:Response|
|rdf:type|rdfs:Class|
|解説|特定の質問表に対する、個々の回答。表の各行に対応する|

### 属性

|属性名|値域|解説|URL|
|-----|---|---|----|
|by|reponse:responder|回答者|reponse:Response#by|
|to|form:form|使用した質問票|reponse:Response#to|
|body|rdf:Bag|個別の質問に対する回答|reponse:Response#body|

### データ例

~~~
@prefix http://example.com/survey/
@prefix response http://www.hyakuju.keio.ac.jp/vocabulary/questionnaire/response/

_ a response:Response ;
  by responder#1 ;
  to form ;
  body [
    rdf:type rdf:Bag ;
    _1 [rdf:type response:Answer . ] ;
    _2 [rdf:type response:Answer . ] .
  ] .
~~~

## Answer

|項目|解説|
|---|----|
|URL|respnose:Answer|
|rdf:type|rdfs:Class|
|解説|個別の質問に対する、個別の回答。表のセルに対応する|

### 属性

|属性名|値域|解説|URL|
|-----|---|---|----|
|by|response:responder|回答者|response:Answer#by|
|to|form:item|回答した質問|response:Answer#to|
|value|form:option、もしくはリテラル|行った回答|response:Answer#value|

### データ例

~~~
@prefix http://example.com/survey/
@prefix response http://www.hyakuju.keio.ac.jp/vocabulary/questionnaire/response/

_ a response:Answer ;
  by responder#1 ;
  to form#item1 ;
  value form#option1 .
~~~

## Responder

|項目|解説|
|---|----|
|URL|response:Responder|
|rdf:type|rdfs:Class|
|subclassOf|foaf:Person|
|解説|回答を行った主体|

### 属性

|属性名|値域|解説|URL|
|-----|---|---|----|
|responses|rdf:Bag|行った回答のリスト|response:Responder#responses|
|aliases|rdf:Bag|匿名化する際に用いられた名前のリスト|

### データ例

~~~
@prefix http://example.com/survey/
@prefix response http://www.hyakuju.keio.ac.jp/vocabulary/questionnaire/response/

responder#1 a response:Responder ;
  response:Responses [
    rdf:type rdf:Bag ;
    _1 [rdf:type response:Response] ;
    _2 [rdf:type response:Response] .
  ] ;
  response:aliases [
    rdf:type rdf:Bag ;
    _1 [rdf:type response:Responder] ;
    _2 [rdf:type response:Responder] .
  ] .
~~~
