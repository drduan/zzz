package cn.edu.neu.test;

import java.io.FileInputStream;
import java.io.IOException;

import org.apache.poi.EncryptedDocumentException;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.openxml4j.exceptions.InvalidFormatException;


public class SpringTest {
	//支持97-2003
	  public static final String SAMPLE_XLSX_FILE_PATH = "C:\\Users\\DaShang\\Desktop\\1w.xls";
	public static void main(String[] args) throws EncryptedDocumentException, InvalidFormatException, IOException {
//	/	ApplicationContext ctx = new ClassPathXmlApplicationContext("config/spring-common.xml");
//		Object userMapper = ctx.getBean("userMapper");
//		System.out.println(userMapper);
	
//		HSSFWorkbook workbook = WorkbookFactory.create(new File(SAMPLE_XLSX_FILE_PATH));
		HSSFWorkbook workbook =readFile(SAMPLE_XLSX_FILE_PATH);
		
		   System.out.println("Workbook has " + workbook.getNumberOfSheets() + " Sheets : ");
	
	}
	
	private static HSSFWorkbook readFile(String filename) throws IOException {
		try (FileInputStream fis = new FileInputStream(filename)) {
			return new HSSFWorkbook(fis);        // NOSONAR - should not be closed here
		}
	}
}
