package com.crm.service.impl;

import com.crm.bean.*;
import com.crm.dao.ModuleMapper;
import com.crm.entity.Modules;
import com.crm.service.ModuleService;
import com.crm.service.RecyclingService;
import com.crm.util.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Service
public class ModuleServiceImpl implements ModuleService {
    @Autowired(required = false)
    private ModuleMapper moduleMapper;
    @Autowired
    private RecyclingService recyclingService;

    @Override
    public List<Modules> queryModuleByRoleNames(String roleNames) {
        return moduleMapper.queryModuleByRoleNames(roleNames);
    }


    @Override
    public List<ModulesTree> queryModuleAllTree() {
        return moduleMapper.queryModuleAllTree();
    }

    @Override
    public Result addModule(Modules modules) {

        List<Modules> modulesList=queryModules(modules.getParentId());
        List<String> moduleNames=modulesList.stream().map(Modules::getName).collect(Collectors.toList());
        if(moduleNames.contains(modules.getName()))
            return new Result(false,"父级模块下已有重名模块");
        int row=moduleMapper.addModule(modules);
        return new Result(row>0);
    }

    @Override
    public List<ModulesCasscadeTree> getModulesTreeCascade() {
        return moduleMapper.getModulesTreeCascade();
    }

    @Override
    public Result updateModule(Modules module) {
        List<Modules> modulesList=queryModules(module.getParentId());
        List<String> moduleNames=modulesList.stream().map(Modules::getName).collect(Collectors.toList());
        if(moduleNames.contains(module.getName()))
            return new Result(false,"父级模块下已有重名模块");
        return new Result(moduleMapper.updateModule(module)>0);
    }

    @Override
    public List<Modules> queryModules(long parentId) {
        return moduleMapper.queryModules(parentId);
    }

    @Override
    @Transactional
    public Result deleteModules(long moduleId) {
        List<Modules> modules=queryModulesByParentIdNoTree(moduleId);
        List<Long> modusIds=modules.stream().map(Modules::getId).collect(Collectors.toList());
      //  deleteModulesRecursion(modusIds);
        try {
            Modules m=getModuleByid(moduleId);
            String uuid=recyclingService.addRecycling("modules",moduleId+"",m.getName());
            Modules mo=new Modules();
            mo.setName(uuid);
            mo.setWeight(-1);
            mo.setId(moduleId);
            updateModule(mo);
            return new Result(true);
        }catch (Exception e){
            return new Result(false);
        }
    }

    @Override
    @Transactional
    public Result deleteModulesD(long moduleId) {
        List<Modules> modules=queryModulesByParentIdNoTree(moduleId);
        List<Long> modusIds=modules.stream().map(Modules::getId).collect(Collectors.toList());
        deleteModulesRecursion(modusIds);
        return new Result(deleteModulesSingle(moduleId)>0);
    }

    @Transactional
    public void deleteModulesRecursion(List<Long> modulesId){
        for (Long mId:modulesId) {
            List<Modules> modules=queryModulesByParentIdNoTree(mId);
            List<Long> modusIds=modules.stream().map(Modules::getId).collect(Collectors.toList());
            deleteModulesRecursion(modusIds);
            deleteModulesSingle(mId);
        }
    }
    @Override
    @Transactional
    @Deprecated
    public int deleteModuleParentId(long moduleId) {
        return moduleMapper.deleteModuleParentId(moduleId);
    }
    @Override
    public int deleteModulesSingle(long moduleId) {
        return moduleMapper.deleteModules(moduleId);
    }
    @Override
    public List<ModulesTree> queryModuleAllTreePaging(int offsex, int rows) {
        return moduleMapper.queryModuleAllTreePaging(offsex,rows);
    }

    @Override
    public Map queryModuleByModuleNamePaging(String moduleName, int page, int rows) {
        if(moduleName==null || moduleName.equals("")){
            return modulePaging(page,rows);
        }
        else {
            return modulePagingName(moduleName, page, rows);
        }
    }

    @Override
    public List<Modules> queryModulesByParentIdNoTree(long parentId) {
        return moduleMapper.queryModules(parentId);
    }



    @Override
    public List<Modules> queryModulesByModuleAll(String moduleName) {
        return moduleMapper.queryModulesByModuleAll(moduleName);
    }

    @Override
    public Modules getModuleByid(long id) {
        return moduleMapper.getModuleByid(id);
    }

    @Override
    public ChartTree getChartTreeRoute(long id) {
        long topId=0;
        while (true){
            Modules modules=getModuleByid(id);
            if(modules.getParentId()==0){
                topId=modules.getId();
                break;
            }
            id=modules.getParentId();
        }
        ChartTree chartTree=getChartTreeRouteByTopId(topId);
        return chartTree;
    }

    @Override
    public ChartTree getChartTreeRouteByTopId(long topId) {
        return moduleMapper.getChartTreeRouteByTopId(topId);
    }

    public Map modulePagingName(String moduleName,int page, int rows){
        List<ModulesTree> modulesTrees=moduleMapper.queryModulesByName(moduleName, (page-1)*rows, rows);
        int total=moduleMapper.queryModuleCount();
        moduleSelectChildren(modulesTrees);
        Map map=new HashMap();
        map.put("total",total);
        map.put("rows",modulesTrees);
         return map;
    }
    public void moduleSelectChildren(List<ModulesTree> modulesTrees){
        for (ModulesTree m: modulesTrees) {
            List<ModulesTree> ms=moduleMapper.queryModulesByParentId(m.getId());
            if(ms!=null && ms.size()>0){
                m.setChildren(ms);
                moduleSelectChildren(ms);
            }
        }
    }
    public Map modulePaging(int page, int rows){
        List<ModulesTree> modulesTrees=moduleMapper.queryModuleAllTreePaging((page-1)*rows,rows);
        int total=moduleMapper.queryModuleAllTreePagingColumns();
        Map map=new HashMap();
        map.put("total",total);
        map.put("rows",modulesTrees);
        return map;
    }

    @Override
    public List<ModulesChecked> queryModuleAll(String name) {
        List<ModulesChecked> modulesCheckeds= moduleMapper.queryModuleAll(); //获取全部模块
        List<Modules> modules=queryModuleByRoleNames(name); //获取角色有的模块
        CheckModule2(modulesCheckeds,modules);//选中已有模块
        return modulesCheckeds;
    }
    /**
     * 选中已拥有的模块
     * @param modulesCheckeds   模块集合(带checked属性)
     * @param modules   模块集合
     */
    public static void CheckModule2(List<ModulesChecked> modulesCheckeds,List<Modules> modules){
        for (ModulesChecked modulesChecked:modulesCheckeds) {
            for (Modules module:modules) {
                if(modulesChecked.getId()==module.getId()){
                    modulesChecked.setChecked(true);
                }
            }
        }
    }

    @Override
    public List<ModulesCheckedTreeChe> queryModuleAllChe(String name) {
        List<ModulesCheckedTreeChe> modulesCheckeds= moduleMapper.queryModuleAllTreeChe(); //获取全部模块
        List<Modules> modules=queryModuleByRoleNames(name); //获取角色有的模块
        CheckModule(modulesCheckeds,modules);//选中已有模块
        return modulesCheckeds;
    }

    /**
     * 选中已拥有的模块
     * @param modulesCheckeds   模块集合(带checked属性)
     * @param modules   模块集合
     */
    public static void CheckModule(List<ModulesCheckedTreeChe> modulesCheckeds,List<Modules> modules){
        for (ModulesCheckedTreeChe modulesChecked:modulesCheckeds) {
            for (Modules module:modules) {
                if(modulesChecked.getChildren()==null || modulesChecked.getChildren().size()==0){
                    if(modulesChecked.getId()==module.getId())
                        modulesChecked.setChecked(true);
                }else{
                    CheckModule(modulesChecked.getChildren(),modules);
                }
            }
        }
    }

}
