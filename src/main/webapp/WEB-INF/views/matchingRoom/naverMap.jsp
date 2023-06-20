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
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=fbgfk756mi"></script>
</head>
<body>
	<!--<div id="map" style="width:100%;height:400px;"></div>-->
	<div id="map" style="width: 400px; height: 400px;"></div>


	<style type="text/css">
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
</style>

	<script>
		//현재 위치 얻어오기
		var infowindow = new naver.maps.InfoWindow();

		function onSuccessGeolocation(position) {
			var location = new naver.maps.LatLng(position.coords.latitude,
					position.coords.longitude);
			var zoom = 14;

			map.setCenter(location); // 얻은 좌표를 지도의 중심으로 설정합니다.
			map.setZoom(zoom); // 지도의 줌 레벨을 변경합니다.

			//infowindow.setContent('<div style="padding:20px;">' + 'geolocation.getCurrentPosition() 위치' + '</div>');

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
			}
		});

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
	</script>
</body>
</html>