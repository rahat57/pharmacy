/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.drugs.pharmacy.service;

import com.drugs.pharmacy.dao.MedicineDao;
import com.drugs.pharmacy.model.Medicine;
import net.minidev.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

;
import java.util.HashMap;
import java.util.Map;

/**
 *
 * @author Rahat
 */

@Service
public class MedicineServiceImpl implements MedicineService {

    @Autowired
    MedicineDao medicineDao;

    @Override
    public Object addMedicine(Medicine medicine) {
        int added = medicineDao.addMedicine(medicine);
        Map json = new HashMap();
        JSONObject jsonOb = new JSONObject();
        if (added==1){
            json.put("msg","Medicine added successfully");
            json.put("code","200");
        } else {
            json.put("error","not added try again later");
        }
        jsonOb.putAll(json);
        return jsonOb;
    }

    @Override
    public Object updateMedicine(Medicine medicine) {
        int added = medicineDao.updateMedicine(medicine);
        Map json = new HashMap();
        JSONObject jsonOb = new JSONObject();
        if (added==1){
            json.put("msg","resource updated successfully");
            json.put("code","200");
        } else {
            json.put("error","not updated try again later");
        }
        jsonOb.putAll(json);
        return jsonOb;
    }


    @Override
    public Object deleteMedicine(Medicine medicine) {
        int added = medicineDao.deleteMedicine(medicine);
        Map json = new HashMap();
        JSONObject jsonOb = new JSONObject();
        if (added==1){
            json.put("msg","resource delete successfully");
            json.put("code","200");
        } else {
            json.put("error","not delete try again later");
        }
        jsonOb.putAll(json);
        return jsonOb;
    }



    @Override
    public Object getMedicines() {
        return medicineDao.getMedicines();
    }

}
