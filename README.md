# Easypeasy
파이널 프로젝트 - 그룹웨어 EasyPeasy

 
***

# Contents <br>
1. [개요](#star-개요)  
2. [팀 소개 및 주요 기능](#star-팀-소개-및-주요-기능)
3. [구현 기능](#star-구현-기능)
    - [전자결재 메인](#pushpin-전자결재-메인)
    - [기안문서 작성하기](#pushpin-전자결재-새 결재진행)
    - [결재/참조자 선택](#pushpin-전자결재-새 결재진행-결재선지정)  
    - [개인/ 부서문서함 목록](#pushpin-전자결재-메뉴바)
    - [기안문서 수정/삭제](#pushpin전자결재-메뉴바-기안문서함-상세-수정/삭제)    
    - [결재 / 반려하기](#pushpin-결재대기문서 or 결재문서함-상세-결재/반려)
    - [임시저장](#pushpin-전자결재-새 결재진행-임시저장)
    - [상태완료문서 재 기안](#pushpin전자결재-메뉴바-기안문서함-상세-재기안) 



4. [Document](#star-document)

***

# :star: 개요
- 프로젝트명 : 그룹웨어 EasyPeasy <br>

- 보고서 : [230410_최종보고서_이지피지.pdf](https://github.com/DahyeLee1205/Easypeasy/files/11187973/230410_._.pdf)<br>

- 기획 의도  <br>
  - 코로나로 인한 비대면 시대로 재택근무가 증가함에 따라 업무의 효율성이 높은 그룹웨어 필요성 대두 <br>
  - 환경오염 문제 해결을 위해 종이 없는 사회의 실현이 가속화하는 시대의 흐름에 따라 페이퍼리스 시스템인 그룹웨어 필요성 증가  <br>
  - 누구나 쉽고 간편하게 접근 가능하도록 직관적인 그룹웨어 개발  <br>

- 개발 환경 <br><br>
<img width="1136" alt="개발환경_이지피지" src="https://user-images.githubusercontent.com/106331443/230834907-5d8b4ba7-5572-427d-a651-102181586a11.png">

***

# :star: 팀 소개 및 주요 기능
<img width="800" alt="구현세부기능_이지피지" src="https://user-images.githubusercontent.com/106331443/230836172-0c55e1d9-2389-48ba-86dd-ef403feecbf9.png"><br>
<img width="800" alt="업무분담_이지피지" src="https://user-images.githubusercontent.com/106331443/230836305-3304f470-6ab7-4f06-a894-766083c301f7.png"><br>
<br>
***
# :star: 구현 기능
 

### :pushpin: 전자결재 메인
[1 전자결재 메인]<img width="800" alt="image" src="https://user-images.githubusercontent.com/106331443/230837209-e2fb141c-f5b1-4d0a-a003-511738d6af49.png"><br>
- 구현 기능 설명
   - 상단 : 결재 대기문서 조회, 로그인한 사원이 아직 결재 혹은 반려하지 않은 문서목록(최신순, 5개)
   - 하단 : 기안 진행문서 조회, 로그인한 사원이 작성한 문서 상태가 진행중인 문서 목록(최신순, 5개)
   - 왼쪽 메뉴바-참조대기문서 : 로그인한 사원이 참조받은 문서목록들 중 아직 읽지 않은 문서 목록전체
   - 왼쪽 메뉴바-결재대기문서 : 로그인한 사원이 결재 혹은 반려하지 않은 문서목록 전체
<br>

<br>
📍 결재대기문서 조회하는 sql문
<img width="565" alt="결재대기문서 mapper" src="https://user-images.githubusercontent.com/106331443/230838170-52d3dbb5-ec89-41d1-9d97-404cb4b3fdc9.png">

<br>

📍 기안진행문서 조회하는 sql문
<img width="646" alt="기안진행문서 mapper" src="https://user-images.githubusercontent.com/106331443/230838197-43e3ebe7-ec0f-422c-9620-fd9febca2dfe.png">

<br>

<br><br>


### :pushpin: 기안문서 작성하기
[2 새 결재진행] <img width="800" alt="결재문서작성" src="https://user-images.githubusercontent.com/106331443/230839549-a7c18b7c-1eed-4cdb-9b02-cd43cdf2fdbd.png">
<br>
- 구현 기능 설명
   - '새 결재 진행' 버튼 클릭 시 문서양식 선택하는 modal 띄워짐
   - 문서 양식 선택 시 보안등급 및 보존연한 표시
   - 양식 선택 후 '확인' 클릭 시 해당 양식의 작성페이지로 이동
   - ajax 를 사용하여 로그인한 회원의 정보와 생성된 문서번호가 작성페이지에 나타남
   <br>
    <img width="726" alt="작성하기_업무기안" src="https://user-images.githubusercontent.com/106331443/230841180-102d3833-1e95-4f75-b722-29d61fa8bbc8.png">
    <br>
    <img width="724" alt="작성하기_연장근무신청서" src="https://user-images.githubusercontent.com/106331443/230841183-919e6926-e343-4922-aeec-05a850113a33.png">
    <br>
    <img width="724" alt="작성하기_일반품의서" src="https://user-images.githubusercontent.com/106331443/230841188-47ba45fe-f4e9-4a23-b223-cfcaa11e7067.png">
    <br>
    <img width="722" alt="작성하기_휴가신청서" src="https://user-images.githubusercontent.com/106331443/230841189-f45ccf11-99e3-48e8-b687-53aefa65db46.png">
    <br>

<br><br>


### :pushpin: 결재/참조자 선택
[3  결재/참조자 선택] <img width="800" alt="image" src="https://user-images.githubusercontent.com/106331443/230845189-d403b667-1025-4622-84d3-aaa7955766c9.png">
<br>
<img width="800" alt="image" src="https://user-images.githubusercontent.com/106331443/230845737-090af50d-890a-4474-8f3e-7a7bea09cfc3.png">
<br>

- 구현 기능 설명
   - modal을 이용하여 결재자 참조자 선택가능
   - 선택된 사원은 중복선택불가(추가버튼 비활성화 & 삭제 버튼 '-' 으로 변경됨)
   - '확인' 클릭 시 순차적으로 참조자 선택으로 넘어감(선택사항)
   - 최종선택 후 '확인' 클릭 시 결재 혹은 참조자 란에 표시됨 
<br><br>


### :pushpin: 개인/ 부서문서함 목록
[4-1 개인문서함]<img width="800" alt="image" src="https://user-images.githubusercontent.com/106331443/230847154-085f1a91-99d7-45a3-a574-e945f07b031e.png">
<br>
<img width="800" alt="image" src="https://user-images.githubusercontent.com/106331443/230847297-75d648cf-7bf7-4c7d-96d5-8f09aca89912.png">
<br>
<img width="800" alt="image" src="https://user-images.githubusercontent.com/106331443/230847421-c3cfd824-6530-4bff-b059-18fa9057ccc2.png">
<br>
<img width="800" alt="image" src="https://user-images.githubusercontent.com/106331443/230847480-e3e8a216-69cc-4ba4-9af4-7c2c0cfc5379.png">
<br>
<img width="800" alt="image" src="https://user-images.githubusercontent.com/106331443/230866802-1a80fa8a-f2eb-4f7e-aca5-f1493626d506.png">
<br>

- 구현 기능 설명

   - 로그인한 사원의 결재 혹은 참조, 임시저장, 기안 문서목록 나타냄
   - 결재문서 목록 중 해당 로그인한 사원의 결재순서가 되면 목록에서 조회됨
   - 결재 상태별 조회가능
   - 검색, 페이징 기능
   <br><br>
[4-2 부서문서함]<img width="800" alt="image" src="https://user-images.githubusercontent.com/106331443/230856841-b53f818b-cef5-463a-9f2b-0e51c606e4e5.png">
<br>
<img width="800" alt="image" src="https://user-images.githubusercontent.com/106331443/230856938-18ba7dca-c43d-464b-8482-f308ad925376.png">
<br>
- 구현 기능 설명
   - 로그인한 사원이 속하는 부서의 기안완료, 참조문서함 조회
   - 검색, 페이징 기능
<br><br>


### :pushpin: 기안문서 수정/삭제
[5 기안문서 수정 및 삭제]<img width="800" alt="image" src="https://user-images.githubusercontent.com/106331443/230865672-b88c190a-856a-4b9d-a86a-cc79a983ed08.png">
<br>
- 구현 기능 설명
   - 수정 클릭 시 해당문서의 문서번호와 내용을 그대로 select(기존 결재선과 첨부파일은 delete되고 사용자가 입력한 값이 insert됨)
   - 수정(작성하기페이지)에서 임시저장 가능[구현기능_7번 참고]
   - 결재문서 삭제 시 해당문서에 해당되는 문서는 status == 3('삭제')으로 변경, 해당 문서의 키를 참조하고 있는 첨부파일과 결재선data들은 모두 delete
<br><br>


### :pushpin: 결재/ 반려하기
[6 결재하기/ 반려하기]<img width="800" alt="image" src="https://user-images.githubusercontent.com/106331443/230865955-d1e67394-1ddb-48bd-83c9-804d8096592d.png">
<br>
<img width="725" alt="image" src="https://user-images.githubusercontent.com/106331443/230866039-02f28cd9-d65c-4f8f-bb24-455b7461cd98.png">
<img width="718" alt="image" src="https://user-images.githubusercontent.com/106331443/230870326-e71f4902-307a-42b7-95ae-53acc27d7a60.png">
<img width="572" alt="image" src="https://user-images.githubusercontent.com/106331443/230870574-bab1811c-491f-4cb6-ba12-b7b8d1e8fe58.png">
<img width="527" alt="image" src="https://user-images.githubusercontent.com/106331443/230870701-abe2786a-a16d-4d2f-8ad6-03cdf96847cc.png">
<br>
- 구현 기능 설명
- 결재 혹은 반려 시 의견작성 필수, 결재의견은 문서 상세페이지에 표시됨  
- 반려 등록 시 해당문서의 상태는 '반려' 로 변경
<br><br>


### :pushpin: 임시저장
[7 임시저장]<img width="800" alt="image" src="https://user-images.githubusercontent.com/106331443/230872582-f4d786e1-f33b-460f-ba23-c70ef6fb3b95.png">
<img width="800" alt="image" src="https://user-images.githubusercontent.com/106331443/230872762-9a81605c-749c-4cd0-83b7-75c14fff8de9.png">
<img width="800" alt="image" src="https://user-images.githubusercontent.com/106331443/230872888-d4e9d215-c285-4b4f-9f1c-e2c070ff68df.png">
<br>
- 구현 기능 설명
   - 결재선 or 내용 등 필수 입력사항이 기재되지 않아도 (상태값 '2' == 임시저장) 으로 insert됨
   - 임시저장함 상세페이지 내에서 다시 문서를 이어서 작성 또는 임시저장 가능
   <img width="800" alt="image" src="https://user-images.githubusercontent.com/106331443/230916845-205fa5a9-40bb-42da-b9f2-2d0774eb753e.png">

<br><br>


### :pushpin: 상태완료문서 재 기안
[8 문서재기안]<img width="800" alt="image" src="https://user-images.githubusercontent.com/106331443/230871200-375b592b-3351-4ce3-b1ab-dac701fd1581.png">
<img width="800" alt="image" src="https://user-images.githubusercontent.com/106331443/230915694-f15c4b57-8539-4d34-bcd6-4ca8b010cc42.png">
<br>
- 구현 기능 설명
   - 로그인한 회원의 기안문서 중 상태가 '결재완료' 또는 '반려' 인 문서에 한해 재기안 가능
   - 문서 상세페이지 내의 '재기안' 클릭 시 새로운 문서번호 생성 후 기존 내용을 가지고 작성페이지로 이동 
 
<br><br>



***
# :star: Document

## 개발 일정 <br>
<img width="1172" alt="image" src="https://user-images.githubusercontent.com/106331443/230918082-7afaad0b-11f6-4144-a368-83b47cca9ae1.png">


<br>

## 유스케이스 <br>
<img width="1088" alt="image" src="https://user-images.githubusercontent.com/106331443/230918193-ab309d4b-c9b6-4ffe-82f7-0f0cf0e9f449.png">
<img width="985" alt="image" src="https://user-images.githubusercontent.com/106331443/230918268-35e11a86-7d0f-45d3-beb2-2dcddc554d82.png">


<br>

## DB 설계 <br>
<img width="931" alt="image" src="https://user-images.githubusercontent.com/106331443/230918368-87e9fa0c-5dd1-4662-afba-6773c0a6d6a9.png">

<br>
