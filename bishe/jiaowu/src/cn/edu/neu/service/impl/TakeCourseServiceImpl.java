package cn.edu.neu.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.edu.neu.core.common.Page;
import cn.edu.neu.mapper.TakeCourseMapper;
import cn.edu.neu.model.Course;
import cn.edu.neu.model.SuccessTakeCourse;
import cn.edu.neu.model.TakeCourse;
import cn.edu.neu.service.TakeCourseService;


@Service
@Transactional
public class TakeCourseServiceImpl implements TakeCourseService {

	@Autowired
	private TakeCourseMapper mapper;
	



	
	
	public Page<TakeCourse> getTakeCourse(String sort) {
		Page<TakeCourse> page = new Page<TakeCourse>(8);
		Map<String, Object> m = new HashMap<String, Object>();
		
		m.put("sort", sort);
		page.setParams(m);
		List<TakeCourse> takecourseList = mapper.findAllTakeCourse(page);
		page.setList(takecourseList);
		return page;
	}

	@Override
	public Page<TakeCourse> getsearchTakeCourse(String keyword, String sort) {
		Page<TakeCourse> page = new Page<TakeCourse>(8);
		String[] array = keyword.split(" ");

		Map<String, Object> m = new HashMap<String, Object>();
		m.put("keywords", array);
		m.put("sort", sort);
		page.setParams(m);
		List<TakeCourse> takecourseList = mapper.findTakeCourseByKeyword(page);
		page.setList(takecourseList);
		return page;
	}

	@Override
	public TakeCourse getTakeCourseWhereById(String takecourseId) {
		TakeCourse takecourseWhere = mapper.findTakeCourseWhereById(takecourseId);
		return takecourseWhere;
	}

	@Override
	public TakeCourse getTakeCourseTeacherById(String takecourseId) {
		TakeCourse takecourseTeacher = mapper.findTakeCourseTeacherById(takecourseId);
		return takecourseTeacher;
	}

	@Override
	public TakeCourse getTakeCourseDetailById(String takecourseId) {
		TakeCourse takecourseDetail = mapper.findTakeCourseDetailById(takecourseId);
		return takecourseDetail;
	}


	/*Override
	public int addTakeCourse(TakeCourse takecourse, List<SuccessTakeCourse> successTakeCourse) {
		
		int takecourseId = takecourse.getTakecourseId();

		for (int j = 0; j < successTakeCourse.size(); j++) {
			SuccessTakeCourse stc = successTakeCourse.get(j);
			stc.setTakeCourseId(takecourseId);
			mapper.saveSuccessTakeCourse(stc);
		}
		return takecourseId;
	}*/
	
	@Override
	public void addTakeCourse(TakeCourse takecourse) {
		mapper.saveTakeCourse(takecourse);

	}
	@Override
	public TakeCourse getTakeCourseById(String takecourseId) {
		// TODO Auto-generated method stub
		return mapper.findTakeCourseById(takecourseId);
	}
	@Override
	public void updateTakeCourse(TakeCourse takecourse) {
		// TODO Auto-generated method stub
		mapper.updateTakeCourse(takecourse);
	}

	@Override
	public void deleteTakeCourse(String takecourseId) {
		mapper.removeTakeCourse(takecourseId);
		mapper.delTakeCourseTeacher(takecourseId);

	}
	
	@Override
	public Page<TakeCourse> getAdminSearchTakeCourse(String takecourseName) {
		String[] takecourseNames = null;
		if (takecourseName != null)
			takecourseNames = takecourseName.split("");
		Page<TakeCourse> page = new Page<TakeCourse>(8);
		Map<String, Object> m = new HashMap<String, Object>();
		m.put("takecourseNames", takecourseNames);
		page.setParams(m);
		List<TakeCourse> takecourseList = mapper.findTakeCourseBySearchKeyword(page);
		page.setList(takecourseList);
		return page;

	}
	//批量删除
		@Override
		public void delTakeCourseByIds(String[] takecourseIds) {
			// TODO Auto-generated method stub
			for(int i=0;i<takecourseIds.length;i++){
				mapper.removeTakeCourse(takecourseIds[i]);
			
			}
		}
		
		@Override
		public void updateTakeCourseTeacherById(String takecourseId, List<String> insertIds,List<String> delIds) {
			// TODO Auto-generated method stub
			for(int i=0;i<delIds.size();i++){
				mapper.delTakeCourseTeacher(takecourseId,delIds.get(i));
			}
			for(int i=0;i<insertIds.size();i++){
				mapper.saveTakeCourseTeacher(takecourseId,insertIds.get(i));
			}
		}
		@Override
		public String[] getTakeCourseTeacherIds(String takecourseId) {
			// TODO Auto-generated method stub
			return mapper.findTakeCourseTeacherIds(takecourseId);
		}





	

	
}
