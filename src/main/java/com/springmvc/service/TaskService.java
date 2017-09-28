package com.springmvc.service;

import com.springmvc.dao.TaskMapper;
import com.springmvc.entity.PageBean;
import com.springmvc.entity.PageParam;
import com.springmvc.entity.Task;
import com.springmvc.util.ProjectPath;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TaskService {
    @Autowired
    private TaskMapper taskMapper;

    public int insertSelective(Task task) {
        return taskMapper.insertSelective(task);
    }

    public int delete(Task task) {
        return taskMapper.delete(task);
    }

    public List<Task> selectLike(String 业务类型) {return taskMapper.selectLike(业务类型);}

    public List<Task> findAll() {
        return taskMapper.findAll();
    }


    public Long findNext() {
        Task a = taskMapper.findNext();
        if (a == null)
            return (long)0;
        return (a.get业务序号());
    }

    public int updateByPrimaryKey(Task task) {
        return taskMapper.updateByPrimaryKey(task);
    }

    public PageBean<Task> selectByPrimaryKey(Task task,
                                       PageParam pageParam,
                                       String startTime,
                                       String endTime
    ) {

        List<Task> list = taskMapper.selectByPrimaryKey(task,pageParam,startTime,endTime);
        System.out.println("listwww"+list);
        for(Task taskItem : list){
            taskItem.set头像图(ProjectPath.fileuri+taskItem.get头像图());
            taskItem.set材料图(ProjectPath.fileuri+taskItem.get材料图());
        }

        /*  封装分页参数  */
        PageBean<Task> pageBean = new PageBean<Task>();
        pageBean.setData(list);
        pageBean.setTotal(taskMapper.selectCountByPrimaryKey(task,pageParam,startTime,endTime));
        return pageBean;
    }

    public List<Task> selectSelective(Task task) {
        return taskMapper.selectSelective(task);
    }
}