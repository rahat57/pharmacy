/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.tpl.hca.dao;

import com.tpl.hca.model.Medicine;

;import java.util.List;
import java.util.Map;

/**
 *
 * @author Rahat
 */

public interface MedicineDao {

    public int addMedicine( Medicine medicine);

    public int updateMedicine(Medicine location);

    public Object getMedicines();
}
