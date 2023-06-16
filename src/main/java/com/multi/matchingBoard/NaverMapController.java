package com.multi.matchingBoard;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.multi.model.RoomVO;

@Controller
public class NaverMapController {

    @RequestMapping(value = "/naverMap")
    public String naverMap() {
        return "matchingRoom/naverMap";
    }

}
