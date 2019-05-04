package com.xsupport.service.export;

import org.springframework.stereotype.Component;

import java.io.FileNotFoundException;
import java.io.IOException;

@Component
public interface ExportService {

    void exportExcel(Integer bigType) throws Exception;

}
