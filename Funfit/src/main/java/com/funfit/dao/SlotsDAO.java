package com.funfit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.funfit.dbUtil.DbUtil;
import com.funfit.pojo.Slots;

public class SlotsDAO {

    /* ---------- existing methods (insertSlot, retrieveAllSlots) ---------- */
    public int insertSlot(Slots slot) throws SQLException, ClassNotFoundException {
        try (Connection con = DbUtil.getConn()) {
            if (con == null) { System.out.println("Database connection failed"); return 0; }
            String sql = "INSERT INTO slots (date, time, count) VALUES (?, ?, ?)";
            try (PreparedStatement ps = con.prepareStatement(sql)) {
                ps.setString(1, slot.getDate());
                ps.setString(2, slot.getTime());
                ps.setInt(3, slot.getCount());
                return ps.executeUpdate();
            }
        }
    }

    public List<Slots> retrieveAllSlots() throws SQLException, ClassNotFoundException {
        try (Connection con = DbUtil.getConn()) {
            if (con == null) { System.out.println("Database connection failed"); return new ArrayList<>(); }
            String sql = "SELECT * FROM slots";
            try (PreparedStatement ps = con.prepareStatement(sql);
                 ResultSet rs = ps.executeQuery()) {
                List<Slots> list = new ArrayList<>();
                while (rs.next()) {
                    Slots s = new Slots();
                    s.setId(rs.getInt("id"));
                    s.setDate(rs.getString("date"));
                    s.setTime(rs.getString("time"));
                    s.setCount(rs.getInt("count"));
                    list.add(s);
                }
                return list;
            }
        }
    }

    /* ------------------- NEW METHOD ------------------- */
    /**
     * Register a user (identified by e-mail) for a slot.
     * @return true  – registration succeeded
     *         false – slot full, already registered, or not found
     */
    public boolean registerSlot(String userEmail, int slotId)
            throws SQLException, ClassNotFoundException {

        try (Connection con = DbUtil.getConn()) {
            if (con == null) { System.out.println("Database connection failed"); return false; }

            // 1. Verify slot exists and has seats
            String sqlCheck = "SELECT count FROM slots WHERE id = ? AND count > 0 AND user_email IS NULL";
            try (PreparedStatement ps = con.prepareStatement(sqlCheck)) {
                ps.setInt(1, slotId);
                try (ResultSet rs = ps.executeQuery()) {
                    if (!rs.next()) return false;               // no seat or already taken
                }
            }

            con.setAutoCommit(false);
            try {
                // 2. Decrement seat count
                String sqlDec = "UPDATE slots SET count = count - 1 WHERE id = ?";
                try (PreparedStatement ps = con.prepareStatement(sqlDec)) {
                    ps.setInt(1, slotId);
                    int upd = ps.executeUpdate();
                    if (upd == 0) { con.rollback(); return false; }
                }

                // 3. Record the user who took the seat
                String sqlReg = "UPDATE slots SET user_email = ? WHERE id = ?";
                try (PreparedStatement ps = con.prepareStatement(sqlReg)) {
                    ps.setString(1, userEmail);
                    ps.setInt(2, slotId);
                    ps.executeUpdate();
                }

                con.commit();
                return true;
            } catch (SQLException e) {
                con.rollback();
                throw e;
            } finally {
                con.setAutoCommit(true);
            }
        }
    }
}
