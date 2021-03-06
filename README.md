# Media Trend

미디어 트렌드와 관련 상세 정보를 보여주는 앱 🎬
<br /><br />

| TrendMainVC             |  CastingVC 			| SearchVC 		|
:-------------------------:|:-------------------------:|:-------------------------:
<img src="Resources/3.png" width= "70%"> | <img src="Resources/4.png" width= "70%"> | <img src="Resources/5.png" width= "70%">
<br /><br />
# Index 📇
- [구현기간](#구현-기간)
- [사용 요소 및 개념](#사용-요소-및-개념)
- [의존성](#의존성)
- [요구사항](#요구사항)
- [구현 포인트](#구현-포인트)
- [이왜안](#이왜안)
<br />

## 구현 기간

- _1차 요구사항 - 21.10.19 (약 1일 )_
- _2차 요구사항 - 21.10.20 (약 1일 )_
- _3차 요구사항 - 21.10.21~_

<br />

# 사용 요소 및 개념
- **UITableView**
  - `CustomReusableCell`
  - `CustomTableHeaderView`
  - `Self-Sizing-Cell`
<br />

- **UIStackView**
  - `CompressionResistancePriority`
<br /> 

- **UIView & CALayer**
  - `masksToBounds`, `clipsToBounds`
  - `ShadowView`
<br />

- **StoryBoards & Xibs**
  - `Storyboard Reference`
    - 아래 두 가지 요구사항을 동시에 충족시키기 위해 사용하였습니다.
      1. 화면 간 전환에 Segue 를 사용한다
      2. 한 화면 당 하나의 스토리보드를 사용한다
<br />

## 의존성
 - **`SwiftPM`** : 의존성 관리자
 - **`Kingfisher`** : 이미지 비동기 다운로드 및 캐싱
 - **`Alamofire`**

<br /><br />

## 요구사항
`🔥 : 도전 과제`  `➕ : 추가된 요구사항`
<br />
### A 화면 ( TrendMainVC )

- 영화 트렌드 정보를 보여주는 화면
- [x]  UIViewController + UIView + UITableView 형태로 구성된 씬
- [x]  샘플 데이터 중 표현하고 싶은 데이터를 자유롭게 셀에 표현
- [x]  셀 디자인은 자유 (단, titlle, genre, poster, rate 라는 4가지 요소는 반드시 사용할 것
- [x] 🔥 셀의 오른쪽 상단에 링크 버튼을 달고, 클릭 시 WebView 로 화면전환
<br />

### B화면 ( SearchVC )

- 영화 검색 시 사용하는 화면
- [x]  UIViewController + UISearchBar + UITableView 형태로 구성된 씬
- [x]  A화면의 우측 상단 검색 버튼을 누르면 FullScrenn 방식으로 B 화면이 전환된다
- [x]  B 화면의 왼쪽 상단 닫기 버튼을 누르면, B 화면이 A 화면으로 전환된다
<br />

### C화면 ( CastingVC )

- 영화 출연 배우들을 보여주는 화면
- [x]  UIViewController + UITableView 형태로 구성된 씬
- [x]  A 화면의 테이블뷰 셀을 선택하면, Push 방식으로 C화면이 전환
- [x]  우선 임시 데이터로 테이블 뷰 동작 확인
- [x]  ➕ A 화면에서 C화면으로 화면 전환 시 tvShow 모델 정보를 전달
- [x]  ➕ 테이블 헤더뷰를 만들고, 헤더뷰에 영화정보를 보여주기
- [x]  🔥 헤더뷰 배경 사진을 `Kingfisher` 를 사용하여 불러오기
- []  ➕ 줄거리 정보를 표현하는 줄거리 셀 추가하기 
  - 접기 펼치기 버튼 기능을 구현한다.
  -  AutomaticDimension, reloadRows, addTarget
<br /><br />

# 구현 포인트

### ☑️ 재사용 테이블 뷰 셀

- 스토리보드 내부의 프로토타입 셀 구성 대신  `.xib` 파일로 생성하여 셀을 재사용할 수 있다.
- 테이블 뷰에 register 하는 작업이 추가적으로 필요함
- Reuse Identifier 은 관리를 줄이기 위해 [ 파일명 = 클래스명 = 재사용 식별자 ] 전략으로 간다!!!!!!

```swift
class CastingTableViewCell: UITableViewCell {
  
  static var identifier = "CastingTableViewCell"
  
  // UINib 생성자에 필요. 시맨틱을 주기 위해 계산속성으로 따로 구현했다.
  static var nibName: String {
    
    return identifier
  }

	...
}
```
<br />

### ☑️ 기기 화면에 따른 Label Layout 침범 방지

- 다양한 방법이 있지만 이번엔 `less than equal` 제약으로 trailing 의 최소 여백를 설정
- 요구사항에 적혀있지 않더라도 잡아내야하는 UX 적 고려사항!!!!! ( 배운 내용 🔥 )
<br />
<img src="Resources/1.png" width = "70%">
    
<br />

### ☑️ 명시적 segue 연결이 안되는 경우 ( 테이블 뷰 셀 탭시 화면 이동 )

- segue 연결을 [컨트롤 - VC] 간이 아닌 [VC - VC] 간 연결로 구성
- 적절한 메서드에서 `performSegue(withIdentifier:sender:)` 호출
- 문자열 인라인 전달을 제거하기 위해 따로 상수에 segue identifier 설정
<br />

### ☑️  다중계층 View 의 라운드처리 와 그림자
<br />
<img src="Resources/2.png" width = "60%">

- 라운드 처리된 다중 계층 뷰에 그림자를 추어야 했다. 하지만 `clipsToBounds` 상태에서 그림자를 추가할 수는 없다.
- 라운드 처리된 뷰와 여백 제약을 0으로 맞춘 `ShadowView` 를 만들고 이곳에서 그림자를 구현했다.
- 은은한 그림자 좋았다~~
<br />

### ☑️ MaskToBounds 와 ClipsToBounds 차이는?
- [블로그 글 작성 완료 🔥](https://woozzang.tistory.com/167) 

<br />

### ☑️  Kingfisher 사용하기

- 우선 코드가 확 줄었다
- 비동기로 이미지를 다운로드하고 캐싱해준다.
- 캐싱 기능으로 성능 향상을 기대할 수 있다 ( 메모리 와 디스크에 걸친 다중 레이어 하이브리드 캐시 )
- 필요하다면 이미지 프로세싱 (다운 샘플링) 등의 작업도 가능하다

```swift
    self.backDropImageView.kf.setImage(with: imageURL)

//    URLSession.shared.dataTask(with: imageURL!) { data, response, error in
//
//      if let error = error {
//        print(error.localizedDescription)
//        return
//      }
//
//      guard let response = response as? HTTPURLResponse else { return }
//
//      guard (200...299).contains(response.statusCode) else { return }
//
//      if let data = data {
//        DispatchQueue.main.async { [weak self] in
//          guard let self = self else { return }
//          self.backDropImageView.image = UIImage(data: data)
//        }
//      }
//
//    }.resume()
```
<br />

### ☑️  Cell 안에 포함된 Button 식별하기

Cell 안에 포함된 Button 의 액션 메서드는 VC 에 정의되어 있다.

VC 는 이벤트가 발생한 이 버튼이 어떤 셀의 버튼인지 어떻게 식별할 수 있을까?

1. **Tag 사용하기 (이번에 사용한 방법)**
    - Tag 번호를 IndexPath.row 와 같게 부여해서, Cell 과 연관된 모델 정보를 가지고 올 수 있다.
2. **`weak` 으로 자신의 Cell 을 참조하는 커스텀 버튼을 만들어보자 (혹은 private extension 으로 제한된 범위의 확장만)**


# 이왜안
이거 왜 안돼 ???? 🤔
<br />

### ProtoTypeCell 이 하나도 없는 TableView 에 UIVIew를 추가하면 HeaderVIew 로 인식하지 않는다

스토리보드로 테이블 헤더뷰를 추가할 때, 안쓰더라도 **프로토타입 셀이 하나라도 추가되어있어야** 테이블 헤더뷰를 넣을 수 있다.

없는 상태에서 넣으면 푸터뷰로 인식한다 ㅋㅋㅋㅋㅋㅋㅋ

[추가로 보면 좋은 링크](https://programmingwithswift.com/how-to-add-header-footer-view-in-uitableview-in-storyboard/)