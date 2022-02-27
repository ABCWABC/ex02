package com.doccomsa.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.doccomsa.domain.BoardVO;
import com.doccomsa.domain.Criteria;
import com.doccomsa.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service // 중간계층인 비지니스 목적으로 사용하는 클래스들에게 사용
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {

	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;
	
	@Override
	public void register(BoardVO board) {
		log.info("register...." + board);
		mapper.insert(board);
	}

	@Override
	public List<BoardVO> getList() {
		return mapper.getList();
	}

	@Override
	public BoardVO get(Long bno) {
		return mapper.get(bno);
	}

	@Override
	public void modify(BoardVO board) {
		mapper.update(board);
	}

	@Override
	public void delete(Long bno) {
		mapper.delete(bno);
	}

	@Override
	public List<BoardVO> getListWithPaging(Criteria cri) {
		return mapper.getListWithPaging(cri);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		return mapper.getTotalCount(cri);
	}

}
