package com.xsupport.service.impl.export;

import com.xsupport.dao.manage.SysWarnDao;
import com.xsupport.dao.measure.GasDao;
import com.xsupport.dao.measure.HumidityDao;
import com.xsupport.dao.measure.SoakDao;
import com.xsupport.dao.measure.TemperatureDao;
import com.xsupport.jpa.manage.SysWarnMapper;
import com.xsupport.jpa.manage.TypeMapper;
import com.xsupport.jpa.measure.GasMapper;
import com.xsupport.jpa.measure.HumidityMapper;
import com.xsupport.jpa.measure.SoakMapper;
import com.xsupport.jpa.measure.TemperatureMapper;
import com.xsupport.service.export.ExportService;
import com.xsupport.util.ExcelUtil;
import com.xsupport.util.MapUtil;
import org.apache.poi.ss.usermodel.BorderStyle;
import org.apache.poi.ss.usermodel.HorizontalAlignment;
import org.apache.poi.ss.usermodel.VerticalAlignment;
import org.apache.poi.xssf.usermodel.*;
import org.springframework.core.io.ClassPathResource;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.*;

/**
 * @author lxc
 * @date 2019/5/3
 * @description
 */
@Service
public class ExportServiceImpl implements ExportService {

    @Resource
    private TemperatureDao temperaturDao;

    @Resource
    private HumidityDao humidityDao;

    @Resource
    private SoakDao soakDao;

    @Resource
    private GasDao gasDao;

    @Resource
    private SysWarnDao sysWarnDao;

    private static final Integer START_ROW = 1;

    private static final Integer HEADER_ROW = 0;


    @Override
    public void exportExcel(Integer bigType) throws Exception {
        XSSFWorkbook workbook = new XSSFWorkbook(new FileInputStream(getTemplate()));
        XSSFSheet sheet = workbook.getSheetAt(2);
        XSSFRow row;
        XSSFCell cell;
        XSSFCellStyle style = getStyle(workbook);
        List<Map<String, String>> dataList = getData(workbook, bigType);
        List<String> headerList = new ArrayList<>();

        row = sheet.getRow(HEADER_ROW);

        for (int i = 0; i < row.getLastCellNum(); i++) {
            headerList.add(row.getCell(i).getStringCellValue());
        }

        for (int i = 0; i < dataList.size(); i++) {
            row = sheet.createRow(i + START_ROW);
            Map<String, String> map = dataList.get(i);

            for (int j = 0; j < headerList.size(); j++) {
                cell = row.createCell(j);
                cell.setCellStyle(style);
                String key = headerList.get(j);
                if (map.containsKey(key)) {

                    String value = map.get(key);
                    cell.setCellValue(value);
                } else {
                    if (j == 0) {
                        cell.setCellValue(i + 1);
                    }
                }
            }
        }
        ExcelUtil.output(workbook);
    }

    private File getTemplate() throws IOException {
        return new ClassPathResource("excel/excel-template.xlsx").getFile();
    }

    private List<Map<String, String>> getData(XSSFWorkbook workbook, Integer bigType) {


        List<String> removeSheets = new ArrayList<>(Arrays.asList("sheet1", "sheet2", "sheet3"));
        List<Map<String, String>> list = new ArrayList<>();
        String sheetName = "";
        Integer sheetIndex = 0;

        switch (bigType) {
            case 0:
                sheetName = "温度测量记录";
                List<?> dataList = temperaturDao.exportInfo();
                if (dataList != null && dataList.size() > 0) {
                    dataList.forEach(temperature -> list.add(MapUtil.getApiStringKeyAndValue(temperature)));
                }
                break;
            case 1:
                sheetName = "湿度测量记录";
                dataList = humidityDao.exportInfo();
                if (dataList != null && dataList.size() > 0) {
                    dataList.forEach(humidity -> list.add(MapUtil.getApiStringKeyAndValue(humidity)));
                }
                break;
            case 2:
                sheetName = "浸润测量记录";
                dataList = soakDao.exportInfo();
                if (dataList != null && dataList.size() > 0) {
                    dataList.forEach(soak -> list.add(MapUtil.getApiStringKeyAndValue(soak)));
                }
                break;
            case 3:
                sheetIndex = 1;
                sheetName = "有毒气体测量记录";
                dataList = gasDao.exportInfo(bigType);
                if (dataList != null && dataList.size() > 0) {
                    dataList.forEach(gas -> list.add(MapUtil.getApiStringKeyAndValue(gas)));
                }
                break;
            case 4:
                sheetIndex = 1;
                sheetName = "重金属测量记录";
                dataList = gasDao.exportInfo(bigType);
                if (dataList != null && dataList.size() > 0) {
                    dataList.forEach(gas -> list.add(MapUtil.getApiStringKeyAndValue(gas)));
                }
                break;
            case -1:
                sheetIndex = 2;
                sheetName = "测量异常记录";
                dataList = sysWarnDao.exportInfo();
                if (dataList != null && dataList.size() > 0) {
                    dataList.forEach(sysWarn -> list.add(MapUtil.getApiStringKeyAndValue(sysWarn)));
                }
        }
        removeSheets.remove(removeSheets.get(sheetIndex));
        workbook.setSheetName(sheetIndex, sheetName);
        ExcelUtil.removeSheet(workbook, removeSheets);
        return list;
    }

    /**
     * 默认样式
     *
     * @param workbook
     * @return
     */
    public static XSSFCellStyle getStyle(XSSFWorkbook workbook) {

        XSSFCellStyle style = workbook.createCellStyle();
        //水平居中对齐
        style.setAlignment(HorizontalAlignment.CENTER);
        //垂直居中对齐
        style.setVerticalAlignment(VerticalAlignment.CENTER);

        return style;
    }

    public static void main(String[] args) throws Exception {
        new ExportServiceImpl().exportExcel(0);
    }
}
