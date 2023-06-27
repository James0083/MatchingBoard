package com.multi.service;

import com.multi.mapper.EvalMemMapper;
import com.multi.model.MemberEvalVO;
import com.multi.model.UserVO;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import java.util.List;

@Service("evalMemService")
public class EvalMemServiceImpl implements EvalMemService {
    private final EvalMemMapper evalMemMapper;

    @Inject
    public EvalMemServiceImpl(EvalMemMapper evalMemMapper) {
        this.evalMemMapper = evalMemMapper;
    }

    @Override
    public List<UserVO> listUser() {
        return evalMemMapper.listUser();
    }

    @Override
    public int updateManners(MemberEvalVO memberEvalVO) {
        evalMemMapper.updateManners(memberEvalVO);
		return 0;
    }

	@Override
	public MemberEvalVO memEvals(UserVO userVO) {
		return null;
	}
}
