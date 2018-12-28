import DAO.*;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import javax.imageio.ImageIO;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.BinaryBitmap;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatReader;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.NotFoundException;
import com.google.zxing.Result;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.BufferedImageLuminanceSource;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.common.HybridBinarizer;
import com.google.zxing.qrcode.decoder.ErrorCorrectionLevel;

/**
 * Servlet implementation class QR_code_generate
 */
@WebServlet("/QR_code_generate")
@MultipartConfig(maxFileSize = 1024 * 1024 * 10)
public class QR_code_generate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public QR_code_generate() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub

		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String blood_group = request.getParameter("blood_group");
		String department = request.getParameter("department");
		Part part = request.getPart("photo");
		InputStream is = part.getInputStream();

		String emp_info = "=======================\n" + "Id : " + id + "\nName : " + name + "\nBlood Grouo : "
				+ blood_group + "\nDepartment : " + department + "\n=======================";

		//String filePath = "F:\\" + id + "_" + name + "_QR_code.png";
		String filePath = "F:\\Hibernate_A\\QR_identification_card\\WebContent\\" + id + "_" + name + "_QR_code.png";
//		F:\\Hibernate_A\QR_identification_card\WebContent
		String charset = "UTF-8"; // or "ISO-8859-1"
		Map map = new HashMap();
		map.put(EncodeHintType.ERROR_CORRECTION, ErrorCorrectionLevel.L);

		try {
			createQRCode(emp_info, filePath, charset, map, 200, 200);
		} catch (WriterException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("QR Code image created successfully!!!");

		try {
			System.out.println("Data read from QR Code: " + readQRCode(filePath, charset, map));
		} catch (NotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		Connection con = DB.getConnection();
		try {
			PreparedStatement ps = con.prepareStatement("insert into employee(id,qr_code,photo) values(?, ?, ?)");
			ps.setInt(1, Integer.parseInt(id));
			ps.setString(2, filePath);
			ps.setBlob(3, is);
			int result = ps.executeUpdate();
			con.close();

			if (result > 0) {
				request.getRequestDispatcher("success.jsp").forward(request, response);
			} else {

				request.getRequestDispatcher("fail.jsp").forward(request, response);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}

	public static void createQRCode(String qrCodeData, String filePath, String charset, Map map, int qrCodeheight,
			int qrCodewidth) throws WriterException, IOException {
		BitMatrix matrix = new MultiFormatWriter().encode(new String(qrCodeData.getBytes(charset), charset),
				BarcodeFormat.QR_CODE, qrCodewidth, qrCodeheight, map);
		MatrixToImageWriter.writeToFile(matrix, filePath.substring(filePath.lastIndexOf('.') + 1), new File(filePath));
	}

	public static String readQRCode(String filePath, String charset, Map map)
			throws FileNotFoundException, IOException, NotFoundException {
		BinaryBitmap binaryBitmap = new BinaryBitmap(
				new HybridBinarizer(new BufferedImageLuminanceSource(ImageIO.read(new FileInputStream(filePath)))));
		Result qrCodeResult = new MultiFormatReader().decode(binaryBitmap, map);
		return qrCodeResult.getText();
	}

}
