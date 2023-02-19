/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.OrderDTO;
import dto.ProductDTO;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Set;
import util.DBUtils;

/**
 *
 * @author MY PC
 */
public class OrderDAO {

    Connection con = null;
    PreparedStatement pst = null;
    ResultSet rs = null;

    public boolean insertOrder(int accountId, String address, double total, HashMap<Integer, ProductDTO> cart) {
        boolean result = false;
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                int orderid = 0;

                con.setAutoCommit(false);

                //insert a new order
//                System.out.println("AccountId:" + accountId);
                Long milis = System.currentTimeMillis();
                Date d = new Date(milis);
                System.out.println("OrderDate:" + d);
                String sql = "insert Orders(AccId, Address, Status, Total, Date) values(?,?,?,?,?)";
                pst = con.prepareStatement(sql);
                pst.setInt(1, accountId);
                pst.setString(2, address);
                pst.setInt(3, 1);
                pst.setFloat(4, Float.valueOf("" + total));
                pst.setDate(5, d);
                pst.executeUpdate();

                //get order id that is the lagest number
                sql = "select top 1 orderID from Orders order by orderId desc";
                pst = con.prepareStatement(sql);
                rs = pst.executeQuery();
                if (rs != null && rs.next()) {
                    orderid = rs.getInt("orderID");
                }

                //insert order Details
                System.out.println("OrderId:" + orderid);
                Set<Integer> keys = cart.keySet();
                for (Integer key : keys) {
                    sql = "insert OrderDetails values(?, ? ,?, ?)";
                    pst = con.prepareStatement(sql);
                    pst.setInt(1, orderid);
                    pst.setInt(2, key);
                    pst.setInt(3, cart.get(key).getQuantity());
                    double totalOfProduct = cart.get(key).getQuantity() * cart.get(key).getPrice();
                    pst.setFloat(4, Float.valueOf("" + totalOfProduct));
                    pst.executeUpdate();
                    con.commit();
                    con.setAutoCommit(true);
                }
                return true;

            } else {
                System.out.println("k chen order dc");
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
                result = false;
            }
        }
        return result;
    }

    public List<OrderDTO> getOrderByAccountId(int accountId) {
        List<OrderDTO> orderDTOs = new ArrayList<>();
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "select *\n"
                        + "from Orders\n"
                        + "where AccId = ?";
                pst = con.prepareStatement(sql);
                pst.setInt(1, accountId);
                rs = pst.executeQuery();
                while (rs.next()) {
                    OrderDTO orderDTO
                            = new OrderDTO(rs.getInt(1), rs.getInt(2), rs.getString(3), rs.getInt(4), rs.getFloat(5), rs.getString(6));
                    orderDTOs.add(orderDTO);
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
        return orderDTOs;
    }

}
