package com.xm.service;

import com.xm.entity.Register;

public interface RegisterService {
    String NewRegister();
    public boolean getExtRegister(String registercode);
    public Register getOneRegister(String registercode);
}
