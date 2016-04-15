package com.wang.controller;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.wang.entity.Department;
import com.wang.entity.Employee;
import com.wang.repository.DepartmentRepository;
import com.wang.repository.EmployeeRepository;

@Controller
public class MainController {	
	@Autowired
    private EmployeeRepository employeeRepository;
	
	@Autowired
    private DepartmentRepository departmentRepository;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
    public String index() {
        return "login";
    }
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login() {
        return "login";
    }
	
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
    public String loginPost(@ModelAttribute("employee") Employee employee, ModelMap modelMap) {
		// 找到employee表里的所有记录
        List<Employee> employeeList = employeeRepository.findAll();
        //查找employeeList表中相应的employee
        for(Employee em : employeeList) {
        	if(employee.getName().equals(em.getName()) && employee.getPwd().equals(em.getPwd())) {
        		// 将所有记录传递给返回的jsp页面
    	        modelMap.addAttribute("employeeList", employeeList);	         
    	        // 返回 pages 目录下的 employeeManage.jsp 页面
    	        return "employeeManage";
        	}
        }
        return "loginFailed";
	}
	
	@RequestMapping(value = "/employees", method = RequestMethod.GET)
	 public String employees(ModelMap modelMap) {
        // 找到employee表里的所有记录
        List<Employee> employeeList = employeeRepository.findAll();
        // 将所有记录传递给返回的jsp页面
        modelMap.addAttribute("employeeList", employeeList);	         
        // 返回 pages 目录下的 employeeManage.jsp 页面
        return "employeeManage";
    }
	
	// 添加用户 页面
	@RequestMapping(value = "/addEmployee", method = RequestMethod.GET)
	public String addEmployee() {
	    return "addEmployee";
	}
	// 添加用户 处理
	@RequestMapping(value = "/addEmployeePost", method = RequestMethod.POST)
	public String addEmployeePost(@ModelAttribute("employee") Employee employee) {     
		// 数据库中添加一个用户，并立即刷新
	    employeeRepository.saveAndFlush(employee);
	    // 返回重定向 到 /employees 请求
	    return "redirect:/employees";
	}
	
	// 查看用户详情
	// @PathVariable可以收集url中的变量，需匹配的变量用{}括起来
	// 例如：访问 localhost:8080/showEmployee/1 ，将匹配 employeeId = 1
	@RequestMapping(value = "/showEmployee/{employeeId}", method = RequestMethod.GET)
	public String showEmployee(@PathVariable("employeeId") Integer employeeId, ModelMap modelMap) {
	    // 找到employeeId所表示的用户
	    Employee employee = employeeRepository.findOne(employeeId);
	    // 找到employeeId所表示的用户的部门
	    Department department = departmentRepository.findOne(employee.getDepartment().getId());
	    // 传递给请求页面
	    modelMap.addAttribute("employee", employee);
	    modelMap.addAttribute("department", department);
	    return "employeeDetail";
	}
	
	// 更新用户信息 页面
	@RequestMapping(value = "/updateEmployee/{employeeId}", method = RequestMethod.GET)
	public String updateEmployee(@PathVariable("employeeId") Integer employeeId, ModelMap modelMap) { 
	    // 找到employeeId所表示的用户
	    Employee employee = employeeRepository.findOne(employeeId); 
	    // 传递给请求页面
	    modelMap.addAttribute("employee", employee);
	    return "updateEmployee";
	}
	 
	// 更新用户信息 操作
	@RequestMapping(value = "/updateEmployeePost", method = RequestMethod.POST)
	public String updateEmployeePost(@ModelAttribute("employee") Employee employee) {
	    // 更新用户信息
	    employeeRepository.updateEmployee(employee.getName(), employee.getPwd(), employee.getEmail(), employee.getSalary(), employee.getDepartment().getId(), employee.getHireDate(), employee.getId());
	    return "redirect:/employees";
	}
	
	// 删除用户
	@RequestMapping(value = "/deleteEmployee/{employeeId}", method = RequestMethod.GET)
	public String deleteEmployee(@PathVariable("employeeId") Integer employeeId) {    
	    // 删除id为employeeId的用户
	    employeeRepository.delete(employeeId);
	    // 立即刷新
	    employeeRepository.flush();
	    return "redirect:/employees";
	}

}
