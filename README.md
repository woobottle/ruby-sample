## 테스트하기 

```sh
$ bundle
$ rails s
```

서버가 실행 된 후, `localhost:3000`으로 접속해서 테스트할 수 있습니다.


css
tailwind 사용

가상계좌 이용시 콜백을 개발환경에서 받기 위해서는 
1. ngrok을 실행
2. 토스페이먼츠 홈페이지에서 콜백 url을 ngrok의 포워딩 주소로 기입
3. 토스페이먼츠 홈페이지 거래내역에서 액션 > 입금처리를 클릭하면 테스트 콜백을 개발환경에서 확인할수 있습니다.