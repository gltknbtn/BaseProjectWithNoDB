package fgik.fadlarec.controller;

import java.awt.image.BufferedImage;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Locale;

import javax.imageio.ImageIO;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.codec.binary.Base64OutputStream;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import fgik.fadlarec.dto.ImgDTO;

@Controller
@RequestMapping(value = "/mainpage")
public class MainPageController {

	@Value("100")
	private int maxResults;

	@RequestMapping(method = RequestMethod.GET)
	public ModelAndView welcome() {

		ModelAndView modelAndView = new ModelAndView("fadlarecmain");
		return modelAndView;

	}
	
	
	@RequestMapping(method = RequestMethod.GET, produces = "application/json")
	public ResponseEntity<?> listAll(@RequestParam int page, Locale locale) {
		List<ImgDTO> imgDTOList = new ArrayList<ImgDTO>();

		try {
			String[] extensions = new String[] { "jpg", "JPG", "jpeg", "JPEG", "png", "PNG" };
			File imagesInShowroomDir = new File(getClass().getResource("/imagesInShowroom").toURI());
			List<File> files = (List<File>) FileUtils.listFiles(imagesInShowroomDir, extensions, true);
			for (int i = 0; i < files.size(); i++) {
				File f =  files.get(i);
				ImgDTO imgDTO = new ImgDTO();
				imgDTO.setImgName(f.getName());
				
				byte[] imgByteArr = IOUtils.toByteArray(new FileInputStream(f));
				
				imgDTO.setImgBase64Str(imgByteArrToBase64String(imgByteArr));
				imgDTOList.add(imgDTO);

			}


		} catch (Exception e) {
			e.printStackTrace();
		}

	
		return new ResponseEntity<List<ImgDTO>>(imgDTOList, HttpStatus.OK);
	}

	private String bufferedImageToBase64Str(BufferedImage bufferedImage) throws IOException {
		ByteArrayOutputStream os = new ByteArrayOutputStream();
		OutputStream b64 = new Base64OutputStream(os);
		ImageIO.write(bufferedImage, "png", b64);
		String result = os.toString("UTF-8");
		return result;
	}

	private String imgByteArrToBase64String(byte[] imgByteArr) {
		String imgBase64str = "";
		try {
			imgBase64str = Base64.encodeBase64String(imgByteArr);

		} catch (Exception e) {
			e.printStackTrace();
		}
		return imgBase64str;

	}

}
