/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.drugs.pharmacy.controller;

import com.drugs.pharmacy.model.Medicine;
import com.drugs.pharmacy.service.MedicineService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.annotation.RequestScope;

import java.io.IOException;

/**
 *
 * @author Rahat
 */
@RestController
@RequestMapping("/pharmacy")
@RequestScope
@CrossOrigin(origins = "http://localhost", allowedHeaders = {})
public class MedicineController {

    @Autowired
    private MedicineService medicineService;


    @RequestMapping(value = "/medicine", method = RequestMethod.POST)
    public Object addMedicine(@RequestBody Medicine medicine) throws IOException {

    return medicineService.addMedicine(medicine);

    }

    @RequestMapping(value = "/medicine", method = RequestMethod.GET)
    public Object getListOfMedicines() throws  IOException {
        return medicineService.getMedicines();
    }

    @RequestMapping(value = "/medicine", method = RequestMethod.PUT)
    public Object updateMedicine(@RequestBody Medicine medicine) throws  IOException {
        return medicineService.updateMedicine(medicine);
    }


}
