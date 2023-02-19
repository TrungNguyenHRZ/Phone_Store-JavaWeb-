/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.OrderDetailDTO;
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
public class OrderDetailDAO implements Serializable {

    Connection con = null;
    PreparedStatement pst = null;
    ResultSet rs = null;

    public List<OrderDetailDTO> getOrderDetailByOrderId(int orderId) {
        List<OrderDetailDTO> orderDetailDTOs = new ArrayList<>();
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "select *\n"
                        + "from OrderDetails \n"
                        + "where OrderId = ?";
                pst = con.prepareStatement(sql);
                pst.setInt(1, orderId);
                rs = pst.executeQuery();
                while (rs.next()) {
                    OrderDetailDTO orderDetailDTO
                            = new OrderDetailDTO(rs.getInt(1), rs.getInt(2), rs.getInt(3), rs.getFloat(4));
                    orderDetailDTOs.add(orderDetailDTO);
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
        return orderDetailDTOs;
    }

}
