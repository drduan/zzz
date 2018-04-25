package cn.edu.neu.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.edu.neu.mapper.LevMessageMapper;
import cn.edu.neu.model.LevMessage;
import cn.edu.neu.service.LevMessageService;

@Service
@Transactional // 此处不再进行创建SqlSession和提交事务，都已交由spring去管理了。
public class LevMessageServiceImpl implements LevMessageService {
	
	@Resource
	private LevMessageMapper levMessageMapper;
	
	@Override
	public boolean addLevMessage(LevMessage levMessage) {
		try {
			if (levMessageMapper.addLevMessage(levMessage)>0) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
		
	}

	@Override
	public List<Map<String, LevMessage>> queryLevMessage() {
		try {
			return levMessageMapper.queryLevMessage();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}

	@Override
	public boolean deleteLevMessage(LevMessage levMessage) {
		try {
			if (levMessageMapper.deletelevMessage(levMessage)>0) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean readLevMessage(LevMessage levMessage) {
		try {
			if (levMessageMapper.readLevMessage(levMessage)>0) {
				return true;
			} else {
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

}
