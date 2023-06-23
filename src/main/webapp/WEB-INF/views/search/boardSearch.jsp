<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>모임방 검색</title>

	<style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }

      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      } 
 
      .b-example-divider {
        height: 3rem;
        background-color: rgba(0, 0, 0, .1);
        border: solid rgba(0, 0, 0, .15);
        border-width: 1px 0;
        box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
      }

      .b-example-vr {
        flex-shrink: 0;
        width: 1.5rem;
        height: 100vh;
      }

      .bi {
        vertical-align: -.125em;
        fill: currentColor;
      }

      .nav-scroller {
        position: relative;
        z-index: 2;
        height: 2.75rem;
        overflow-y: hidden;
      }

      .nav-scroller .nav {
        display: flex;
        flex-wrap: nowrap;
        padding-bottom: 1rem; 
        margin-top: -1px;
        overflow-x: auto;
        text-align: center;
        white-space: nowrap;
        -webkit-overflow-scrolling: touch;
      }
      
      
    
.search {
  position: relative;
  width: 300px;
}

input {
  width: 100%;
  border: 1px solid #bbb;
  border-radius: 8px;
  padding: 10px 12px;
  font-size: 14px;
}

img {
  position : absolute;
  width: 17px;
  top: 10px;
  right: 12px;
   margin: auto;
   display: block;
}

/* 좋아요 */
.btn-like {
  color: transparent;
  text-shadow: 0 0 2px rgba(255,255,255,.7), 0 0 0 #000;

  
}
.btn-like:hover {
  text-shadow: 0 0 0 #ea0;
}
.btn-like.done {
  color: inherit;
  text-shadow: 0;
}
.btn-like.done:hover {
  color: transparent;
  text-shadow: 0 0 0 #777; 
}

.ac_link_logo_img {
	width: 35px;
	height: 35px;
}

.col {
margin-bottom: 15px;
}

  
    </style>

</head>
<body>

<!-- 검색바  -->
<div class="search">
  <input type="text" placeholder="검색어 입력">
  <img src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
</div>
<main>

<br>


    <div class="container">

      <div class="row row-cols-1 row-cols-sm-2 row-cols-md-3 g-3">
      
      <!-- 보드게임 모임방 목록 -->  
        <div class="col">
          <div class="card shadow-sm">
          
            <div class='my-div' onclick="openPopup()('clickRoom', 'width=200, height=250, left=0,top=0, location=no, status=no, scrollbars=yes');">
            
            <svg class="bd-placeholder-img card-img-top" width="100%" height="170" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: pla" preserveAspectRatio="xMidYMid slice" focusable="false">        
            <rect width="100%" height="100%" fill="#e6e8e6" style="cursor:pointer;"/>                        
            <!--rect 안에 이미지   href="svg_image.png"  여기에 test 이미지 넣기 -->          
          <!--    <image href="../images/search_test.png"  height="350" width="350"/>  -->          	           
            <text x="50%" y="30%" fill="#353635" dy=".3em">방이름</text>
            <text x="50%" y="45%" style="font-size:15px;" fill="#353635" dy=".3em">방설명</text>          
            </svg>
            </div>
            
            <div class="card-body">
            <!-- 글자 앞에 이미지 넣기 가 안됨!-->           
             <p class="card-text" style="font-size:12px;">장르</p>
              <p class="card-text" style="font-size:12px;">위치</p>          
           <div class="d-flex justify-content-between align-items-center" style="float: right;">           
              <div  class="btn-group">                                      
                  <!-- 좋아요 버튼 -->                 
                  <button class="btn-like">❤️</button>
               </div>
              </div>            
            </div>
            
          </div>
        </div>
        
       
        
            <div class="col">
          <div class="card shadow-sm">          
            <div class='my-div' onclick="openPopup()('clickRoom', 'width=200, height=250, left=0,top=0, location=no, status=no, scrollbars=yes');">           
            <svg class="bd-placeholder-img card-img-top" width="100%" height="170" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: pla" preserveAspectRatio="xMidYMid slice" focusable="false">        
            <rect width="100%" height="100%" fill="#e6e8e6" style="cursor:pointer;"/>                                        	           
            <text x="50%" y="30%" fill="#353635" dy=".3em">방이름</text>
            <text x="50%" y="45%" style="font-size:15px;" fill="#353635" dy=".3em">방설명</text>          
            </svg>
            </div>            
            <div class="card-body">          
             <p class="card-text" style="font-size:12px;">장르</p>
              <p class="card-text" style="font-size:12px;">위치</p>          
           <div class="d-flex justify-content-between align-items-center" style="float: right;">           
              <div  class="btn-group">                                      
                  <!-- 좋아요 버튼 -->                 
                  <button class="btn-like">❤️</button>
               </div>
              </div>            
            </div>           
          </div>
        </div>
        
       
            <div class="col">
          <div class="card shadow-sm">          
            <div class='my-div' onclick="openPopup()('clickRoom', 'width=200, height=250, left=0,top=0, location=no, status=no, scrollbars=yes');">           
            <svg class="bd-placeholder-img card-img-top" width="100%" height="170" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: pla" preserveAspectRatio="xMidYMid slice" focusable="false">        
            <rect width="100%" height="100%" fill="#e6e8e6" style="cursor:pointer;"/>                                        	           
            <text x="50%" y="30%" fill="#353635" dy=".3em">방이름</text>
            <text x="50%" y="45%" style="font-size:15px;" fill="#353635" dy=".3em">방설명</text>          
            </svg>
            </div>            
            <div class="card-body">        
             <p class="card-text" style="font-size:12px;">장르</p>
              <p class="card-text" style="font-size:12px;">위치</p>          
           <div class="d-flex justify-content-between align-items-center" style="float: right;">           
              <div  class="btn-group">                                                   
                  <button class="btn-like">❤️</button>
               </div>
              </div>            
            </div>           
          </div>
        </div>

        
             <div class="col">
          <div class="card shadow-sm">          
            <div class='my-div' onclick="openPopup()('clickRoom', 'width=200, height=250, left=0,top=0, location=no, status=no, scrollbars=yes');">           
            <svg class="bd-placeholder-img card-img-top" width="100%" height="170" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: pla" preserveAspectRatio="xMidYMid slice" focusable="false">        
            <rect width="100%" height="100%" fill="#e6e8e6" style="cursor:pointer;"/>                                        	           
            <text x="50%" y="30%" fill="#353635" dy=".3em">방이름</text>
            <text x="50%" y="45%" style="font-size:15px;" fill="#353635" dy=".3em">방설명</text>          
            </svg>
            </div>            
            <div class="card-body">        
             <p class="card-text" style="font-size:12px;">장르</p>
              <p class="card-text" style="font-size:12px;">위치</p>          
           <div class="d-flex justify-content-between align-items-center" style="float: right;">           
              <div  class="btn-group">                                                   
                  <button class="btn-like">❤️</button>
               </div>
              </div>            
            </div>           
          </div>
        </div>

        
           <div class="col">
          <div class="card shadow-sm">          
            <div class='my-div' onclick="openPopup()('clickRoom', 'width=200, height=250, left=0,top=0, location=no, status=no, scrollbars=yes');">           
            <svg class="bd-placeholder-img card-img-top" width="100%" height="170" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: pla" preserveAspectRatio="xMidYMid slice" focusable="false">        
            <rect width="100%" height="100%" fill="#e6e8e6" style="cursor:pointer;"/>                                        	           
            <text x="50%" y="30%" fill="#353635" dy=".3em">방이름</text>
            <text x="50%" y="45%" style="font-size:15px;" fill="#353635" dy=".3em">방설명</text>          
            </svg>
            </div>            
            <div class="card-body">        
             <p class="card-text" style="font-size:12px;">장르</p>
              <p class="card-text" style="font-size:12px;">위치</p>          
           <div class="d-flex justify-content-between align-items-center" style="float: right;">           
              <div  class="btn-group">                                                   
                  <button class="btn-like">❤️</button>
               </div>
              </div>            
            </div>           
          </div>
        </div>

        
         <div class="col">
          <div class="card shadow-sm">          
            <div class='my-div' onclick="openPopup()('clickRoom', 'width=200, height=250, left=0,top=0, location=no, status=no, scrollbars=yes');">           
            <svg class="bd-placeholder-img card-img-top" width="100%" height="170" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: pla" preserveAspectRatio="xMidYMid slice" focusable="false">        
            <rect width="100%" height="100%" fill="#e6e8e6" style="cursor:pointer;"/>                                        	           
            <text x="50%" y="30%" fill="#353635" dy=".3em">방이름</text>
            <text x="50%" y="45%" style="font-size:15px;" fill="#353635" dy=".3em">방설명</text>          
            </svg>
            </div>            
            <div class="card-body">        
             <p class="card-text" style="font-size:12px;">장르</p>
              <p class="card-text" style="font-size:12px;">위치</p>          
           <div class="d-flex justify-content-between align-items-center" style="float: right;">           
              <div  class="btn-group">                                                   
                  <button class="btn-like">❤️</button>
               </div>
              </div>            
            </div>           
          </div>
        </div>

        
    </div>
  </div>

</main>

<p class="float-end mb-1">
      <a href="#">맨 위로</a>
    </p>

</body>

<!-- 좋아요 버튼 -->
<script src="//code.jquery.com/jquery.min.js"></script>
<script>
$(".btn-like").click(function() {
	$(this).toggleClass("done");
})

//팝업창
 function openPopup(){
        window.open("clickRoom", "new", "toolbar=no, menubar=no, scrollbars=yes, resizable=no, width=700, height=700, left=0, top=0" );
    }

</script>


</html>
