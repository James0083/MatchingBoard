package com.multi.matchingBoard;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.multi.model.MemberEvalVO;
import com.multi.model.RoomPeopleVO;
import com.multi.model.RoomVO;
import com.multi.model.UserVO;
import com.multi.service.EvalMemService;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/eval")
@Log4j
public class EvalMemController {
    private final EvalMemService evalMemService;

    @Inject
    public EvalMemController(EvalMemService evalMemService) {
        this.evalMemService = evalMemService;
    }

    @GetMapping(value="/memberEval")
    public String showMemEvalForm(Model m) {
        Map<String, String> qMap = new HashMap<>();
        qMap.put("질문1", "해당 모임원이 시간약속은 잘 지켰나요");
        qMap.put("질문2", "해당 모임원의 게임플레이 매너는 어떠했나요");
        qMap.put("질문3", "해당 모임원의 모임참여 매너는 어떠했나요");
        m.addAttribute("question", qMap);
        
        List<UserVO> userList = evalMemService.listUser();
        m.addAttribute("userList", userList);
        
        return "eval/memberEval";
    }

    @PostMapping("/memberEval")
    public String submitMemEvalForm(Model model, @ModelAttribute UserVO userVO,
    		@RequestParam Map<String, String> ranges) {
        List<UserVO> userList = evalMemService.listUser();
        
        for (UserVO user : userList) {
            MemberEvalVO memberEval = new MemberEvalVO();
            memberEval.setUserid(user.getUserid());
            
            String evalValue = ranges.get(user.getUserid());
            if (evalValue != null) {
                Float eval = Float.parseFloat(evalValue);
                memberEval.setEval(eval);
                float insertManners = evalMemService.insertManners(memberEval);
                evalMemService.updateUserManner(user.getUserid());
            }
        }

        String msg = "모임방 참여 인원 평가";
        RoomPeopleVO rPeople = new RoomPeopleVO();
        RoomVO roomVO = new RoomVO();
        rPeople.setRoomid(roomVO.getRoomid());
        rPeople.setUserid(userVO.getUserid());
        MemberEvalVO eval = evalMemService.memManners(userVO);
        
        System.out.println("맴버 평점: " + eval.getEval());
        
        if (eval != null) {
            log.info("맴버 평점: " + eval.getEval());
            userVO.setManner(eval.getEval());
            evalMemService.updateUserManner(userVO.getUserid());
            msg += " 성공";
        } else {
            msg += " 실패";
        }
        
        String loc = (eval != null) ? "/matchingBoard/eval/cafeEval" : "javascript:history.back()";
        
        log.info("평가 결과: " + msg);
        
        model.addAttribute("msg", msg);
        model.addAttribute("loc", loc);
        model.addAttribute("averageRating", eval.getEval());

        return "message";
    }
}
