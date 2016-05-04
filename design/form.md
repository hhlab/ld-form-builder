# 質問票

質問票を記述するための語彙について記述します

なお使用される prefix と URL との対応は、以下の表を参照してください。

|prefix|URL|
|------|---|
|rdf|http://www.w3.org/1999/02/22-rdf-syntax-ns#|
|rdfs|http://www.w3.org/2000/01/rdf-schema#|
|dc|http://purl.org/dc/elements/1.1/|
|xsd|http://www.w3.org/2001/XMLSchema#|
|form|http://www.hyakuju.keio.ac.jp/vocabulary/questionnaire/form/|
|respnose|http://www.hyakuju.keio.ac.jp/vocabulary/questionnaire/response/|

## Form

|項目|解説|
|---|----|
|URL|form:form|
|rdf:type|rdfs:Class|
|解説|質問表|

### 属性

|属性名|値域|解説|URL|
|-----|---|---|----|
|options|rdf:Bag|質問票で使用されている選択肢のリスト|form:form#options|
|items|rdf:Seq|質問票の質問リスト|form:form#item|
|title|rdf:Literal|質問票のタイトル|dc:title|

## Item

|項目|解説|
|---|----|
|URL|form:item|
|rdf:type|rdfs:Class|
|解説|質問表中の質問を表す基底クラス|

### 属性

|属性名|値域|解説|URL|
|-----|---|---|----|
|title|rdf:Literal|質問のタイトル|dc:title|
|parent|form:form|その質問が属する質問票|form:item#parent|

## Group

|項目|解説|
|---|----|
|URL|form:item|
|rdf:type|rdfs:Class|
|rdfs:subClassOf|form:item|
|解説|いくつかの質問をまとめたグループ|

### 属性

form:item から継承する属性に加えて、以下のものを持ちます。

|属性名|値域|解説|URL|
|-----|---|---|----|
|item|rdf:Bag|質問項目のリスト|form:group#item|

## Checkbox

|項目|解説|
|---|----|
|URL|form:checkbox|
|rdf:type|rdfs:Class|
|rdfs:subClassOf|form:item|
|解説|択一式の設問|

### 属性

form:item から継承する属性に加えて、以下のものを持ちます。

|属性名|値域|解説|URL|
|-----|---|---|----|
|options|rdf:Seq|選択肢のリスト|form:checkbox#options|

## Option

|項目|解説|
|---|----|
|URL|form:option|
|rdf:type|rdfs:Class|
|解説|設問の選択肢|

### 属性

|属性名|値域|解説|URL|
|-----|---|---|----|
|label|rdf:Literal|人間可読なラベル|rdfs:lael|
|parents|rdf:Bag|その選択肢を利用する設問のリスト|form:option#parents|

## NumberField

|項目|解説|
|---|----|
|URL|form:option|
|rdf:type|rdfs:Class|
|rdfs:subClassOf|form:item|
|解説|数値を回答する設問|

### 属性

form:item から継承する属性に加えて、以下のものを持ちます。

|属性名|値域|解説|URL|
|-----|---|---|----|
|allows|xsd:simpleType|取りうる数値に対する制約|form:number_fied#allows|
