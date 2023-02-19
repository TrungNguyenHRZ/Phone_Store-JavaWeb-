/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.AccountDTO;
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
public class AccountDAO {

    Connection con = null;
    PreparedStatement pst = null;
    ResultSet rs = null;

    public List<AccountDTO> getAccounts() {

        List<AccountDTO> list = new ArrayList<>();
        try {
            con = util.DBUtils.getConnection();
            if (con != null) {
                String sql = "SELECT *\n"
                        + "FROM Accounts";
                pst = con.prepareStatement(sql);
                rs = pst.executeQuery();
                //    private int accId; 
                //    private String email; 
                //    private String password;             
                //    private String fullName; 
                //    private int statas; 
                //    private boolean role;
                while (rs.next()) {
                    list.add(new AccountDTO(rs.getInt(1),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getString(4),
                            rs.getInt(5),
                            rs.getBoolean(6)));
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

    public AccountDTO checkLogin(String email, String password) {
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "select AccId,Email,Password,FullName,Status,Role\n"
                        + "from Accounts\n"
                        + "where Email = ? and Password = ?";
                pst = con.prepareStatement(sql);
                pst.setString(1, email);
                pst.setString(2, password);
                rs = pst.executeQuery();
                if (rs.next()) {
                    return new AccountDTO(rs.getInt(1),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getString(4),
                            rs.getInt(5),
                            rs.getBoolean(6));
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

    public AccountDTO getAccountById(int accountId) {
        try {
            con = DBUtils.getConnection();
            if (con != null) {
                String sql = "select AccId,Email,Password,FullName,Status,Role\n"
                        + "from Accounts\n"
                        + "where AccId = ?";
                pst = con.prepareStatement(sql);
                pst.setInt(1, accountId);
                rs = pst.executeQuery();
                if (rs.next()) {
                    return new AccountDTO(rs.getInt(1),
                            rs.getString(2),
                            rs.getString(3),
                            rs.getString(4),
                            rs.getInt(5),
                            rs.getBoolean(6));
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

    public boolean insertAccount(AccountDTO adto) {

        try {
            con = util.DBUtils.getConnection();
            if (con != null) {
                String sql = "INSERT INTO Accounts\n"
                        + "VALUES(?,?,?,?,?)";
                pst = con.prepareStatement(sql);
                pst.setString(1, adto.getEmail());
                pst.setString(2, adto.getPassword());
                pst.setString(3, adto.getFullName());
                pst.setInt(4, adto.getStatus());
                pst.setBoolean(5, adto.isRole());
                if (pst.executeUpdate() > 0) {
                    return true;
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
        return false;
    }

    public boolean updatePassword(int accountId, String newPassword) {
        try {
            con = util.DBUtils.getConnection();
            if (con != null) {
                String sql = "update accounts\n"
                        + "set password = ?\n"
                        + "where AccId = ?";
                pst = con.prepareStatement(sql);
                pst.setString(1, newPassword);
                pst.setInt(2, accountId);
                if (pst.executeUpdate() > 0) {
                    return true;
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
        return false;
    }

    public boolean updateFullName(int accountId, String fullName) {
        try {
            con = util.DBUtils.getConnection();
            if (con != null) {
                String sql = "update accounts\n"
                        + "set FullName = ?\n"
                        + "where AccId = ?";
                pst = con.prepareStatement(sql);
                pst.setString(1, fullName);
                pst.setInt(2, accountId);
                if (pst.executeUpdate() > 0) {
                    return true;
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
        return false;
    }

    public boolean getAccountByEmail(String email) {

        try {
            con = util.DBUtils.getConnection();
            if (con != null) {
                String sql = "select *\n"
                        + "from Accounts\n"
                        + "where Email = ?";
                pst = con.prepareStatement(sql);
                pst.setString(1, email);
                rs = pst.executeQuery();
                if (rs.next()) {
                    return true;
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
        return false;
    }
}
