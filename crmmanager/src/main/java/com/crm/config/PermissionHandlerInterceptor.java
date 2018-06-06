package com.crm.config;

import com.crm.annotation.PermissionMethod;
import com.crm.annotation.PermissionType;
import com.crm.dao.LogginPermissionMapper;
import com.crm.entity.LogginPermission;
import com.crm.entity.Permission;
import com.crm.service.LogginPermissionService;
import com.crm.service.PermissionService;
import com.crm.util.Result;
import org.springframework.beans.factory.BeanFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.support.WebApplicationContextUtils;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;
import org.thymeleaf.util.StringUtils;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Map;
import java.util.UUID;

/**
 * 权限拦截器
 */
public class PermissionHandlerInterceptor implements HandlerInterceptor {
    private LogginPermissionService logginPermissionService;
    public PermissionHandlerInterceptor(LogginPermissionService logginPermissionService){
        this.logginPermissionService =logginPermissionService;

    }
    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        if(!(handler instanceof HandlerMethod)) //判断是否访问的是方法
            return true;

        HandlerMethod handlerMethod= (HandlerMethod) handler;
        PermissionMethod permissionMethod=handlerMethod.getMethodAnnotation(PermissionMethod.class);
        Class clazzType=handlerMethod.getBeanType();
        PermissionType permissionType= (PermissionType) clazzType.getAnnotation(PermissionType.class);
        if(permissionMethod==null)
            return true;
        //获取存的角色
        LogginPermission logginPermission=new LogginPermission();
        HttpSession session=request.getSession();
        Object obj= session.getAttribute("userInfo");
        response.setCharacterEncoding("utf-8");
        //如果是空就是未登录
        if(obj==null){
            logginPermission.setId(UUID.randomUUID().toString());
            logginPermission.setIsSuccess("否");
            logginPermission.setComment(permissionType.moduleName()+"--"+permissionMethod.permissionName());
            logginPermission.setString0("请先登录");
            logginPermissionService.addLogginPermission(logginPermission);
            response.getWriter().print(new Result(false,"请先登录").toJson());
            response.setStatus(500);
            return false;
        }
        Map map=(Map) obj;
        List<String> roles= (List<String>) map.get("roleNames");
        if(roles.contains("管理员")){ //管理员有所有权限
            logginPermission.setId(UUID.randomUUID().toString());
            logginPermission.setIsSuccess("是");
            logginPermission.setUserid((String) map.get("uid"));
            logginPermission.setComment(permissionType.moduleName()+"--"+permissionMethod.permissionName());
            logginPermissionService.addLogginPermission(logginPermission);
            return true;
        }
        if(roles.size()==0){
            logginPermission.setId(UUID.randomUUID().toString());
            logginPermission.setIsSuccess("否");
            logginPermission.setUserid((String) map.get("uid"));
            logginPermission.setComment(permissionType.moduleName()+"--"+permissionMethod.permissionName());
            logginPermission.setString0("你没有权限操作");
            logginPermissionService.addLogginPermission(logginPermission);
            response.getWriter().print(new Result(false,"你没有权限操作",permissionMethod.value()).toJson());
            response.setStatus(500);
            return false;
        }
        //获取service
        BeanFactory factory = WebApplicationContextUtils.getRequiredWebApplicationContext(request.getServletContext());
        PermissionService permissionService=factory.getBean(PermissionService.class);
        String value2=permissionMethod.value();

        String value1=permissionType.value();
        String value=value1+":"+value2; //当前方法的权限value
        //获取角色中所有的权限
        String roleNames=StringUtils.join(roles.toArray(),",");

        List<Permission> permissions=permissionService.queryPermissionByRoleName(roleNames);
        if(permissions.size()==0){
            logginPermission.setId(UUID.randomUUID().toString());
            logginPermission.setIsSuccess("否");
            logginPermission.setUserid((String) map.get("uid"));
            logginPermission.setComment(permissionType.moduleName()+"--"+permissionMethod.permissionName());
            logginPermission.setString0("你没有权限操作");
            logginPermissionService.addLogginPermission(logginPermission);
            response.getWriter().print(new Result(false,"你没有权限操作",permissionMethod.value()).toJson());
            response.setStatus(500);
            return false;
        }
        for (Permission permission:permissions) {
            String permissionValue=permission.getPermissionValue();
            if(permissionValue.equals(value)){
                logginPermission.setId(UUID.randomUUID().toString());
                logginPermission.setIsSuccess("是");
                logginPermission.setUserid((String) map.get("uid"));
                logginPermission.setComment(permissionType.moduleName()+"--"+permissionMethod.permissionName());
                logginPermissionService.addLogginPermission(logginPermission);
                return true;
            }
        }
        logginPermission.setId(UUID.randomUUID().toString());
        logginPermission.setIsSuccess("否");
        logginPermission.setUserid((String) map.get("uid"));
        logginPermission.setComment(permissionType.moduleName()+"--"+permissionMethod.permissionName());
        logginPermission.setString0("你没有权限操作");
        logginPermissionService.addLogginPermission(logginPermission);
        response.getWriter().print(new Result(false,"你没有权限操作",permissionMethod.value()).toJson());
        response.setStatus(500);
        return false;
    }

    @Override
    public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {

    }

    @Override
    public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex) throws Exception {
    }

}
