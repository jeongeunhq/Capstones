# 심리케어 기룡이

우울증 환자들의 감정 관리를 위한 상담형 챗봇 및 일상 관리 프로그램
<br/><br/>

## 프로젝트 목적
사용자의 자연어 입력값에 대한 이해가 잘 이루어지는 채팅 상담을 진행한다. 
<br/>또한 사용자의 일기 기록을 유의미하게 할 수 있는 감정 분석을 진행하여 해당 감정을 기반으로 행동을 추천, 행동을 진행함으로써 감정의 공감 및 극복에 도움을 주어 우울증 환자의 일상에서의 지속적인 질환 관리를 가능하도록 하기 위한 감정 관리 상담형 챗봇 및 일상 관리 애플리케이션을 개발하는 것이 최종 목적이다.

<br/><br/>

## 프로젝트 실행
1. <b>'Flutter'</b> 폴더 다운로드 <br/>
2. 터미널에 - cd heart
3. 터미널에 - flutter pub get
4. ctrl + shift + P 로 안드로이드 애뮬레이터 실행
5. 터미널에 - flutter run

<br/><br/>

## 애플리케이션 사용자 매뉴얼
<br/>
<b>1. 메인 화면 + 로그인</b><br/><br/>

<img width="800" alt="KakaoTalk_Photo_2024-08-28-13-52-54" src="https://github.com/user-attachments/assets/b05c119b-ae70-44d8-b337-84bb9b301d09"><br/>
<li> 메인 화면 : 로그인과 회원가입을 할 수 있음<br/>
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp</li>
<li> 로그인 : 이미 가입된 회원으로 아이디 비밀번호를 입력하여 로그인 할 수 있음<br/>
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    &nbsp&nbsp&nbsp 로그인 후 로그아웃 기능이 있는 페이지가 나옴 </li>
<li> 회원가입 : 아이디(이메일 형식) 중복 검사 진행<br/>
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    이후 비밀번호, 닉네임, 성별, 생일을 수집하여 회원가입을 진행함</li>

<br/><br/><br/>
<b>2. 채팅, 일기 작성</b><br/><br/>
<img width="800" alt="KakaoTalk_Photo_2024-08-28-13-52-59" src="https://github.com/user-attachments/assets/cb566b3c-8961-4b4f-a8a3-169c80de5db9"><br/>
<li> 채팅 : 상담을 원하는 내용을 입력하면, 이에 대해 알맞은 답변을 해줌</li>


<br/><br/><br/>
<b>3. 채팅 </b><br/><br/>
<img width="800" alt="KakaoTalk_Photo_2024-08-28-13-53-05" src="https://github.com/user-attachments/assets/7cc7b201-768b-43d4-a684-d9f7723bc41b"> <br/>
<li> 채팅 : 상담을 원하는 내용을 입력하면, 이에 대해 알맞은 답변을 해줌</li>
<li> 일기 : 달력에서 날짜를 선택하여 일기 작성 전 감정을 먼저 기록<br/>
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 이후 자유롭게 일기를 작성하고, 일기 작성 후 감정을 기록하여 작성한 일기를 저장<br/>
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 연필 버튼을 눌러 일기를 수정, 휴지통 버튼을 눌러 일기 삭제 가능<br/>
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 일기 작성한 날짜는 하늘색 점으로 표시<br/>

<br/><br/><br/>
<b>4. 감정통계 & 우울증 척도 표시 </b><br/><br/>
<img width="800" alt="KakaoTalk_Photo_2024-08-28-13-53-22" src="https://github.com/user-attachments/assets/fd3704ae-3caf-4bf9-ad32-efdf97a6cf1d"> <br/>
<li> 감정 통계: 일기 작성 내용 기반으로 하루&월간 단위로 사용자의 기분 통계를 표시</li>
<li> 우을증 척도 설문조사: PHQ-9 설문지를 통해 사용자의 우울증 수준을 체크</li>
   



