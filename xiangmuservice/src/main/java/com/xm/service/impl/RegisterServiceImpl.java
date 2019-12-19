package com.xm.service.impl;

import com.xm.dao.RegisterDao;
import com.xm.entity.Register;
import com.xm.service.RegisterService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service(value = "registerService")
public class RegisterServiceImpl implements RegisterService {
    @Autowired
    RegisterDao registerDao;
    public String NewRegister() {
        return registerDao.NewRegister().substring(0,3)+(Integer.parseInt(registerDao.NewRegister().substring(3,registerDao.NewRegister().length()))+1);
    }

    public boolean getExtRegister(String registercode) {
        return registerDao.getExt(registercode)==1;
    }

    public Register getOneRegister(String registercode) {
        return registerDao.getOne(registercode);
    }
}
