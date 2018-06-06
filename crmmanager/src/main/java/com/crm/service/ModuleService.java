package com.crm.service;

import com.crm.bean.*;
import com.crm.entity.Modules;
import com.crm.util.Result;
import org.apache.ibatis.annotations.Param;

import java.util.List;
import java.util.Map;

public interface ModuleService {
    /**
     * 根据角色名称查询模块
     * @param roleNames 角色名称字符串 多个角色名称用逗号( , )分隔
     * @return  模块集合
     */
    List<Modules> queryModuleByRoleNames(String roleNames);
    /**
     * 查询所有模块并且选中已拥有的模块
     * @return  模块集合
     */
    List<ModulesChecked> queryModuleAll(String name);

    /**
     * 查询所有模块并且选中已拥有的模块
     * @return  模块集合
     */
    List<ModulesCheckedTreeChe> queryModuleAllChe(String name);
    /**
     * 按照树形查询模块集合
     * @return  模块树集合
     */
    List<ModulesTree> queryModuleAllTree();

    /**
     * 新增模块
     * @param modules 模块实体类
     * @return 受影响的行数
     */
    Result addModule(Modules modules);

    /**
     * 获取级联模块(id,name,children)
     * @return  获取级联模块
     */
    List<ModulesCasscadeTree> getModulesTreeCascade();

    /**
     * 修改模块
     * @param module 模块对象
     * @return  受影响的行数
     */
    Result updateModule(Modules module);

    /**
     * 根据模块parentId查询同级模块
     * @param parentId  父级id
     * @return  模块集合
     */
    List<Modules> queryModules(long parentId);

    /**
     * 删除模块
     * @param moduleId  模块id
     * @return  受影响的行数
     */
    Result deleteModules(long moduleId);

    /**
     * 删除模块(彻底删除)
     * @param moduleId  模块id
     * @return  受影响的行数
     */
    Result deleteModulesD(long moduleId);
    /**
     * 删除父级模块为指定模块id
     * @param moduleId  模块id
     * @return  受影响的行数
     */
    int deleteModuleParentId(long moduleId);

    /**
     * 按照树形查询模块集合
     * @return  模块树集合
     */
    List<ModulesTree> queryModuleAllTreePaging(int offsex,int rows);

    /**
     * 分页按照模块名称查询
     * @param moduleName 模块名称
     * @param page  当前页数
     * @param rows  条数
     * @return  map total总条数 rows所有实体
     */
    Map queryModuleByModuleNamePaging(String moduleName,int page,int rows);

    /**
     * 根据模块parentId查询同级模块 不是树
     * @param parentId 父级id
     * @return  模块集合
     */
    List<Modules> queryModulesByParentIdNoTree(long parentId);

    /**
     * 删除单个模块
     * @param moduleId  模块id
     * @return  受影响的行数
     */
    int deleteModulesSingle(long moduleId);

    /**
     * 根据模块名称查询所有模块
     * @param moduleName   模块名称
     * @return  模块集合
     */
    List<Modules> queryModulesByModuleAll(String moduleName);

    /**
     * 根据模块id查询模块
     * @param id 模块id
     * @return  模块对象
     */
    Modules getModuleByid(long id);

    /**
     * 根据模块id 查询他的最高级id并封装成图表树形图
     * @param id  模块id
     * @return  图表树形图实体
     */
    ChartTree getChartTreeRoute(long id);

    /**
     * 根据最高级模块id 封装成图表树形图
     * @param topId  最高级模块
     * @return  图表树形图实体
     */
    ChartTree getChartTreeRouteByTopId(long topId);
}
