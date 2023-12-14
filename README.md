# ✈️ 특별한 여행, 미션 클리어하고 다양한 혜택 받는 스마트 여행 앱 README
## PJ2T4_DoTrip

![특별한 여행, 다양한 혜택](https://github.com/APP-iOS3rd/PJ2T4_DoTrip/assets/102159946/77b02fc4-e2fd-4692-a4c1-2f5682d5234a)

## 목차
- [팀원 구성](팀원-구성)
- [1. 앱 소개](1.-앱-소개)
- [2. 개발 환경](2.-개발-환경)
- [3. 개발 기술](3.-개발-기술)
- [4. 역할 분담](4.-역할-분담)
- [5. 개발 기간](5.-개발-기간)
- [6. 페이지별 기능](6.-페이지별-기능)
- [7. 회고](7.-회고)
- [8. 참고 링크](7.-참고-링크)
<br/>

## 팀원 구성
<table>
  <tbody>
    <tr>
      <td align="center"><a href="https://github.com/2HYUNHO"><img src="https://private-user-images.githubusercontent.com/102159946/269171632-a6c2cf7c-cef5-4ff0-b7b9-78d9780ed3b2.jpg?jwt=eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJnaXRodWIuY29tIiwiYXVkIjoicmF3LmdpdGh1YnVzZXJjb250ZW50LmNvbSIsImtleSI6ImtleTEiLCJleHAiOjE3MDI1NzUyMzgsIm5iZiI6MTcwMjU3NDkzOCwicGF0aCI6Ii8xMDIxNTk5NDYvMjY5MTcxNjMyLWE2YzJjZjdjLWNlZjUtNGZmMC1iN2I5LTc4ZDk3ODBlZDNiMi5qcGc_WC1BbXotQWxnb3JpdGhtPUFXUzQtSE1BQy1TSEEyNTYmWC1BbXotQ3JlZGVudGlhbD1BS0lBSVdOSllBWDRDU1ZFSDUzQSUyRjIwMjMxMjE0JTJGdXMtZWFzdC0xJTJGczMlMkZhd3M0X3JlcXVlc3QmWC1BbXotRGF0ZT0yMDIzMTIxNFQxNzI4NThaJlgtQW16LUV4cGlyZXM9MzAwJlgtQW16LVNpZ25hdHVyZT1jYmFhMzRlYjNkMzQ3ODIzNDk1YzAzNzg2YTcyYTRlNmEwYmVkZDgzZTczM2QwM2QwYjQxMTk0NDRmMWFmNTA2JlgtQW16LVNpZ25lZEhlYWRlcnM9aG9zdCZhY3Rvcl9pZD0wJmtleV9pZD0wJnJlcG9faWQ9MCJ9.0OW25w9HffWftNE0vAYbeQSUltX47s_QKauhY1VSVY8" width="100px;" alt=""/><br /><sub><b>팀장 : 이현호 </b></sub></a><br /></td>
      <td align="center"><a href="https://github.com/TakeMos"><img src="https://avatars.githubusercontent.com/u/125838606?v=4" width="100px;" alt=""/><br /><sub><b>팀원 : 김강혁</b></sub></a><br /></td>
      <td align="center"><a href="https://github.com/jonghyunBaik"><img src="https://avatars.githubusercontent.com/u/89888855?v=4" width="100px;" alt=""/><br /><sub><b>팀원 : 백종현</b></sub></a><br /></td>
     <tr/>
      <td align="center"><a href="https://github.com/shieun8"><img src="https://avatars.githubusercontent.com/u/110455723?v=4" width="100px;" alt=""/><br /><sub><b>팀원 : 신희선</b></sub></a><br /></td>
      <td align="center"><a href="https://github.com/youjiin0325"><img src="https://avatars.githubusercontent.com/u/93093603?v=4" width="100px;" alt=""/><br /><sub><b>팀원 : 유지인</b></sub></a><br /></td>
      <td align="center"><a href="https://github.com/hyeran1122"><img src="https://avatars.githubusercontent.com/u/97385586?v=4" width="100px;" alt=""/><br /><sub><b>팀원 : 김혜란</b></sub></a><br /></td>
    </tr>
  </tbody>
</table>
<br/>

## 1. 앱소개

💡 사용자가 다양한 지역의 관광 명소를 여행하면서 재미있는 미션을 수행하고, 특별한 경험과 보상을 얻을 수 있는 앱  
 <br/>

## 2. 개발 환경
- 개발: SwiftUI, API
- 버전관리: Github
- 협업툴: Notion, Discord
- 디자인: Figma
<br/>
 
## 3. 개발 기술

- Tour API, RestAPI 활용
- Navigation Path, Navigation Manager 활용
- MapKit, Map annotation 활용
- Json Decoding
- ImagePicker를 활용한 카메라 기능
- 정규식을 이용한 문자열 패턴 정리
- ModalView
- AppStorage 활용
<br/>
 
## 4. 역할 분담
- 🙋‍♂️이현호
    - MY탭 : 마이페이지 뷰, 프로필 수정, 자주 묻는 질문, 이메일 문의
    - 상점탭 : 상점 뷰, 카테고리, 구매 디테일 뷰
<br/>

- 🙋🏻‍♂️김강혁
    - 홈탭 : 메인페이지 뷰, 날짜선택, 지역선택
    - 상점탭 : 상점 뷰, 카테고리, 구매 디테일 뷰
<br/>

- 🙋🏼‍♂️백종현
    - 홈탭 : 맵킷을 활용한 맵뷰, 맵 마커 기능, 검색 뷰
<br/>

- 🙋‍♀️김혜란
    - 행사 상세 뷰
<br/>

- 🙋🏻‍♀️신희선
    - 마이포인트 사용내역/획득내역 뷰, URLSession API 통신 및 데이터 전달, 
    - 상점탭 : 상점 뷰, 카테고리, 구매 디테일 뷰
<br/>

- 🙋🏼‍♀️유지인
    - 미션리스트 페이지, 미션수행페이지 (카메라 기능 이용) 
<br/>
 
## 5. 개발 기간
- 전체 개발 기간 : 2023-12-07 ~ 2023-12-14
- UI 구현 : 2023-12-08 ~ 2023-12-09
- 기능 구현 : 2023-12-10 ~ 2023-12-14

 <br/>
 
## 6. 페이지별 기능
| 메인 페이지 뷰                                                                                                  |
| -------------------------------------------------------------------------------------------------------------|
| ![메인페이지](https://github.com/APP-iOS3rd/PJ2T4_DoTrip/assets/102159946/573e53ac-0ee6-4236-a015-e2babf3e0bcf) |


 <br/>

## 7. 회고

 <br/>

## 8. 참고 링크

 <br/>
