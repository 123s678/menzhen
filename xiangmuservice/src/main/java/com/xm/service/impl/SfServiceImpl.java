package com.xm.service.impl;

import com.xm.dao.SfDao;
import com.xm.service.SfService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service(value = "sfService")
public class SfServiceImpl implements SfService {
    @Autowired
    private SfDao sfDao;
    public double getYes(int id) {
        double yn=0;
        double yy=0;
        if(sfDao.getYesNoCount(id)!=0){
            yn=sfDao.getYesNoSum(id);
        }
        if(sfDao.getYesYesCount(id)!=0){
            yn=sfDao.getYesYesSum(id);
        }
        return yn+yy;
    }

    public double getNo(int id) {
        double money=0;
        if(sfDao.getNoCount(id)!=0){
            money=sfDao.getNoSum(id);
        }
        return money;
    }
}
