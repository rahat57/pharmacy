package com.drugs.pharmacy.dao;

import com.drugs.pharmacy.model.Medicine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.support.JdbcDaoSupport;
import org.springframework.stereotype.Repository;

import javax.annotation.PostConstruct;
import javax.sql.DataSource;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.List;
import java.util.Map;

@Repository
public class MedicineDaoImpl extends JdbcDaoSupport implements MedicineDao {

    @Autowired
    DataSource ds;

    @PostConstruct
    public void initialize() {
        setDataSource(ds);
    }


    @Override
    public int addMedicine(Medicine medicine) {

        String sql = "insert into medicines (medicine_name,brand_name,expiry,quantity,price) values (?,?,?,?,?)";
        int noInsertedRows = getJdbcTemplate().update(sql, new Object[]{
               medicine.getMedicineName(),
                medicine.getBrandName(),
                LocalDate.parse(medicine.getExpiry()),
                medicine.getQuantity(),
                medicine.getPrice()


        });
        return noInsertedRows;
    }

    @Override
    public int updateMedicine(Medicine medicine) {
        String sql = "update medicines set  price = ? where medicine_id = ?;";
        int noInsertedRows = 0;
        try {
            noInsertedRows = getJdbcTemplate().update(sql, new Object[]{

                    medicine.getPrice(),
                    Integer.parseInt(medicine.getId())

            });
        } catch (DataAccessException ex){
            System.out.println("error "+ex.getMessage());
        }
        return noInsertedRows;
    }


    public int deleteMedicine(Medicine medicine) {
        String sql = "delete from medicines where medicine_id = ?;";
        int noInsertedRows = 0;
        try {
            noInsertedRows = getJdbcTemplate().update(sql, new Object[]{

                    Integer.parseInt(medicine.getId())

            });
        } catch (DataAccessException ex){
            System.out.println("error "+ex.getMessage());
        }
        return noInsertedRows;
    }





    @Override
    public Object getMedicines() {
        String sql ="Select * from medicines;";
        List<Map<String, Object>> medicines = null;
        try {
            medicines = getJdbcTemplate().
                    queryForList(sql,
                            new Object[]{
                            });
            return medicines;
        } catch (DataAccessException e) {
            System.err.println("error: " + e.getMessage());
        }
        return medicines;
    }
}
