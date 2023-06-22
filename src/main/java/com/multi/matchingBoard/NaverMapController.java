package com.multi.matchingBoard;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/room")
public class NaverMapController {

    @GetMapping(value = "/naverMap")
    public String naverMap() {
        return "matchingRoom/naverMap";
    }

}
