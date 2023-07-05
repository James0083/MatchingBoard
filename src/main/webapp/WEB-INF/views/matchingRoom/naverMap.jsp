<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="myctx" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<title>간단한 지도 표시하기</title>
<script type="text/javascript"
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=fbgfk756mi&submodules=geocoder"></script>
<style type="text/css">
#foot-container {
	display: none;
}

.navbar {
		display:none;
	}

#wrap .buttons {
	position: absolute;
	top: 0;
	left: 0;
	z-index: 1000;
	padding: 5px;
}

#wrap .buttons .control-btn {
	margin: 0 5px 5px 0;
}
#search-container {
		position: absolute;
		top: 0;
		left: 50%;
		transform: translateX(-50%);
		z-index: 1000;
	}

	#search-container input[type="text"] {
		width: 250px;
	}

	#search-container input[type="submit"] {
		padding: 5px 10px;
		background-color: #337ab7;
		color: #fff;
		border: none;
		cursor: pointer;
	}
</style>	
</head>
<body>
	<!--<div id="map" style="width:100%;height:400px;"></div>-->
	<div id="map" style="position: absolute; top: 40px; left: 0; right: 0; bottom: 0;""></div>
	
	<div id="search-container">
		<input type="text" id="address" placeholder="지역을 검색하세요.">
		<input type="submit" id="submit" value="검색">
	</div>

	<script>
		//현재 위치 얻어오기
		var infowindow = new naver.maps.InfoWindow();
		//지도 생성 시에 옵션을 지정할 수 있습니다.
		var map = new naver.maps.Map('map', {
			//center : location, //지도의 초기 중심 좌표
			//zoom : 14, //지도의 초기 줌 레벨
			minZoom : 7, //지도의 최소 줌 레벨
			zoomControl : true, //줌 컨트롤의 표시 여부
			zoomControlOptions: {//줌 컨트롤러의 옵션
	            style: naver.maps.ZoomControlStyle.SMALL,
	            position: naver.maps.Position.TOP_RIGHT
	        }
		});
		console.log("지도 초기화 완료");

		function onSuccessGeolocation(position) {
			var location = new naver.maps.LatLng(position.coords.latitude,
					position.coords.longitude);
			var zoom = 16;

			map.setCenter(location); // 얻은 좌표를 지도의 중심으로 설정합니다.
			map.setZoom(zoom); // 지도의 줌 레벨을 변경합니다.

			//infowindow.setContent('<div style="padding:3px;">' + '현재위치' + '</div>');

			//infowindow.open(map, location);//현 위치 설명 말풍선
			//console.log('Coordinates: ' + location.toString());
		}

		function onErrorGeolocation() {
			var center = map.getCenter();

			infowindow.setContent('<div style="padding:20px;">'
							+ '<h5 style="margin-bottom:5px;color:#f00;">Geolocation failed!</h5>'
							+ "latitude: " + center.lat() + "<br />longitude: "
							+ center.lng() + '</div>');

			infowindow.open(map, center);
		}
		
		$(window).on("load",function() {
			if (navigator.geolocation) {
				/**
				 * navigator.geolocation 은 Chrome 50 버젼 이후로 HTTP 환경에서 사용이 Deprecate 되어 HTTPS 환경에서만 사용 가능 합니다.
				 * http://localhost 에서는 사용이 가능하며, 테스트 목적으로, Chrome 의 바로가기를 만들어서 아래와 같이 설정하면 접속은 가능합니다.
				 * chrome.exe --unsafely-treat-insecure-origin-as-secure="http://example.com"
				 */
				navigator.geolocation.getCurrentPosition(
						onSuccessGeolocation,
						onErrorGeolocation);
			} else {
				var center = map.getCenter();
				infowindow
						.setContent('<div style="padding:20px;"><h5 style="margin-bottom:5px;color:#f00;">Geolocation not supported</h5></div>');
				infowindow.open(map, center);
				map.add(markers);
			}
		});


		// 매장 정보 배열 (DB에서 받아오는걸로 바꾸기)
		var stores = [
		  {name: '보드게임카페 레드버튼 안양점',lat: 37.3997964,lng: 126.9224698},
		  {name: '히어로 보드게임카페 안양점',lat: 37.3986629,lng: 126.9226668},
		  {name: '데블다이스 보드게임카페 안양점',lat: 37.3991845,lng: 126.9215638},
		  {name: '홀스 안양점',lat:37.3999339,lng:126.9217337},
		  {name: '보드게임카페 레드버튼 범계점',lat: 37.3908957,lng: 126.9527948},
		  {name: '더홀릭 보드게임카페 범계점',lat: 37.3908343,lng: 126.9529876},
		  {name: '데블다이스 보드게임카페 범계점',lat: 37.3911951,lng: 126.9540442},
		  {name: '보드게임카페 홈즈앤루팡 범계점',lat: 37.3908898,lng: 126.953145},
		  {name: '히든룸 보드 카페',lat: 37.4001723,lng: 126.9749499},
		  {name: '홀릭 보드 카페',lat: 37.3939953,lng: 126.9609734},
		  {name: '제임스 보드 게임',lat: 37.3935374,lng: 126.9621882},
		  {name: '천 보드 카페',lat: 37.3941357,lng: 126.9625978},
		  {name: '보드게임카페 홈즈앤루팡 산본점',lat: 37.3598064,lng: 126.9313381},
		  {name: '히어로 보드게임카페 산본점',lat: 37.3593368,lng: 126.9312206},
		  {name: '보드게임카페 레드버튼 산본점',lat: 37.3603236,lng: 126.9317372},
		  {name: '더홀릭 보드게임카페 수원점',lat: 37.2682127,lng: 127.0027613},
		  {name: '히어로 보드게임카페 수원점',lat: 37.2688104,lng: 127.0041966},
		  {name: '보드게임카페 레드버튼 수원점',lat: 37.2678476,lng: 127.0011425},
		  {name: '보드게임카페 홈즈앤루팡 수원역점',lat: 37.2684825,lng: 127.0037724},
		  {name: '보드게임카페 레드버튼 수원인계점',lat: 37.2643685,lng: 127.0314371},
		  {name: '보드게임카페 레드버튼 아주대점',lat: 37.2782312,lng: 127.0441373},
		  {name: '프리스콜레',lat: 37.2928237,lng: 127.0502239},
		  {name: '제이드플레이스',lat: 37.3284311,lng: 127.0679434},
		  {name: '보드게임카페 레드버튼 강남점',lat: 37.5019586,lng: 127.0264693},
		  {name: '데블다이스 보드게임카페 강남시티점',lat: 37.5011537,lng: 127.0272036},
		  {name: '펀타임 강남점',lat: 37.4994905,lng: 127.0276549},
		  {name: '보드게임카페 홈즈앤루팡 강남점',lat: 37.5015135,lng: 127.0271198},
		  {name: '달무티 교대점',lat: 37.4940656,lng: 127.0177735},
		  {name: '곰곰이 보드게임',lat: 37.4818115,lng: 126.9836628},
		  {name: '게임 아카이브',lat: 37.4823864,lng: 126.9929379},
		  {name: '보드게임카페 레드버튼 이수역점',lat: 37.4872971,lng: 126.9813609},
		  {name: '보드 게임 하자',lat: 37.5120497,lng: 126.9454622},
		  {name: '미르 보드카페',lat: 37.5073374,lng: 126.958694},
		  {name: '이수 보드게임카페',lat: 37.4869152,lng: 126.9809591},
		  {name: '보드게임카페 레드버튼 신림점',lat: 37.4832269,lng: 126.9296075},
		  {name: '플레이온 보드게임카페',lat: 37.4837672,lng: 126.9275759},
		  {name: '킹덤 보드게임카페 신림점',lat: 37.4832581,lng: 126.9290644}
		];
		var markers = [];

		stores.forEach(function(store) {
			  var marker = new naver.maps.Marker({
			    position: new naver.maps.LatLng(store.lat, store.lng),
			    map: map
			  });
			  naver.maps.Event.addListener(marker, 'click', function() {
				  	var content = '<div style="padding:10px;">' +
				  		'<h4>' + store.name + '</h4>' +
				  		'<button onclick="selectStore()">선택하기</button>' +
				  		'</div>';
				  	infowindow.setContent(content);
				  	infowindow.open(map, marker);
				  });
			markers.push(marker);
		});
		
		function selectStore() {
			   alert("매장이 선택되었습니다.");
			   var selectedStoreName = event.target.parentNode.querySelector('h4').innerText;
			   opener.document.getElementById("rplace").value = selectedStoreName;
			   window.close(); // 팝업 창을 닫습니다.
			}
		
		//지도 컨트롤
		$("#controls").on("click", function(e) {
			e.preventDefault();

			if (map.getOptions("scaleControl")) {
				map.setOptions({ //모든 지도 컨트롤 숨기기
					scaleControl : false,
					logoControl : false,
					mapDataControl : false,
					zoomControl : false,
					mapTypeControl : false
				});
				$(this).removeClass('control-on');
			} else {
				map.setOptions({ //모든 지도 컨트롤 보이기
					scaleControl : false,
					logoControl : false,
					mapDataControl : false,
					zoomControl : true,
					mapTypeControl : false
				});
				$(this).addClass('control-on');
			}
		});

//		var locationBtnHtml = '<a href="#" class="btn_mylct"><span class="spr_trff spr_ico_mylct">To Current Location</span></a>';
		var locationBtnHtml = '<button style="padding:2px;"><img src="${myctx}/images/curLocation.png" style="width:30px; height:30px;"></button>';
		
		naver.maps.Event.once(map, 'init', function() {
			//customControl 객체 이용하기
			var customControl = new naver.maps.CustomControl(locationBtnHtml, {
				position : naver.maps.Position.TOP_LEFT
			});

			customControl.setMap(map);

			naver.maps.Event.addDOMListener(customControl.getElement(),'click', function() {
				if (navigator.geolocation) {
			        navigator.geolocation.getCurrentPosition(function(position) {
			            var location = new naver.maps.LatLng(position.coords.latitude, position.coords.longitude);
			            map.setCenter(location); // 얻은 좌표를 지도의 중심으로 설정합니다.
			        }, function() {
			            alert("현재 위치 정보를 받아오는데 실패했습니다.");
			        });
			    } else {
			        alert("이 브라우저에서는 Geolocation이 지원되지 않습니다.");
			    }
			});
		});
		
		function searchAddressToCoordinate(address) {
		    naver.maps.Service.geocode({
		        query: address
		    }, function(status, response) {
		        if (status === naver.maps.Service.Status.ERROR) {
		            return alert('Something Wrong!');
		        }
		        if (response.v2.meta.totalCount === 0) {
		            return alert('올바른 주소를 입력해주세요.');
		        }
		        var htmlAddresses = [],
		            item = response.v2.addresses[0],
		            point = new naver.maps.Point(item.x, item.y);
		        if (item.roadAddress) {
		            htmlAddresses.push('[도로명 주소] ' + item.roadAddress);
		        }
		        if (item.jibunAddress) {
		            htmlAddresses.push('[지번 주소] ' + item.jibunAddress);
		        }
		        if (item.englishAddress) {
		            htmlAddresses.push('[영문명 주소] ' + item.englishAddress);
		        }
		        map.setCenter(point);
		        insertAddress(item.roadAddress, item.x, item.y);
		    });
		}

		// 주소 검색 이벤트 처리
		$('#address').on('keydown', function(e) {
		    var keyCode = e.which;
		    if (keyCode === 13) { // Enter Key
		        searchAddressToCoordinate($('#address').val());
		    }
		});
		$('#submit').on('click', function(e) {
		    e.preventDefault();
		    searchAddressToCoordinate($('#address').val());
		});
	</script>
</body>
</html>