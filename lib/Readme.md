# 프로젝트 구조
- view : ["1. 그림을 그리는 역할"]
  - __components__ : 공통화 할 컴포넌트 파일 생성 (snake_case)
  - __page__ : [도메인 폴더]생성후 하위에 CRUD view 파일 생성 (snake_case)
    
- controller: ["2. 데이터 전달"]
  1. [View]에서 데이터 전달 받음
  2. 데이터를 __Repository__ 전달
  3. 받은데이터를 [View]로 전달 
  
- domain: 
  1. Repository: ["3. 데이터 파싱" (snake_case)]
     - [controller] => (__ReqDto__) Dart to Json 변환 
     - [Provider] => Json to Dart 변환
  2. DartEntity(파싱된 데이터를 Json to Dart 변환) (PascalCase)
  3. Provider: ["4. 서버와 송수신'  (snake_case)]
     - Repository => req Json, res json (snake_case)

