package com.init.resume.main.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.core.JsonGenerationException;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.init.resume.main.service.CareerService;
import com.init.resume.main.vo.CareerVO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class CareerController {
    
    
    int resultValue = 0;
    private CareerService careerService = null;

    @Autowired
    public void setCareerService(CareerService careerService) {
    this.careerService = careerService;
    }

    
    @RequestMapping(value = "{id}/detail/CareerList", method = RequestMethod.POST, produces = "application/text; charset=UTF-8")
    public @ResponseBody String getCareerList(
    HttpServletRequest request,HttpServletResponse response,
            @PathVariable String id,
            @RequestParam boolean _search,
            @RequestParam long     nd,
            @RequestParam int       rows,
            @RequestParam int       page,
            @RequestParam String   sidx,
            @RequestParam String   sord
    ) throws JsonGenerationException, JsonMappingException,IOException {

    HashMap<String,Object> params = new HashMap<String,Object>();
    int start =  ((page - 1) * rows ) + 1;
    int limit = (start + rows) -1;
    
    System.err.println("start = " + start + " : limit = " + limit);
    params.put("start", start );
    params.put("limit", limit);
    params.put("info_id", id);

    List<CareerVO> CareerList = careerService.getAllCareer(params);
    
    String value = "";
    
    if(!CareerList.isEmpty()){
    ObjectMapper mapper = new ObjectMapper();

    Map<String, Object> modelMap = new HashMap<String, Object>();
    
    double total = (double) CareerList.get(0).getTotcnt() / rows;
    modelMap.put("total",(int) Math.ceil(total));
    modelMap.put("records", CareerList.get(0).getTotcnt());
    modelMap.put("rows", CareerList);
    modelMap.put("page", page);

    value = mapper.writeValueAsString(modelMap);
    }
    
    System.out.println(value);
    return value;
    }

    @RequestMapping (value="detail/CareerEdit",method=RequestMethod.POST)
    public String CareerEdit (CareerVO career,@RequestParam Map<String,Object> param) throws Exception{


        String oper = (String) param.get("oper");
        int id = Integer.parseInt(String.valueOf(param.get("id")));
        
    if (oper.equals("edit")){
        String date = (String) param.get("date");
        String[] arraydate = date.split("~");
        career.setStart_date(arraydate[0].trim());
        career.setEnd_date(arraydate[1].trim());
        career.setCareer_id(id);
        resultValue =  careerService.updateCareer(career);
    } else if (oper.equals("del")){
        career.setCareer_id(id);
        resultValue =   careerService.deleteCareer(career);
    } else if (oper.equals("add")){
        String date = (String) param.get("date");
        String[] arraydate = date.split("~");
        career.setStart_date(arraydate[0].trim());
        career.setEnd_date(arraydate[1].trim());
        resultValue =   careerService.saveCareer(career);
    }
    return "resume/detail";
    }

    @RequestMapping (value="detail/CareerAdd",method=RequestMethod.POST)
    public String CareerSave (CareerVO career) throws Exception{

        System.err.println(
            career.getCareer_id() + ":" +
            career.getProject_name()+ ":" +
            career.getEnd_date()+ ":" +
            career.getInfo_id()+ ":" +
            career.getStart_date()+ ":" +
            career.getTask());

            resultValue =   careerService.saveCareer(career);

        return "resume/detail";
    }

    @RequestMapping (value="detail/CareerUpdate",method=RequestMethod.POST)
    public String CareerEdit (CareerVO career) throws Exception{


            resultValue =  careerService.updateCareer(career);

        return "resume/detail";
    }

//     @RequestMapping(value="detail/CareerDel", method = RequestMethod.POST, produces="application/json;charset=utf-8")
// 	public String CareerDelete (@RequestParam Map<String,Object> param) throws Exception {
// 		Career career = new Career();

        
//         String id = (String)param.get("id");
//         career.setCareer_id(id);
        
// 		resultValue =   careerService.deleteCareer(career);

        
//         return "index";
// }
}
