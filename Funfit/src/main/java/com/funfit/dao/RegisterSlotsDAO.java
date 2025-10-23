package com.funfit.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.funfit.dbUtil.DbUtil;
import com.funfit.pojo.RegisterSlots;
import com.funfit.pojo.Slots;

/**
 * DAO for the register_slots table.
 * Contains the method you need: register a slot for a user.
 */
public class RegisterSlotsDAO {

    public boolean registerSlot(int slotId, String userEmail)
        throws SQLException, ClassNotFoundException {

    try (Connection con = DbUtil.getConn()) {
        if (con == null) return false;

        // 1. Check seat availability
        String sqlCheck = "SELECT count FROM slots WHERE id = ? AND count > 0";
        try (PreparedStatement ps = con.prepareStatement(sqlCheck)) {
            ps.setInt(1, slotId);
            if (!ps.executeQuery().next()) return false;
        }

        // 2. Check duplicate booking
        String sqlDup = "SELECT 1 FROM register_slots WHERE slotId = ? AND userEmail = ?";
        try (PreparedStatement ps = con.prepareStatement(sqlDup)) {
            ps.setInt(1, slotId);
            ps.setString(2, userEmail);
            if (ps.executeQuery().next()) return false;
        }

        con.setAutoCommit(false);
        try {
            // Decrement seat
            String sqlDec = "UPDATE slots SET count = count - 1 WHERE id = ?";
            try (PreparedStatement ps = con.prepareStatement(sqlDec)) {
                ps.setInt(1, slotId);
                if (ps.executeUpdate() == 0) throw new SQLException("No rows updated");
            }

            // Insert booking
            String sqlIns = "INSERT INTO register_slots (slotId, userEmail) VALUES (?, ?)";
            try (PreparedStatement ps = con.prepareStatement(sqlIns)) {
                ps.setInt(1, slotId);
                ps.setString(2, userEmail);
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