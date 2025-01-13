# 심리케어 기룡이

우울증 환자들의 감정 관리를 위한 상담형 챗봇 및 일상 관리 프로그램
<br/><br/>

## 프로젝트 목적
사용자의 자연어 입력값에 대한 이해가 잘 이루어지는 채팅 상담을 진행한다. 
<br/>또한 사용자의 일기 기록을 유의미하게 할 수 있는 감정 분석을 진행하여 해당 감정을 기반으로 노래를 추천해주므로써 감정의 공감 및 극복에 도움을 주어 우울증 환자의 일상에서의 지속적인 질환 관리를 가능하도록 하기 위한 감정 관리 상담형 챗봇 및 일상 관리 애플리케이션을 개발하는 것이 최종 목적이다.

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
![KakaoTalk_20250113_200322908](https://github.com/user-attachments/assets/f777bd3e-327e-46e6-a1d7-20a404ae614d)
<br/>
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
![KakaoTalk_20250113_200322908_01](https://github.com/user-attachments/assets/36ba2566-3177-449b-a7b7-46e49fbc7d1a)<br/>
<li> 채팅 : 상담을 원하는 내용을 입력하면, 이에 대해 알맞은 답변을 해줌</li>
<li> 일기 : 달력에서 날짜를 선택하여 일기 작성 전 감정을 먼저 기록<br/>
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 이후 자유롭게 일기를 작성하고, 일기 작성 후 감정을 기록하여 작성한 일기를 저장<br/>
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 연필 버튼을 눌러 일기를 수정, 휴지통 버튼을 눌러 일기 삭제 가능<br/>
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 일기 작성한 날짜는 하늘색 점으로 표시<br/>

<br/><br/><br/>
<b>3. 감정통계 & 우울증 척도 표시 </b><br/><br/>
![KakaoTalk_20250113_200322908_02](https://github.com/user-attachments/assets/91b3f3db-ed86-44d1-a6ea-bbe9cd3be80e)
<br/>
<li> 감정 통계: 일기 작성 내용 기반으로 하루&월간 단위로 사용자의 기분 통계를 표시</li>
<li> 우을증 척도 설문조사: PHQ-9 설문지를 통해 사용자의 우울증 수준을 체크</li>

<br/><br/><br/>
<b>4. 음악 추천 기능 </b><br/><br/>
![KakaoTalk_20250113_200322908_03](https://github.com/user-attachments/assets/6e12ff1c-0c61-49b4-8b25-135e3ad87f24)<br/>
<li> 오늘의 날짜 기준으로 사용자가 작성한 일기 기반 또는 새로운 감정 키워드를 선택해 음악을 추천받는 것을 선택할 수 있음</li>
<li> 사용자가 입력한 감정에 맞게 공감 또는 해당 감정을 극복할 수 있는 두가지 카테고리로 노래 추천 받을 수 있음</li>
   



