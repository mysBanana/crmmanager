CRM系统:
    前端:
        html+js+vue+iview+buttons+v-chart
    后端:
        springboot+mybatis
    数据库:
        mysql
    开发工具:
        IntelliJ IDEA 2017
    各个包的作用
        main : 主要文件代码等
            java :java代码
                com.crm.annotation:注释类
                com.crm.bean:查询显示其他所用实体类
                com.crm.config:配置类,拦截器
                com.crm.controller:控制器
                com.crm.dao:mybatis操作数据库基础方法
                com.crm.entity:数据库实体类
                com.crm.enums:枚举
                com.crm.gwz.crmmanager:程序入口
                com.crm.server:webSocket包
                com.crm.service:业务接口层
                com.crm.service.impl:业务实现层
                com.crm.util:工具类
            resources:资源
                :static静态文件
                    js:js文件
                    css:css文件
                templates:网页包
                application.properties:项目配置文件
                readMe.txt:项目介绍
                remark.txt:备忘
                sister.sql 数据库脚本
        test :  测试文件代码等与main包相同 不做解释
