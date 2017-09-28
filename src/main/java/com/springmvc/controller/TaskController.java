package com.springmvc.controller;

import com.springmvc.cache.LocalCache;
import com.springmvc.entity.PageBean;
import com.springmvc.entity.PageParam;
import com.springmvc.entity.SnowflakeIdWorker;
import com.springmvc.entity.Task;
import com.springmvc.service.TaskService;
import com.springmvc.util.CookieUtil;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.ServletInputStream;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.InetAddress;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/Task")
public class TaskController {

    @Autowired
    private TaskService taskService;

    //提交，保存user
    @RequestMapping(value = "/submitRecord", method = RequestMethod.POST)
    @ResponseBody
    public String submitRecord(
            HttpServletRequest request,
            Task task) {

        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        task.set时间(sdf.format(new Date()));

        String image2 = request.getParameter("headFilename");
        String pdf2 = request.getParameter("matFilename");
        String headImagePath = LocalCache.cachemap.get(image2);
        String matFilename = LocalCache.cachemap.get(pdf2);
        task.set头像图(headImagePath);
        task.set材料图(matFilename);

        try {
            task.set机器编号(InetAddress.getLocalHost().toString());
        }catch (Exception e){
            e.printStackTrace();
        }

        SnowflakeIdWorker idWorker = new SnowflakeIdWorker(0, 0);
        long id = idWorker.nextId();
//        Long findnext = taskService.findNext()+(long)1;
        task.set业务序号(id);


        String result;
        if (taskService.insertSelective(task) == 1)
            result = "上传成功！";
        else
            result = "上传失败！";
        return result;
    }


    @RequestMapping(value="/UploadImage")
    public @ResponseBody void uploadImage(
            HttpServletRequest request) throws IOException {

        String path = request.getSession().getServletContext().getRealPath("upload");

        File parentPath = new File(path);
        if(!parentPath.exists()){
            parentPath.mkdirs();
        }

        String fileName = UUID.randomUUID()+".jpg";
        try {
            ServletInputStream stream = request.getInputStream();
            String filePath = parentPath+"/"+fileName;
            OutputStream bos = new FileOutputStream(filePath);
            int bytesRead = 0;
            byte[] buffer = new byte[400000];
            while ((bytesRead = stream.read(buffer, 0, 400000)) != -1) {
                bos.write(buffer, 0, bytesRead);
                bos.flush();
            }
            bos.close();
            stream.close();
        }
        catch (IOException e) {
            e.printStackTrace();
        }

        String imgID = request.getParameter("headFilename");
        LocalCache.cachemap.put(imgID,fileName);
    }


    @RequestMapping(value="/UploadPdf")
    public @ResponseBody void uploadPdf(
            HttpServletRequest request) throws IOException {

        String path = request.getSession().getServletContext().getRealPath("upload");
        File parentPath = new File(path);
        if(!parentPath.exists()){
            parentPath.mkdirs();
        }
        String fileName = UUID.randomUUID()+".pdf";

        try {
            ServletInputStream stream = request.getInputStream();
            String filePath = parentPath+"/"+fileName;
            OutputStream bos = new FileOutputStream(filePath);
            int bytesRead = 0;
            byte[] buffer = new byte[400000];
            while ((bytesRead = stream.read(buffer, 0, 400000)) != -1) {
                bos.write(buffer, 0, bytesRead);
                bos.flush();
            }
            bos.close();
            stream.close();
        }
        catch (IOException e) {
            e.printStackTrace();
        }
        String pdfID = request.getParameter("matFilename");
        LocalCache.cachemap.put(pdfID,fileName);
    }

    @ResponseBody
    @RequestMapping(value="/GetFindList")
    public Object getFindList(Task task,
                                            PageParam pageParam,
                                            @RequestParam(value="startTime",required = false) String startTime,
                                            @RequestParam(value="endTime",required = false)String endTime){
//        System.out.println("pageParam"+pageParam.toString());
        PageBean<Task> result = taskService.selectByPrimaryKey(task,pageParam,startTime,endTime);
//        System.out.println("result"+result.toString());
        return result;
    }
}