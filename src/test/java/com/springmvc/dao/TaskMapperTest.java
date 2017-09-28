package com.springmvc.dao;

import com.springmvc.entity.Task;
import oracle.sql.NUMBER;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

import static org.junit.Assert.*;

/**
 * Created by Administrator on 2017/8/3.
 */
public class TaskMapperTest {
    private ApplicationContext applicationContext;
    @Autowired
    private TaskMapper taskMapper;

    @Before
    public void setUp() throws Exception {
        applicationContext = new ClassPathXmlApplicationContext("classpath:spring/applicationContext.xml");//加载spring配置文件
        taskMapper = applicationContext.getBean(TaskMapper.class);//在这里导入要测试的
    }

    @After
    public void tearDown() throws Exception {
    }

//    @Test
//    public void insertSelective() throws Exception {
//        Task task = new Task();
//        task.set业务序号("88888888888888");
//        int result = taskMapper.insertSelective(task);
//        System.out.println(result);
//        assert (result == 1);
//    }

//    @Test
//    public void selectByPrimaryKey() throws Exception {
//        ArrayList<Task> list = taskMapper.selectByPrimaryKey("123");
//        for (Task a:list)
//            System.out.println(a);
//    }

//    @Test
//    public void selectLike() throws Exception {
//        List<Task> list = taskMapper.selectLike("2");
//        for (Task a:list)
//            System.out.println(a);
//    }

//    @Test
//    public void selectSelective() throws Exception {
//        Task task = new Task();
//        task.set办理人("2");
//        List<Task> list = taskMapper.selectSelective(task);
//        for (Task a:list)
//            System.out.println(a);
//    }
//
//    @Test
//    public Long findNext() throws Exception {
//        Task a = taskMapper.findNext();
//        if (a == null)
//            return (long)1;
//        return (a.get业务序号());
//    }

    @Test
    public void updateByPrimaryKey() throws Exception {
        Task a = new Task();
        a.set业务序号((long)5);
        a.set办理人("222222222222");
        taskMapper.delete(a);
    }


}