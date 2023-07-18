package com.jia.fileupload;

import static org.junit.Assert.assertEquals;

import java.util.List;
import java.util.UUID;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.jia.mapper.FileuploadMapper;
import com.jia.vo.FileuploadVO;

import jdk.internal.org.jline.utils.Log;
import lombok.extern.log4j.Log4j;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
@Log4j
public class FileuploadTest {
	
	@Autowired
	FileuploadMapper fileuploadMapper;
	
	@Test
	public void test() {
		FileuploadVO file = new FileuploadVO();
		UUID uuid = UUID.randomUUID();
		file.setUuid(uuid.toString());
		
		file.setUploadpath("uploadpath");
		file.setFilename("filename");
		file.setFiletype("I");
		file.setBno(141);
		int res =fileuploadMapper.insert(file);
		assertEquals(1, res);
	}
	
	@Test
	public void getListTest() {
		List<FileuploadVO> list = fileuploadMapper.GetList(141);
		list.forEach(file->{
			log.info(file.getFilename());
			log.info(file.getUploadpath());
		});
	}
}
