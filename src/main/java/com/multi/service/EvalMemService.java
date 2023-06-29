package com.multi.service;

import com.multi.model.MemberEvalVO;
import com.multi.model.UserVO;

import java.util.List;

public interface EvalMemService {
    List<UserVO> listUser();
    int updateManners(MemberEvalVO memberEvalVO);
    MemberEvalVO memEvals(UserVO userVO);
}
