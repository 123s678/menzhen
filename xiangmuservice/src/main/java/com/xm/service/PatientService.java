package com.xm.service;

import com.xm.entity.Patient;

public interface PatientService {
    boolean isPat(String cardcode);
    Patient ontPat(String cardcode);
    String selectMaxPat_1();
}
