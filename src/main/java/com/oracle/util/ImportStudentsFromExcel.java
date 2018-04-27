package com.oracle.util;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.oracle.service.CommonService;
import com.oracle.service.GuideService;
import com.oracle.service.SchoolService;
import com.oracle.service.StudentService;
import com.oracle.service.TclassService;
import com.oracle.service.TeacherService;
import com.oracle.vo.Guide;
import com.oracle.vo.School;
import com.oracle.vo.State;
import com.oracle.vo.Student;
import com.oracle.vo.Tclass;
import com.oracle.vo.Teacher;

import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.read.biff.BiffException;

public class ImportStudentsFromExcel {

	static List<Student> list = new ArrayList<Student>();
	static List<Tclass> classList=null;
	static List<School> schoolList=null;
	static List<Teacher> teacherList=null;
	static List<Guide> guideList=null;
	static Map<String,Tclass> classMap=new HashMap<String,Tclass>();
	static Map<String,School> schoolMap=new HashMap<String,School>();
	static Map<String,Teacher> teacherMap=new HashMap<String,Teacher>();
	static Map<String,Guide> guideMap=new HashMap<String,Guide>();
	static Map<String,State> stateMap=new HashMap<String,State>();
	
	static StudentService stuService=null;
	
	static ClassPathXmlApplicationContext context=null;
	
	
	
	static{
		context=new ClassPathXmlApplicationContext("applicationContext.xml");
		stuService=context.getBean(StudentService.class);
	}

	public static void main(String[] args) throws BiffException, IOException {
		
		init();
		readFile("e:/Book1.xls",15,"java1715");
		for(Student stu:list){
			stuService.importStudent(stu);
		}
		
    //    outData(); 
	}

	//输出
	private static void outData() {
		for (int i = 0; i < list.size(); i++) {
			
			for(Student s:list){
				System.out.println(s);
			}
		//	System.out.println();
		}
	}

	
	public static void init(){
		TclassService clazzService=context.getBean(TclassService.class);
		classList=clazzService.getAll();
		for(Tclass c:classList){
			classMap.put(c.getClassName(), c);
		}
		
		System.out.println(classList);
		
		SchoolService schoolService=context.getBean(SchoolService.class);
		schoolList=schoolService.getAll();
		for(School c:schoolList){
			schoolMap.put(c.getName(), c);
		}
		
		TeacherService teacherService=context.getBean(TeacherService.class);
		teacherList=teacherService.getAll();
		for(Teacher c:teacherList){
			teacherMap.put(c.getName(), c);
		}
		
		CommonService commonService=context.getBean(CommonService.class);
		List<State> commonList=commonService.getStatesById(0);
		for(State c:commonList){
			stateMap.put(c.getStateName(), c);
		}
		
//		
		GuideService guideService=context.getBean(GuideService.class);
		guideList=guideService.getAll();
		
		for(Guide c:guideList){
			guideMap.put(c.getName(), c);
		}
	}
	public static void readFile(String filePath,int page,String className) throws BiffException, IOException {
		
		//初始化；
		init();
		
		
		// 创建输入流
		InputStream stream = new FileInputStream(filePath);
		// 获取Excel文件对象
		Workbook rwb = Workbook.getWorkbook(stream);
		// 获取文件的指定工作表 默认的第一个
		Sheet sheet = rwb.getSheet(page);
		// 行数(表头的目录不需要，从1开始)
		for (int i = 2; i < sheet.getRows(); i++) {
			// 创建一个数组 用来存储每一列的值
		//	String[] str = new String[sheet.getColumns()];
			Cell cell = null;
			Student stu=new Student();
			// 列数
//			for (int j = 1; j < sheet.getColumns(); j++) {
//				// 获取第i行，第j列的值
//				cell = sheet.getCell(j, i);
//				str[j] = cell.getContents();
//			}
			
			stu.setName(sheet.getCell(2, i).getContents());
			stu.setSex(sheet.getCell(3, i).getContents());
			stu.setTel(sheet.getCell(4, i).getContents());
			stu.setIdcard(sheet.getCell(5, i).getContents());
			stu.setTclass(classMap.get(className));
			stu.setClassGuide(guideMap.get(sheet.getCell(6, i).getContents()));
		//	stu.setJobGuide(guideMap.get(sheet.getCell(6, i).getContents()));
			stu.setGrade(sheet.getCell(8, i).getContents());
			stu.setDegree(stateMap.get(sheet.getCell(9, i).getContents()));
			
			stu.setMajor(sheet.getCell(10, i).getContents());
			stu.setSchool(schoolMap.get(sheet.getCell(11, i).getContents()));
			
			stu.setFtel(sheet.getCell(12, i).getContents());
			stu.setMtel(sheet.getCell(13, i).getContents());
			stu.setAddress(sheet.getCell(14, i).getContents());
			stu.setIntendCity(sheet.getCell(16, i).getContents());
			stu.setJob(sheet.getCell(17, i).getContents());
			stu.setCompany(sheet.getCell(19, i).getContents());
			stu.setSalary(sheet.getCell(20, i).getContents());
			stu.setWorkcity(sheet.getCell(22, i).getContents());
			stu.setRecommendType(stateMap.get(sheet.getCell(21, i).getContents()));
			stu.setJobGuide(guideMap.get(sheet.getCell(24, i).getContents()));
			stu.setTeacher(teacherMap.get(sheet.getCell(23, i).getContents()));
			stu.setComment(sheet.getCell(25, i).getContents());
			// 把刚获取的列存入list
			list.add(stu);
		}
	}

}
