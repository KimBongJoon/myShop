package product;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class ProductDAO {
	
	private Connection con;
	private ResultSet rs;

	public ProductDAO() {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/myShop", "root", "1234");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void insert(String productId, String productName, String productContent, int price) {
		String sql = "insert into product values (?, ?, ?, ?)";
		try {
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, productId);
			pstmt.setString(2, productName);
			pstmt.setString(3, productContent);
			pstmt.setInt(4, price);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}	
	}
	
	public ArrayList<ProductDTO> selectAll() {
		String sql = "select * from product";
		ArrayList<ProductDTO> list = new ArrayList<>();
		try {
			PreparedStatement pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ProductDTO dto = new ProductDTO();
				dto.setProductId(rs.getString(1));
				dto.setProductName(rs.getString(2));
				dto.setProductContent(rs.getString(3));
				dto.setPrice(rs.getInt(4));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public void update(String productId, String productName, String productContent, int price) {
		String sql = "update product set productName=?, productContent=?, price=? where productId=?";
		try {
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, productName);
			pstmt.setString(2, productContent);
			pstmt.setInt(3, price);
			pstmt.setString(4, productId);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public void delete(String productId) {
		String sql = "delete from product where productId=?";
		try {
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, productId);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<ProductDTO> select(String search) {
		String sql = "select * from product where productId LIKE ? or productName LIKE ? or productContent LIKE ? or price LIKE ?";
		ArrayList<ProductDTO> list = new ArrayList<>();
		try {
			PreparedStatement pstmt = con.prepareStatement(sql);
			pstmt.setString(1, "%" + search + "%");
			pstmt.setString(2, "%" + search + "%");
			pstmt.setString(3, "%" + search + "%");
			pstmt.setString(4, "%" + search + "%");
			rs = pstmt.executeQuery();
			while(rs.next()) {
				ProductDTO dto = new ProductDTO();
				dto.setProductId(rs.getString(1));
				dto.setProductName(rs.getString(2));
				dto.setProductContent(rs.getString(3));
				dto.setPrice(rs.getInt(4));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
}
