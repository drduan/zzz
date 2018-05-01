package cn.edu.neu.core.util;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.hssf.usermodel.HSSFDateUtil;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 * excel读取数据
 * 
 * @author
 * 
 */

public class ReadExceTool {
	private POIFSFileSystem fs;
	private Workbook wb;
	private Sheet sheet;
	private Row row;

	/**
	 * 读取Excel表格表头的内容
	 *
	 * @param file
	 * @return String 表头内容的数组
	 */
	public String[] readExcelTitle(InputStream is, String extension) {
		try {
			System.out.println(extension);
			if (extension.endsWith(".xls")) {
				fs = new POIFSFileSystem(is);
				wb = new HSSFWorkbook(fs);
			} else {
				wb = new XSSFWorkbook(is);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		sheet = wb.getSheetAt(0);
		row = sheet.getRow(0);
		// 标题总列数
		int colNum = row.getPhysicalNumberOfCells();
		System.out.println("colNum:" + colNum);
		String[] title = new String[colNum];
		for (int i = 0; i < colNum; i++) {
			// title[i] = getStringCellValue(row.getCell((short) i));
			title[i] = getCellFormatValue(row.getCell((short) i));
			System.out.println(getCellFormatValue(row.getCell((short) i)));
		}
		return title;
	}

	/**
	 * 读取Excel数据内容
	 *
	 * @param file
	 * @return Map 包含单元格数据内容的Map对象
	 */
	public Map<Integer, String> readExcelContent(InputStream is, String extension) {
		Map<Integer, String> content = new HashMap<Integer, String>();
		String str = "";
		try {

			if (extension.toLowerCase().endsWith(".xls")) {
				// fs = new POIFSFileSystem(is);
				wb = new HSSFWorkbook(is);
			} else {
				wb = new XSSFWorkbook(is);
			}

		} catch (IOException e) {
			e.printStackTrace();
		}
		sheet = wb.getSheetAt(0);
		// 得到总行数
		int rowNum = sheet.getLastRowNum();
		row = sheet.getRow(0);
		int colNum = row.getPhysicalNumberOfCells();
		// 正文内容应该从第二行开始,第一行为表头的标题
		for (int i = 1; i <= rowNum; i++) {
			row = sheet.getRow(i);
			int j = 0;
			while (j < colNum) {
				// 每个单元格的数据内容用"-"分割开，以后需要时用String类的replace()方法还原数据
				// 也可以将每个单元格的数据设置到一个javabean的属性中，此时需要新建一个javabean
				// str += getStringCellValue(row.getCell((short) j)).trim() +
				// "-";
				str += getCellFormatValue(row.getCell((short) j)).trim() + "    ";
				j++;
			}
			content.put(i, str);
			str = "";
		}
		return content;
	}

	/**
	 * 导出Excel文件的信息 形式为：List<List<Object>> 支持格式为 ： xlsx，xls 第一层list为文件sheet信息
	 * 第二层list为一个sheet页面的信息 第三层为sheet内容某一行的信息 文件信息由上自下由左自右查找 分数数据暂时只能读取成小数保存
	 * 
	 * @param File
	 *            输入文件
	 * @param String
	 *            文件后缀
	 * @return List<List<Object>> （最内层object为一个List<Object>数组）
	 */
	public List<List<Object>> readExcel(InputStream stream, String extension) {
		List<List<Object>> fileObject = new java.util.ArrayList<List<Object>>();
		Workbook wb = null;
		// 读取文件格式判断，如果是excel文件则返回Workbook实例
		wb = readFile(stream, extension);
		if (wb != null) {
			// 循环sheet页面，添加第一层list
			for (int numSheet = 0; numSheet < wb.getNumberOfSheets(); numSheet++) {
				Sheet sheet = wb.getSheetAt(numSheet);
				/**
				 * column: sheet页面最大列数; 根据 sheet页最大行，最大列对页面进行循环处理
				 */
				List<Object> sheetObjects = new ArrayList<Object>();
				// 获取数据最小列数
				int startColumn = getFirstColNum(sheet, sheet.getLastRowNum());
				// 获取数据最大列数
				int endColumn = getLastColNum(sheet, sheet.getLastRowNum());
				// 根据最大行数进行循环，将行数据数据放入第二层list
				for (int i = 0; i <= sheet.getLastRowNum(); i++) {
					Row row = sheet.getRow(i);
					List<Object> rowValues = new ArrayList<Object>();
					// 空行忽略
					if (row == null) {
						continue;
					} else {
						// 每行内根据最大列数循环，将单元数据数据放入第三层list
						for (Cell cell : row) {

							// 空单元忽略
							String cellValue = null;
							if (cell == null)
								continue;
							// 判断是否为合并单元格
							if (isMergedRegion(sheet, cell.getRowIndex(), cell.getColumnIndex())) {
								// 合并单元格取值（所有单元格取第一个单元格的值，跨列合并单元格 只取第一个数据）
								cellValue = getMergedValue(sheet, cell.getRowIndex(), cell.getColumnIndex());
							} else {
								// 单元格取值
								cellValue = getValue(cell);
							}
							// 如果是跨列合并单元格 只取第一个数据
							if (cellValue != null && cellValue.equals("ignoredData"))
								continue;
							else
								rowValues.add(cellValue);
						}
						sheetObjects.add(rowValues);
					}
				}
				fileObject.add(sheetObjects);
			}
			/*
			 * //遍历解析出来的list (数据验证) for (List<Object> sheetObjects : fileObject) { for
			 * (Object rowObjects : sheetObjects) { List<Object> cellValues = (List<Object>)
			 * rowObjects; for (int i = 0; i < cellValues.size(); i++) {
			 * System.out.print(cellValues.get(i) + ","); } System.out.println(); }
			 * System.out.println(); }
			 */
		}
		return fileObject;
	}

	private static int getFirstColNum(Sheet sheet, int lastRowNum) {
		if (sheet == null || lastRowNum == 0) {
			return 0;
		}
		// 初始值设置为一个较大的值
		int firstCol = 100;
		Row row = null;
		// 根据行循环，取第一个非空值的最小下标
		for (int i = 0; i <= lastRowNum; i++) {
			row = sheet.getRow(i);
			if (row != null) {
				for (int j = 0; j < row.getLastCellNum(); j++) {
					if (row.getCell(j) != null) {
						if (firstCol > j) {
							firstCol = j;
							break;
						}
					}
				}
			}
		}
		return firstCol;
	}

	/**
	 * 求Excel某一工作簿0~某行内的最大列数
	 * 
	 * @param sheet
	 *            工作簿
	 * @param rowNum
	 *            行数
	 * @return
	 */
	private static int getLastColNum(Sheet sheet, int rowNum) {
		if (sheet == null || rowNum == 0) {
			return 0;
		}
		int lastCol = 0;
		Row row = null;
		for (int i = 0; i <= rowNum; i++) {
			row = sheet.getRow(i);
			if (row != null) {
				int temp = row.getLastCellNum();
				if (temp > lastCol) {
					lastCol = temp;
				}
			}
		}
		return lastCol;
	}

	/**
	 * 获取合并单元格的值
	 * 
	 * @param sheet
	 *            工作簿
	 * @param rowNum
	 *            单元行
	 * @param columnIndex
	 *            单元列
	 * @return Object 单元值
	 */
	private static String getMergedValue(Sheet sheet, int rowNum, int columnIndex) {
		// 获取合并单元格个数
		int mergeNum = sheet.getNumMergedRegions();
		String value = null;
		// 循环判断单元格所在合并单元格，合并单元格内所有单元格赋相同的值
		for (int i = 0; i < mergeNum; i++) {
			CellRangeAddress range = sheet.getMergedRegion(i);
			// 数据依次为合并单元格的第一列、最后一列、第一行、最后一行
			int firstColumn = range.getFirstColumn();
			int lastColumn = range.getLastColumn();
			int firstRow = range.getFirstRow();
			int lastRow = range.getLastRow();
			// 判断是否在次单元格区间内
			if (rowNum >= firstRow && rowNum <= lastRow) {
				// 所有单元格取第一个单元格的值，跨列合并单元格 只取第一个数据
				if (columnIndex == firstColumn) {
					value = getValue(sheet.getRow(firstRow).getCell(firstColumn));
				} else if (columnIndex > firstColumn && columnIndex <= lastColumn) {
					value = "ignoredData";
				}
			}
		}
		return value;
	}

	/**
	 * 判断是不是合并单元格
	 * 
	 * @param sheet
	 *            Excel工作簿
	 * @param rowNum
	 *            单元格行下标
	 * @param columnIndex
	 *            单元格列下标
	 * @return
	 */
	private static boolean isMergedRegion(Sheet sheet, int rowNum, int columnIndex) {
		// 获取合并单元格个数
		int sheetMergedNum = sheet.getNumMergedRegions();
		for (int i = 0; i < sheetMergedNum; i++) {
			CellRangeAddress range = sheet.getMergedRegion(i);
			// 数据依次为合并单元格的第一列、最后一列、第一行、最后一行
			int firstColumn = range.getFirstColumn();
			int lastColumn = range.getLastColumn();
			int firstRow = range.getFirstRow();
			int lastRow = range.getLastRow();
			// 判断是否在次单元格区间内,如果是则返回true
			if (rowNum >= firstRow && rowNum <= lastRow) {
				if (columnIndex >= firstColumn && columnIndex <= lastColumn) {
					return true;
				}
			}
		}
		// 如果不在所有的合并单元格内则返回false
		return false;
	}

	/**
	 * 读取文件类型，如果是excel则返回对象实例， 如果不是则返回null
	 * 
	 * @param filePath
	 *            文件路径
	 * @return Workbook实例
	 */
	// private static Workbook readFile(File file, String extension) {
	// Workbook wb = null;
	// if(file != null){
	// try {
	// InputStream inputStream = null;
	// inputStream = new FileInputStream(file);
	// if(extension.equals("xls")){
	// wb = new HSSFWorkbook(inputStream);
	// }else if(extension.equals("xlsx")){
	// wb = new XSSFWorkbook(inputStream);
	// }else{
	// wb = null;
	// }
	// } catch (FileNotFoundException e) {
	// System.out.println("未找到文件位置！");
	// e.printStackTrace();
	// } catch (IOException e) {
	// System.out.println("文件类型不正确，请重新选择！");
	// e.printStackTrace();
	// }
	// }
	// return wb;
	// }

	private static Workbook readFile(InputStream stream, String extension) {
		Workbook wb = null;

		try {

			if (extension.equals("xls")) {
				wb = new HSSFWorkbook(stream);
			} else if (extension.equals("xlsx")) {
				wb = new XSSFWorkbook(stream);
			} else {
				wb = null;
			}
		} catch (FileNotFoundException e) {
			System.out.println("未找到文件位置！");
			e.printStackTrace();
		} catch (IOException e) {
			System.out.println("文件类型不正确，请重新选择！");
			e.printStackTrace();
		}

		return wb;
	}

	/**
	 * 获取单元格的值，并格式化 日期格式不变 其他格式转换为字符串类型
	 * 
	 * @param cell
	 *            单元格
	 * @return
	 */
	private static String getValue(Cell cell) {
		String cellValue = null;
		// 格式化数据对象
		DecimalFormat df = new DecimalFormat("0.######");
		if (cell != null) {
			// 获取单元格数据类型
			switch (cell.getCellTypeEnum()) {
			case NUMERIC:
				DateFormat formater = null;
				Date d = cell.getDateCellValue();
				if (cell.getCellStyle().getDataFormat() == 31) {
					formater = new SimpleDateFormat("yyyy年MM月dd日");
					cellValue = formater.format(d);
				} else if (cell.getCellStyle().getDataFormat() == 58) {
					formater = new SimpleDateFormat("MM月dd日");
					cellValue = formater.format(d);
				} else if (cell.getCellStyle().getDataFormat() == 14) {
					formater = new SimpleDateFormat("yyyy-MM-dd");
					cellValue = formater.format(d);
				} else if (cell.getCellStyle().getDataFormat() == 57) {
					formater = new SimpleDateFormat("yyyy年MM月");
					cellValue = formater.format(d);
				} else if (cell.getCellStyle().getDataFormat() == 20) {
					formater = new SimpleDateFormat("HH:mm");
					cellValue = formater.format(d);
				} else if (cell.getCellStyle().getDataFormat() == 32) {
					formater = new SimpleDateFormat("HH时mm分");
					cellValue = formater.format(d);
				} else if (cell.getCellStyle().getDataFormat() == 9) {
					cellValue = df.format(cell.getNumericCellValue() * 100) + "%";
				} else if (DateUtil.isCellDateFormatted(cell)) {
					formater = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					cellValue = formater.format(d);
				} else {
					cellValue = df.format(cell.getNumericCellValue());
				}
				break;
			case FORMULA:
				try {
					cellValue = df.format(cell.getNumericCellValue());
				} catch (Exception e) {
					cellValue = cell.getCellFormula();
				}
				break;
			case STRING:
				cellValue = cell.getRichStringCellValue().getString();
				break;
			case BLANK:
				break;
			case ERROR:
				break;
			default:
				cellValue = "";
				break;
			}
		}
		return cellValue;
	}

	/**
	 * 根据HSSFCell类型设置数据
	 *
	 * @param cell
	 * @return
	 */
	private String getCellFormatValue(Cell cell) {
		String cellvalue = "";
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		if (cell != null) {

			// 判断当前Cell的Type
			switch (cell.getCellTypeEnum()) {

			// 如果当前Cell的Type为NUMERIC
			case NUMERIC:
				if (DateUtil.isCellDateFormatted(cell)) {
					System.out.println(cell.getDateCellValue());
					cellvalue = sdf.format(cell.getDateCellValue());
				} else {
					System.out.println(cell.getNumericCellValue());
					cellvalue = cell.getNumericCellValue() + "";
				}
				break;
			case BOOLEAN:
				System.out.println(cell.getBooleanCellValue());
				break;
			case FORMULA: {
				// 判断当前的cell是否为Date
				if (HSSFDateUtil.isCellDateFormatted(cell)) {
					// 如果是Date类型则，转化为Data格式

					// 方法1：这样子的data格式是带时分秒的：2011-10-12 0:00:00
					// cellvalue = cell.getDateCellValue().toLocaleString();

					// 方法2：这样子的data格式是不带带时分秒的：2011-10-12
					Date date = cell.getDateCellValue();

					cellvalue = sdf.format(date);

				}
				// 如果是纯数字
				else {
					// 取得当前Cell的数值
					DecimalFormat df = new DecimalFormat("#");
					cellvalue = df.format(cell.getNumericCellValue());
				}
				break;
			}
			// 如果当前Cell的Type为STRIN
			case STRING:
				// 取得当前的Cell字符串
				cellvalue = cell.getRichStringCellValue().getString();
				break;
			// 默认的Cell值
			default:
				cellvalue = " ";
			}
		} else {
			cellvalue = "";
		}
		return cellvalue;

	}
}