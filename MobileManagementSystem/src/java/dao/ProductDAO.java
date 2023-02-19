/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.ProductDTO;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import util.DBUtils;

/**
 *
 * @author MY PC
 */
public class ProductDAO implements Serializable {

    Connection con = null;
    PreparedStatement pst = null;
    ResultSet rs = null;

    public List<ProductDTO> getProduct() {

        List<ProductDTO> list = new ArrayList();
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "select *\n"
                        + "from Products";
                pst = con.prepareStatement(sql);
                rs = pst.executeQuery();
                while (rs.next()) {
                    list.add(new ProductDTO(rs.getInt(1),
                            rs.getString(2),
                            rs.getDouble(3),
                            rs.getInt(4),
                            rs.getInt(5),
                            rs.getString(6), rs.getString(7)));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return list;
    }

    public List<ProductDTO> getProductByName(String keyword) {

        List<ProductDTO> list = new ArrayList();
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "select *\n"
                        + "from Products \n"
                        + "where ProductName like ?";
                pst = con.prepareStatement(sql);
                pst.setString(1, "%" + keyword + "%");
                rs = pst.executeQuery();
                while (rs.next()) {
                    list.add(new ProductDTO(rs.getInt(1),
                            rs.getString(2),
                            rs.getDouble(3),
                            rs.getInt(4),
                            rs.getInt(5),
                            rs.getString(6), rs.getString(7)));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return list;
    }

    public ProductDTO getProductById(int productId) {
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "select *\n"
                        + "from Products \n"
                        + "where productId = ?";
                pst = con.prepareStatement(sql);
                pst.setInt(1, productId);
                rs = pst.executeQuery();
//    private int productId;
//    private String productName;
//    private double price;
//    private int cateId;
//    private int status;
//    private int imgPath;
                if (rs.next()) {
                    return new ProductDTO(rs.getInt(1),
                            rs.getString(2),
                            rs.getDouble(3),
                            rs.getInt(4),
                            rs.getInt(5),
                            rs.getString(6), rs.getString(7));
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (con != null) {
                    con.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return null;
    }
}
