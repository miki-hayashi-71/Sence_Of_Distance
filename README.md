# 距離感どのくらい？

## ■ サービス概要

<!-- // どんなサービスなのかを３行で説明してください。 -->

- お出かけ先・旅行先など、馴染みのない土地における次の目的地までの移動距離を、自宅等の馴染みのある土地と比較して、距離感を確認するためのアプリです。
- 旅行先の移動距離を自宅周辺の距離と比較し、ユーザーが距離感を掴みやすくすることを目的としています。
- 視覚的な地図表示を用いて、ユーザーにとってわかりやすい情報提供を行います。

## ■ このサービスへの思い・作りたい理由

<!-- このサービスの題材となるものに関してのエピソードがあれば詳しく教えてください。 -->
<!-- このサービスを思いつくにあたって元となる思いがあれば詳しく教えてください。 -->

- 旅行や出張で馴染みのない土地に行ったとき、目的地までの距離感が掴みにくく、移動計画を立てるのが難しいという経験からこのアイデアが生まれました。
- 自宅やよく行く場所を基準にして距離を比較することで、馴染みのない土地でも親近感を持てること、また、ユーザーが安心して移動できるようにしたいという思いがあります。
- ユーザーが新しい場所でも快適に移動できるように支援することで、旅行やお出かけをより楽しいものにしたいと考えています。

## ■ ユーザー層について

<!-- 決めたユーザー層についてどうしてその層を対象にしたのかそれぞれ理由を教えてください。 -->

- 普段からスマホで地図アプリ（Google Map）を利用する幅広い年齢層のユーザーを対象としています。
- 旅行やお出かけが好きな人を対象としています。旅行先での移動計画に役立つ機能を提供することで、ユーザーの旅行体験を向上させることができます。

## ■ サービスの利用イメージ

<!-- ユーザーがこのサービスをどのように利用できて、それによってどんな価値を得られるかを簡単に説明してください。 -->

### 旅行先での利用

- ユーザーが旅行先等で出発地点と到着地点を入力し、自宅等の馴染みのある地点を登録します。
- アプリが入力された地点間の距離を計算し、その距離に相当する自宅周辺の地点を提案します。
- ユーザーは地図上で提案された地点を確認し、旅行先での距離感を視覚的に理解します。
- これにより、ユーザーは旅行先での移動距離を感覚的に把握し、安心して移動計画を立てることができます。

### バーチャル旅行

- ユーザーが行きたい都市や場所の出発地点（例：パリ）と到着地点（例：ローマ）を入力します。
- アプリがその間の距離を計算し、自宅から同じ距離に相当する場所を提案します。
- 例えば、パリからローマまでの距離が自宅からどこまでに相当するかを知ることで、ユーザーは現実の感覚で距離を把握できます。
- これにより、ユーザーは実際に旅行に行かなくても、異なる都市間の距離感を理解することができ、旅行計画の参考にすることができます。

## ■ ユーザーの獲得について

<!-- 想定したユーザー層に対してそれぞれどのようにサービスを届けるのか現状考えていることがあれば教えてください。 -->

- LINE の共有機能を活用し、ユーザーが検索結果を友達と共有することで、アプリの存在を多くの人に知ってもらうきっかけを作ります。

## ■ サービスの差別化ポイント・推しポイント

<!-- 似たようなサービスが存在する場合、そのサービスとの明確な差別化ポイントとその差別化ポイントのどこが優れているのか教えてください。 -->
<!-- 独自性の強いサービスの場合、このサービスの推しとなるポイントを教えてください。 -->

- 一般的な地図アプリとは異なり、距離感を自宅などの馴染みのある地点と比較する機能を提供します。
- 視覚的な地図表示により、ユーザーが直感的に距離感を理解できるように設計されています。
- 過去の検索履歴を保存し、いつでも確認できる機能を提供することで、ユーザーの利便性を向上させます。

## ■ 機能候補

<!-- 現状作ろうと思っている機能、案段階の機能をしっかりと固まっていなくても構わないのでMVPリリース時に作っていたいもの、本リリースまでに作っていたいものをそれぞれ分けて教えてください。 -->

### MVP リリース

- 出発地点と到着地点の入力機能
- 自宅、現在位置、特定の別地点の登録機能
- 旅行先の距離計算と自宅周辺の地点提案機能
- 地図の表示と距離比較結果の視覚化
- 検索履歴の保存と表示機能

### 本リリースまで

- 提案地点の詳細情報表示（評価、写真など）
- 提案地点のカスタマイズ（ユーザーが手動で地点を調整できる機能）
- 比較結果を LINE で共有する機能
- ユーザーインターフェースの改善（UI/UX の向上）

## ■ 機能の実装方針予定

<!-- 一般的なCRUD以外の実装予定の機能についてそれぞれどのようなイメージ(使用するAPIや)で実装する予定なのか現状考えているもので良いので教えて下さい。 -->

### ユーザー登録機能

### ログイン機能

### パスワード変更機能

### メールアドレス変更機能

### 出発地点と到着地点の入力機能

- Geocoding API
  - ユーザーが入力した住所（出発地点、到着地点）を緯度・経度に変換する。

### 自宅、現在位置、特定の別地点の登録機能

- Geocoding API
  - 自宅等の比較の起点となる住所を緯度・経度に変換するために Geocoding API を使用
  - ユーザーの現在位置を取得するために HTML5 Geolocation API を使用

### 旅行先の距離計算と自宅周辺の地点提案機能

- Distance Matrix API
  - 出発地点と到着地点の間の距離を計算するために Distance Matrix API を使用
- Places API
  - 計算された距離に基づいて、自宅周辺の地点を提案するために Places API を使用

### 地図の表示と距離比較結果の視覚化

- Maps JavaScript API
  - 地図を表示し、出発地点、到着地点、自宅周辺の地点をマーカーで表示
  - 距離比較結果を視覚的に表示

### 検索履歴の保存と表示機能

- 検索履歴をデータベースに保存し、ユーザーが過去の検索を確認できるようにする

### 検索履歴の確認機能

## 画面遷移図

Figma：https://www.figma.com/design/yUXUMkFEB7Cq0AhOMM1ZLU/Snence_Of_Distance?node-id=0-1&t=8EIb9VEk0Q1hDZix-1
