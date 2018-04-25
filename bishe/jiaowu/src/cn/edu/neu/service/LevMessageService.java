package cn.edu.neu.service;

import java.util.List;
import java.util.Map;

import cn.edu.neu.model.LevMessage;

public interface LevMessageService {
	public boolean addLevMessage(LevMessage levMessage);
	public List<Map<String,LevMessage>> queryLevMessage();
	public boolean deleteLevMessage(LevMessage levMessage);
	public boolean readLevMessage(LevMessage levMessage);
}
