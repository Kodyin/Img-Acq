package com.springmvc.dao;

import com.springmvc.entity.PageParam;
import com.springmvc.entity.Task;
import oracle.sql.NUMBER;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.RequestParam;

import java.math.BigDecimal;
import java.util.List;

@Repository
public interface TaskMapper {

    int delete(Task record);

    int insertSelective(Task record);

    Task findNext();


    List<Task> selectByPrimaryKey(@Param("task") Task task, @Param("pageParam") PageParam pageParam,
                                  @Param("startTime") String startTime,
                                  @Param("endTime") String endTime);
    Long selectCountByPrimaryKey(@Param("task") Task task, @Param("pageParam") PageParam pageParam,
                                  @Param("startTime") String startTime,
                                  @Param("endTime") String endTime);
    List<Task> findAll();


    int updateByPrimaryKey(Task record);

    List<Task> selectLike (String 业务类型);

    List<Task> selectSelective (Task task);
}