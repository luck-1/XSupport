package com.xsupport.service.impl.export;

import com.xsupport.model.measure.Gas;
import com.xsupport.model.measure.Humidity;
import com.xsupport.model.measure.Soak;
import com.xsupport.model.measure.Temperature;
import com.xsupport.service.export.ExportService;
import com.xsupport.util.ExcelUtil;
import com.xsupport.util.MapUtil;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.core.io.ClassPathResource;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.*;

/**
 * @author lxc
 * @date 2019/5/3
 * @description
 */
public class ExportServiceImpl implements ExportService {

    private File getTemplate(){
        try {
            return new ClassPathResource("excel/excel-template.xlsx").getFile();
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }

    private Map<String, Object> getData(XSSFWorkbook workbook, Integer bigType) {
        Map<String, Object> map = new HashMap<>();
        String sheetName = "";
        List<String> removeSheets = new ArrayList<>(Arrays.asList("sheet1", "sheet2", "sheet3"));
        switch (bigType) {
            case 0:
                sheetName = "温度测量记录";
                removeSheets.remove("sheet1");
                map = MapUtil.getApiKeyAndValue(Temperature.class);
                break;
            case 1:
                sheetName = "湿度测量记录";
                removeSheets.remove("sheet1");

                break;
            case 2:
                sheetName = "浸润测量记录";
                removeSheets.remove("sheet1");

                break;
            case 3:
                sheetName = "有毒气体测量记录";
                removeSheets.remove("sheet2");

                break;
            case 4:
                sheetName = "重金属测量记录";
                removeSheets.remove("sheet2");

                break;
            case -1:
                sheetName = "测量异常记录";
                removeSheets.remove("sheet3");
        }
        ExcelUtil.removeSheet(workbook, removeSheets);
        workbook.setSheetName(0, sheetName);
        map.put("sheetName",workbook.getSheetAt(0));
        return map;
    }


    @Override
    public void exportExcel(Integer bigType) throws Exception {
        XSSFWorkbook workbook = new XSSFWorkbook(new FileInputStream(getTemplate()));
        Map map = getData(workbook, bigType);

        ExcelUtil.output(workbook);
    }

}
