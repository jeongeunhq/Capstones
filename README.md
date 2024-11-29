# 마음씨 (마음°C)

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
<li> 메인 화면 : 경험치를 쌓아 캐릭터를 키울 수 있는 시스템이 있음<br/>
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp기본 행동 추천을 진행하며, 마이페이지로 갈 수 있음</li>
<li> 마이페이지 : 로그인과 로그아웃, 회원가입을 진행할 수 있는 페이지</li>
<li> 로그인 : 이미 가입된 회원으로 아이디 비밀번호를 입력하여 로그인 할 수 있음<br/>
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    &nbsp&nbsp&nbsp 로그인 후 마이페이지에 닉네임 노출됨 </li>


<br/><br/><br/>
<b>2. 회원가입</b><br/><br/>
<img width="800" alt="KakaoTalk_Photo_2024-08-28-13-52-59" src="https://github.com/user-attachments/assets/cb566b3c-8961-4b4f-a8a3-169c80de5db9"><br/>
<li> 회원가입 : 아이디(이메일 형식) 중복 검사 진행<br/>
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
    이후 비밀번호, 닉네임, 성별, 생일을 수집하여 회원가입을 진행함</li>


<br/><br/><br/>
<b>3. 채팅 </b><br/><br/>
<img width="800" alt="KakaoTalk_Photo_2024-08-28-13-53-05" src="https://github.com/user-attachments/assets/80faf72d-c7fa-45d0-a628-17c0c3a9967c"> <br/>
<li> 채팅 : 상담을 원하는 내용을 입력하면, 이에 대해 알맞은 답변을 해줌</li>



<br/><br/><br/>
<b>4. 일기 </b><br/><br/>
<img width="800" alt="KakaoTalk_Photo_2024-08-28-13-53-22" src="https://github.com/user-attachments/assets/5aa19fd3-e2fd-428b-9b12-9120a7bc9dc0"> <br/>
<li> 일기 : 달력에서 날짜를 선택하여 일기 작성 전 감정을 먼저 기록<br/>
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 이후 자유롭게 일기를 작성하고, 일기 작성 후 감정을 기록하여 작성한 일기를 저장<br/>
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 이미 일기를 작성한 날짜일 경우 기록했던 전후 감정을 보여줌<br/>
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 연필 버튼을 눌러 일기를 수정, 휴지통 버튼을 눌러 일기 삭제 가능<br/>
    &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 일기 작성 후 감정을 기반으로, 알맞은 배경 음악을 생성하고 플레이함



<br/><br/><br/>
<b>5. 통계 </b><br/><br/>
<img width="280" alt="KakaoTalk_Photo_2024-08-28-13-53-27" src="https://github.com/user-attachments/assets/294c6407-066c-4e19-a97a-e4d23ec124ad"> <br/>
<li> 월간 감정 통계 : 사용자가 한 달간 기록한 일기의 작성 후 감정 통계를 보여줌</li>
<li> 감정 통계 Top3 : 사용자가 모든 기간을 통틀어서 기록한 일기의 작성 후의 감정 통계 중 가장 높은 Top3를 보여줌
<li> 행동 통계 : 사용자가 진행한 행동 중 행동 전 감정이 부정이었다가 긍정으로 변화한 경우의 행동 리스트를 보여줌
<li> 시간대 별 감정 통계 : 24시를 4분할하여 각 시간대별로 가장 많이 기록한 감정을 보여줌



<br/><br/><br/>
<b>6. 행동 추천 </b><br/><br/>
<img width="800" alt="KakaoTalk_Photo_2024-08-28-13-57-22" src="https://github.com/user-attachments/assets/22ca58b1-80ca-4697-a210-a4ad631f2c24"> <br/>
<li> 행동 추천 : 사용자의 이전 감정을 받아 해당 감정을 완화 또는 해소, 강화할 수 있는 행동을 추천함<br/>
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 추천 받은 행동 중 하나를 골라 선택, 행동 이전 감정을 기록하여 행동을 시작함<br/>
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 진행 중인 행동을 눌러 행동 이후 감정을 기록하고 행동을 완료할 수 있음<br/>
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp 만약 감정이 부정적인 것에서 긍정적인 종류로 변했을 경우, 누적되어 통계 페이지에 나타남


<br/><br/><br/>
<b>7. 우울증 건강 설문 </b><br/><br/>
<img width="550" alt="KakaoTalk_Photo_2024-08-28-14-00-27" src="https://github.com/user-attachments/assets/4ffc1e38-f1a3-4fd9-bf09-9ea0b35c04da"> <br/>
<li> 우울증 건강 설문 해보기 버튼을 눌러 설문을 진행할 수 있으며, 우울 척도를 진단할 수 있음. <br/>
&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp이전 기록과 현재 기록을 비교하여 자신의 상태를 트래킹할 수 있음
