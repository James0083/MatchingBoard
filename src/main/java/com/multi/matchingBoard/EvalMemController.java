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

import com.multi.model.EvaluationVO;
import com.multi.model.MemberEvalVO;
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
        return "eval/memberEval";
    }

    @PostMapping("/memberEval")
    public String submitMemEvalForm(Model model, @RequestParam Map<String, String> ratings, 
    		@ModelAttribute MemberEvalVO MemberEvalVO) {
        List<UserVO> userList = evalMemService.listUser();

        for (UserVO user : userList) {
            MemberEvalVO memberEval = calculateAverageRatings(ratings);
            memberEval.setUserid(user.getUserid());
            evalMemService.updateManners(memberEval);
        }
        
        int n = evalMemService.updateManners(MemberEvalVO);
        String msg = "모임방 참여 인원 평가";
        //EvaluationVO eval=evalMemService.memEval(userVO);
        //System.out.println("맴버 평점: "+eval.getEval());
        String loc = (n > 0) ? "/matchingBoard/room/roomView" : "javascript:history.back()";
        
        msg += (n > 0) ? "성공" : "실패";
        log.info("평가 결과: " + msg);
        
        model.addAttribute("msg", msg);
        model.addAttribute("loc", loc);

        return "message";
    }

    private MemberEvalVO calculateAverageRatings(Map<String, String> ratings) {
        MemberEvalVO memberEval = new MemberEvalVO();
        memberEval.setRoomid("room_id_value"); // Set the actual room ID

        float sumRatings = 0;
        for (String rating : ratings.values()) {
            sumRatings += Float.parseFloat(rating);
        }
        float avgRating = sumRatings / ratings.size();
        memberEval.setEval(avgRating);

        return memberEval;
    }
}
