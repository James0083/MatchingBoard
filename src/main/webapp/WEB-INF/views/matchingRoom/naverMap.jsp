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
	src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=fbgfk756mi&g&submodules=geocoder"></script>

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
</head>
<body>

	<div id="search">
		<input type="text" id="address" placeholder="장소를 검색하세요"> <input
			type="button" id="submit" value="주소검색">
	</div>
	<!--<div id="map" style="width:100%;height:400px;"></div>-->
	<div id="map" style="width: 400px; height: 400px;"></div>

<script>
    // 현재 위치 얻어오기
    var infowindow = new naver.maps.InfoWindow();
    var map;

    function onSuccessGeolocation(position) {
        var location = new naver.maps.LatLng(position.coords.latitude, position.coords.longitude);
        var zoom = 14;

        map.setCenter(location); // 얻은 좌표를 지도의 중심으로 설정합니다.
        map.setZoom(zoom); // 지도의 줌 레벨을 변경합니다.
    }

    function onErrorGeolocation() {
        var center = map.getCenter();

        infowindow.setContent('<div style="padding:20px;">' +
            '<h5 style="margin-bottom:5px;color:#f00;">Geolocation failed!</h5>' +
            "latitude: " + center.lat() + "<br />longitude: " +
            center.lng() + '</div>');

        infowindow.open(map, center);
    }

    $(window).on("load", function () {
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(
                onSuccessGeolocation,
                onErrorGeolocation
            );
        } else {
            var center = map.getCenter();
            infowindow.setContent('<div style="padding:20px;"><h5 style="margin-bottom:5px;color:#f00;">Geolocation not supported</h5></div>');
            infowindow.open(map, center);
            infowindow.open(map, marker);
        }
    });

    function initializeMap() {
        map = new naver.maps.Map('map', {
            minZoom: 7,
            zoomControl: true,
            zoomControlOptions: {
                style: naver.maps.ZoomControlStyle.SMALL,
                position: naver.maps.Position.TOP_RIGHT
            }
        });

        console.log("지도 초기화 완료");

        var tm128 = new naver.maps.Point(304793, 533627);
        var latLng = naver.maps.TransCoord.fromTM128ToLatLng(tm128);

        console.log("마커 위치: " + latLng.toString());

        var markerOptions = {
            position: latLng,
            map: map,
        };
        var marker = new naver.maps.Marker(markerOptions);

        console.log("마커 생성 완료");

        var locationBtnHtml = '<button style="padding:2px;"><img src="${myctx}/images/curLocation.png" style="width:30px; height:30px;"></button>';

        naver.maps.Event.once(map, 'init', function () {
            var customControl = new naver.maps.CustomControl(locationBtnHtml, {
                position: naver.maps.Position.TOP_LEFT
            });

            customControl.setMap(map);

            naver.maps.Event.addDOMListener(customControl.getElement(), 'click', function () {
                if (navigator.geolocation) {
                    navigator.geolocation.getCurrentPosition(function (position) {
                        var location = new naver.maps.LatLng(position.coords.latitude, position.coords.longitude);
                        map.setCenter(location);
                    }, function () {
                        alert("현재 위치 정보를 받아오는데 실패했습니다.");
                    });
                } else {
                    alert("이 브라우저에서는 Geolocation이 지원되지 않습니다.");
                }
            });
        });
    }

    // 페이지 로드 시 initializeMap() 함수 호출하여 마커 추가
    initializeMap();

</script>
</body>
</html>