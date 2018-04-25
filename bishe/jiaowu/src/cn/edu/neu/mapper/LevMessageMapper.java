package cn.edu.neu.mapper;

import java.util.List;
import java.util.Map;
import cn.edu.neu.model.LevMessage;

public interface LevMessageMapper {
	public int addLevMessage(LevMessage levMessage);
	public List<Map<String,LevMessage>> queryLevMessage();
	public int deletelevMessage(LevMessage levMessage);
	public int readLevMessage(LevMessage levMessage);
}
