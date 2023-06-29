package com.multi.mapper;

import com.multi.model.MemberEvalVO;
import com.multi.model.UserVO;

import java.util.List;

public interface EvalMemMapper {
    List<UserVO> listUser();
    int updateManners(MemberEvalVO memberEval);
    MemberEvalVO memEvals(UserVO userVO);
}
