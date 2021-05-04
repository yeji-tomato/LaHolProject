<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>Play Ground</title>
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
      <script src="https://use.fontawesome.com/37a2d31d85.js"></script>
      <script src="//cdn.jsdelivr.net/npm/sweetalert2@10"></script>
      <link rel="stylesheet" href="${ contextPath }/resources/css/playground/game.css" />
      <link rel="stylesheet" href="${ contextPath }/resources/css/common/fonts.css" />
   </head>
   <body>
   <jsp:include page="/WEB-INF/views/common/menubar.jsp"/>
      <div class="board"></div>
      <div class="clone">
         <div class="face"></div>
         <div class="face"></div>
         <div class="face"></div>
         <div class="face"></div>
         <div class="face"></div>
         <div class="face"></div>
      </div>
      <div class="overlay hidden">
         <div class="gameover">
            <p id="result-text"></p>
            <button class="reset">
               <svg viewBox="0 0 512 512" xmlns="http://www.w3.org/2000/svg">
                  <path
                     d="m498.195312 222.695312c-.011718-.011718-.023437-.023437-.035156-.035156l-208.855468-208.847656c-8.902344-8.90625-20.738282-13.8125-33.328126-13.8125-12.589843 0-24.425781 4.902344-33.332031 13.808594l-208.746093 208.742187c-.070313.070313-.144532.144531-.210938.214844-18.28125 18.386719-18.25 48.21875.09375 66.558594 8.375 8.382812 19.4375 13.238281 31.269531 13.746093.480469.046876.96875.070313 1.457031.070313h8.320313v153.699219c0 30.414062 24.75 55.160156 55.167969 55.160156h81.710937c8.285157 0 15-6.714844 15-15v-120.5c0-13.878906 11.292969-25.167969 25.171875-25.167969h48.195313c13.878906 0 25.167969 11.289063 25.167969 25.167969v120.5c0 8.285156 6.71875 15 15 15h81.710937c30.421875 0 55.167969-24.746094 55.167969-55.160156v-153.699219h7.71875c12.585937 0 24.421875-4.902344 33.332031-13.808594 18.359375-18.371093 18.371094-48.253906.023437-66.636719zm0 0"
                     fill="#1de8f1"
                  />
                  <path
                     d="m498.195312 222.695312c-.011718-.011718-.023437-.023437-.035156-.035156l-208.855468-208.847656c-8.902344-8.90625-20.738282-13.8125-33.328126-13.8125h-.003906v351.332031h24.101563c13.878906 0 25.167969 11.289063 25.167969 25.167969v120.5c0 8.285156 6.71875 15 15 15h81.710937c30.421875 0 55.167969-24.746094 55.167969-55.160156v-153.699219h7.71875c12.585937 0 24.421875-4.902344 33.332031-13.808594 18.359375-18.371093 18.371094-48.253906.023437-66.636719zm0 0"
                     fill="#00c7ce"
                  />
               </svg>
            </button>
         </div>
      </div>
      <form>
         <input type="hidden" value="${sessionScope.loginUser.id}" id="userId">
      </form>
      
      <script>
      const board = document.querySelector('.board');
      const clone = document.querySelector('.clone');
      const overlay = document.querySelector('.overlay');
      const reset = document.querySelector('.reset');
      const tileOptions = ['erupt', 'ptero', 'tri', 'ahahah', 'egg', 'dino'];

      const state = {
        selections: [],
        boardLocked: false,
        matches: 0
      };

      reset.addEventListener('click', () => {
         location.href='${ contextPath }/nMypage/couponView';
      });

      function createBoard() {
        const tiles = shuffleArray([...tileOptions, ...tileOptions]);
        const length = tiles.length;

        for (let i = 0; i < length; i++) {
          window.setTimeout(() => {
            board.appendChild(buildTile(tiles.pop(), i));
          }, i * 100);
        }

        window.setTimeout(() => {
          document.querySelectorAll('.cube').forEach(tile => {
            tile.addEventListener('click', () => selectTile(tile));
          });

          state.boardLocked = false;
        }, tiles.length * 100);
      }

      function buildTile(option, id) {
        const tile = clone.cloneNode(true);
        tile.classList.remove('clone');
        tile.classList.add('cube');
        tile.setAttribute('data-tile', option);
        tile.setAttribute('data-id', id);
        return tile;
      }

      function selectTile(selectedTile) {
        if (state.boardLocked || selectedTile.classList.contains('flipped')) return;

        state.boardLocked = true;

        if (state.selections.length <= 1) {
          selectedTile.classList.add('flipped');
          state.selections.push({
            id: selectedTile.dataset.id,
            tile: selectedTile.dataset.tile,
            el: selectedTile
          });
        }

        
        if (state.selections.length === 2) {
          if (state.selections[0].tile === state.selections[1].tile) {
            window.setTimeout(() => {
              state.selections[0].el.classList.add('matched');
              state.selections[1].el.classList.add('matched');
              
              state.boardLocked = false;
              state.matches = state.matches + 1;
              
              // 게임 오버 시 
              if (state.matches === tileOptions.length) { // GAME OVER STARTS HERE
                window.setTimeout(() => {
                  overlay.classList.remove('hidden');
                  // document.querySelector('.audio-win').play();
                }, 600);
                console.log("게임 끝!");
              // 쿠폰 리스트
              var couponList = [["10% 할인쿠폰", "3000"], ["15% 할인쿠폰", "4000"], ["20% 할인쿠폰", "5000"], ["30% 할인쿠폰", "5000"], ["40% 할인쿠폰", "6000"], ["50% 할인쿠폰", "7000"]];
              // 랜덤으로 쿠폰 발행
              let random = Math.floor(Math.random() * couponList.length);
              var issuedCoupon = couponList[random];
              
              var couponName = issuedCoupon[0];
              var couponLimit = issuedCoupon[1];
              console.log("couponName : " + couponName);
              console.log("couponLimit : " + couponLimit);

            // 출력
            $('#result-text').html(couponName + ' 획득 🥳');
                var id = $("#userId").val();
                
                 
               $.ajax({
                  url: "${ pageContext.request.contextPath }/game/insertCoupon",
                  data: { id : id,
                        couponName: couponName,
                        couponLimit : couponLimit,
                        issuedBy : "플레이그라운드"
                  },
                  type: "get",
                  success: function(data){
                     console.log("쿠폰이 인서트 되었당");
                  },
                  error: function(e){
                     console.log(e);
                  }
               });      
              
            } // GAME OVER ENDS HERE
              
              
              state.selections = [];
              document.querySelector(`.audio-${selectedTile.dataset.tile}`).play();
            }, 600);
          } else {
            setTimeout(() => {
              document.querySelectorAll('.cube').forEach(tile => {
                tile.classList.remove('flipped');
              });
              state.boardLocked = false;
            }, 800);
            state.selections = [];
          }
        } else {
          state.boardLocked = false;
        }
      }

      function shuffleArray(array) {
        for (let i = array.length - 1; i > 0; i--) {
          const j = Math.floor(Math.random() * (i + 1));
          [array[i], array[j]] = [array[j], array[i]];
        }
        return array;
      }

      createBoard();

      </script>
   </body>
</html>
    