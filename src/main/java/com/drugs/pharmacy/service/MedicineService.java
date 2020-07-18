/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.drugs.pharmacy.service;

import com.drugs.pharmacy.model.Medicine;
import org.springframework.web.multipart.MultipartFile;

;

/**
 *
 * @author Rahat
 */

public interface MedicineService {

    public Object addMedicine( Medicine medicine);

    public Object updateMedicine(Medicine location);

    public Object getMedicines();

    public Object deleteMedicine(Medicine medicine);
}
