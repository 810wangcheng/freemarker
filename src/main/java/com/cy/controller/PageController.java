package com.cy.controller;

import com.cy.entity.Student;
import freemarker.template.Configuration;
import freemarker.template.Template;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.io.File;
import java.io.FileWriter;
import java.io.Writer;
import java.util.*;


@Controller
@RequestMapping("/page")
public class PageController {

    @Value("${spring.freemarker.template-loader-path}")
    private String templatePath;

    @GetMapping("/index1")
    public String toIndex1(){
        return "index";
    }

    @Autowired
    private Configuration configuration;

    @GetMapping("/index2")
    public ModelAndView toIndex2(){
        ModelAndView modelAndView = new ModelAndView("index");
        modelAndView.addObject("title","Freemarker");
        return modelAndView;
    }

    @RequestMapping("/basic")
    public String hello(Model model){
        model.addAttribute("name","freemarker");
        Student student = new Student();
        student.setName("liubei");
        student.setAge(18);
        model.addAttribute("stu",student);
        return "01-basic";
    }

    @RequestMapping("/freemarker001")
    public String freeMarker001(Model model){
        model.addAttribute("name","freemarker");
        Map<String,Object> inputMap = new HashMap<>();
        List<Map<String,Object>> bookList = new ArrayList<Map<String,Object>>();
        inputMap.put("books",bookList);
        inputMap.put("contentTitle","编程书推荐");
        inputMap.put("title","freemaker基础001");
        inputMap.put("date",new Date());

        Map<String,Object> javaBook = new HashMap<>();
        javaBook.put("name","Java高级编程");
        javaBook.put("price",67.5f);
        bookList.add(javaBook);

        Map<String,Object> linuxBook = new HashMap<>();
        linuxBook.put("name","Linux入门到精通");
        linuxBook.put("price",36.8f);
        bookList.add(javaBook);

        Map<String,Object> cssBook = new HashMap<>();
        cssBook.put("name","CSS的艺术");
        cssBook.put("price",44.5f);
        bookList.add(javaBook);

        model.addAttribute("inputMap",inputMap);

        try{
            Template template = configuration.getTemplate("freemarker001.ftl");
            Writer fileWriter = new FileWriter(new File("pages/output.html"));
            template.process(model, fileWriter);
        }catch(Exception e){
            System.out.println("输出文件出错！"+e+":"+e.getMessage());
        }

        return "freemarker001";


    }

    @RequestMapping("/freemarker002")
    public String freeMarker002(Model model){
        //1.声明模板类型
        model.addAttribute("name","freemarker");
        //2.封装数据
        Map<String,Object> resultMap = new HashMap<>();
        //3.生成文件
        try {
            Template template = configuration.getTemplate("freemarker002.ftl");
            FileWriter fileWriter = new FileWriter(new File("pages/freemarker002.html"));
            template.process(model,fileWriter);
        }catch (Exception e){
            System.out.println("输出文件出错！"+e+":"+e.getMessage());
        }
        //4.返回数据
        return "freemarker002";
     }

     @RequestMapping("/freemarker003")
     public String freemarker003(Model model){
        //声明模板
         model.addAttribute("name","freemarker");
         //封装数据
         Map<String,Object> resultMap = new HashMap<>();
         //写出文件
         try {
             //获取模板文件
             Template template = configuration.getTemplate("freemarker003.ftl");
             //写出文件
             FileWriter fileWriter = new FileWriter(new File("pages/freemarker003.html"));
             //开始写出文件
             template.process(model,fileWriter);
         }catch (Exception e){
             System.out.println("写出文件出错!"+e+":"+e.getMessage());
         }
         return "freemarker003";
     }

    @RequestMapping("/freemarker004")
    public String freemarker004(Model model){
        //声明模板类型
        model.addAttribute("name","freemarker");
        //封装返回数据
        Map<String,Object> resultMap = new HashMap<>();
        //写出文件
        try {
            //获取文件模板
            Template template = configuration.getTemplate("freemarker004.ftl");
            //获取输出流
            FileWriter fileWriter = new FileWriter(new File("pages/freemarker004.html"));
            //输出文件
            template.process(model,fileWriter);
        }catch (Exception e){
            System.out.println("输出文件出错！"+e+":"+e.getMessage());
        }
        return "freemarker004";
     }

}
