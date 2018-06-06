package com.crm.dao;

import com.crm.bean.*;
import com.crm.entity.Modules;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface ModuleMapper {
    /**
     * 根据角色名称查询模块
     * @param roleNames 角色名称字符串 多个角色名称用逗号( , )分隔
     * @return  模块集合
     */
    List<Modules> queryModuleByRoleNames(@Param("roleNames") String roleNames);

    /**
     * 查询所有模块
     * @return  模块集合
     */
    List<ModulesChecked> queryModuleAll();

    /**
     * 查询所有模块树
     * @return  模块集合
     */
    List<ModulesCheckedTreeChe> queryModuleAllTreeChe();


    /**
     * 按照树形查询模块集合
     * @return  模块树集合
     */
    List<ModulesTree> queryModuleAllTree();

    /**
     * 按照树形查询模块集合
     * @return  模块树集合
     */
    List<ModulesTree> queryModuleAllTreePaging(@Param("offsex") int offsex,@Param("rows") int rows);

    /**
     * 获取按照树形查询模块集合的总条数
     * @return 总条数
     */
    int queryModuleAllTreePagingColumns();
    /**
     * 新增模块
     * @param modules 模块实体类
     * @return  受影响的行数
     */
    int addModule(Modules modules);

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
    int updateModule(Modules module);

    /**
     * 根据模块parentId查询同级模块
     * @param parentId  父级id
     * @return  模块集合
     */
    List<Modules> queryModules(@Param("parentId") long parentId);

    /**
     * 删除单个模块
     * @param moduleId  模块id
     * @return  受影响的行数
     */
    int deleteModules(@Param("moduleId") long moduleId);

    /**
     * 删除父级模块为指定模块id
     * @param moduleId  模块id
     * @return  受影响的行数
     */
    int deleteModuleParentId(@Param("moduleId") long moduleId);

    /**
     * 按照名称查询模块
     * @param moduleName  模块名称
     * @return  符合条件的模块集合
     */
    List<ModulesTree> queryModulesByName(@Param("moduleName") String moduleName,@Param("offsex") int offsex,@Param("rows") int rows);

    /**
     * 查询上一个带 SQL_CALC_FOUND_ROWS 的不带limit返回的总数
     * @return  总数
     */
    int queryModuleCount();

    /**
     * 根据模块parentId查询同级模块
     * @param parentId  父级id
     * @return  模块集合
     */
    List<ModulesTree> queryModulesByParentId(@Param("parentId") long parentId);


    /**
     * 根据模块名称查询所有模块
     * @param moduleName   模块名称
     * @return  模块集合
     */
    List<Modules> queryModulesByModuleAll(@Param("moduleName") String moduleName);

    /**
     * 根据模块id查询模块
     * @param id 模块id
     * @return  模块对象
     */
    Modules getModuleByid(@Param("id") long id);

    /**
     * 根据最高级模块id 封装成图表树形图
     * @param topId  最高级模块
     * @return  图表树形图实体
     */
    ChartTree getChartTreeRouteByTopId(@Param("topId") long topId);
}
