package com.matjo.web.common;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import org.springframework.web.multipart.MultipartFile;

public class Util {
	/**
	 * 
	 * @param file
	 * @param upPath
	 * @return
	 * @throws Exception
	 */
	public static String uploadFileMng(MultipartFile file, String upPath) throws Exception {
		
		// 파일 저장
		if (file == null)
			return null;
		// 파일을 저장하는 처리를 시작한다
		File saveDir = new File(upPath);
		if (!saveDir.exists()) {
			saveDir.mkdirs();
		}

		// 파일 이름 + 확장자 정해주기
		// miliSeconds보다 더 잘게 나눈 시간 - 겹칠 수 없는 파일 이름 용도
		String fileName = System.nanoTime() + "";
		// 뒤에 확장자 뽑기
		String fileExt = file.getOriginalFilename().substring(file.getOriginalFilename().lastIndexOf("."));

		System.out.println(fileName + fileExt);

		String fullFilePath = saveDir.getPath() + File.separator + fileName + fileExt;

		// 파일 저장
		byte[] bytes = file.getBytes();
		BufferedOutputStream buffStream = new BufferedOutputStream(new FileOutputStream(fullFilePath));
		buffStream.write(bytes);
		buffStream.close();

		return fileName + fileExt;
	}
}