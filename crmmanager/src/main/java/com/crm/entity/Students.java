package com.crm.entity;


import com.crm.annotation.ExcelField;
import com.crm.annotation.PrimaryField;
import com.crm.config.CustomDateSerializer;
import com.crm.enums.PrimaryKeyEnum;
import com.fasterxml.jackson.annotation.JsonFormat;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

@JsonIgnoreProperties(ignoreUnknown = true)
public class Students {
  @ExcelField(value = "标识",showDisplay = true)
  @PrimaryField(identification = PrimaryKeyEnum.autoIncrease)
  private long id;
  @ExcelField(value = "姓名",notNull = true)
  private String name;
  @ExcelField(value = "年龄")
  private long age;
  @ExcelField(value = "性别")
  private String sex;
  @ExcelField(value = "手机号")
  private String phone;
  @ExcelField(value = "学历")
  private String stuStatus;
  @ExcelField(value = "个人状态")
  private String perState;
  @ExcelField(value = "来源渠道")
  private String msgSource;
  @ExcelField(value = "来源网址")
  private String sourceUrl;
  @ExcelField(value = "来源关键词")
  private String sourceKeyWord;
  @ExcelField(value = "所在区域")
  private String address;
  @ExcelField(value = "网络咨询id",templaletDisplay = true,showDisplay = true)
  private String netPusherId;
  @ExcelField(value = "咨询师id",templaletDisplay = true,showDisplay = true)
  private String askerId;
  @ExcelField(value = "qq")
  private String qq;

  @ExcelField(value = "微信")
  private String weiXin;

  @ExcelField(value = "备注")
  private String content;

  @JsonSerialize(using=CustomDateSerializer.class)
  @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
  @ExcelField(value = "创建时间",templaletDisplay = true)
  private java.sql.Timestamp createTime;
  @ExcelField(value = "课程方向")
  private String learnForward;
  @ExcelField(value = "是否有效")
  private String isValid;
  @ExcelField(value = "打分")
  private String record;
  @ExcelField(value = "是否回访")
  private String isReturnVist;
  @ExcelField(showDisplay = true,templaletDisplay = true)
  private String askerName;
  @JsonSerialize(using=CustomDateSerializer.class)
  @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
  @ExcelField(value = "首次回访时间")
  private java.sql.Timestamp firstVisitTime;
  @ExcelField(value = "是否上门")
  private String isHome;
  @JsonSerialize(using=CustomDateSerializer.class)
  @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
  @ExcelField(value = "上门时间")
  private java.sql.Timestamp homeTime;
  @ExcelField(value = "无效原因")
  private String lostValid;
  @ExcelField(value = "是否付款")
  private String isPay;
  @JsonSerialize(using=CustomDateSerializer.class)
  @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
  @ExcelField(value = "付款时间")
  private java.sql.Timestamp payTime;
  @ExcelField(value = "付款金额")
  private double money;
  @ExcelField(value = "是否退费")
  private String isReturnMoney;
  @ExcelField(value = "是否进班")
  private String isInClass;
  @JsonSerialize(using=CustomDateSerializer.class)
  @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
  @ExcelField(value = "进班时间")
  private java.sql.Timestamp inClassTime;
  @ExcelField(value = "进班备注")
  private String inClassContent;
  @ExcelField(value = "咨询师备注")
  private String askerContent;
  @ExcelField(value = "是否删除")
  private String isDel;
  @ExcelField(value = "来源部门")
  private String fromPart;
  @ExcelField(value = "学员关注")
  private String stuConcern;
  @ExcelField(value = "是否报备")
  private String isBaoBei;
  @ExcelField(value = "咨询师填写的姓名")
  private String ziXunName;
  @ExcelField(value = "录入人姓名")
  private String createUser;
  @ExcelField(value = "退费原因")
  private String returnMoneyReason;
  @ExcelField(value = "预付定金")
  private double preMoney;
  @JsonSerialize(using=CustomDateSerializer.class)
  @JsonFormat(locale="zh", timezone="GMT+8", pattern="yyyy-MM-dd HH:mm:ss")
  @ExcelField(value = "预付定金时间")
  private java.sql.Timestamp preMoneyTime;


  public String getAskerName() {
    return askerName;
  }

  public void setAskerName(String askerName) {
    this.askerName = askerName;
  }


  public long getId() {
    return id;
  }

  public void setId(long id) {
    this.id = id;
  }


  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }


  public long getAge() {
    return age;
  }

  public void setAge(long age) {
    this.age = age;
  }


  public String getSex() {
    return sex;
  }

  public void setSex(String sex) {
    this.sex = sex;
  }


  public String getPhone() {
    return phone;
  }

  public void setPhone(String phone) {
    this.phone = phone;
  }


  public String getStuStatus() {
    return stuStatus;
  }

  public void setStuStatus(String stuStatus) {
    this.stuStatus = stuStatus;
  }


  public String getPerState() {
    return perState;
  }

  public void setPerState(String perState) {
    this.perState = perState;
  }


  public String getMsgSource() {
    return msgSource;
  }

  public void setMsgSource(String msgSource) {
    this.msgSource = msgSource;
  }


  public String getSourceUrl() {
    return sourceUrl;
  }

  public void setSourceUrl(String sourceUrl) {
    this.sourceUrl = sourceUrl;
  }


  public String getSourceKeyWord() {
    return sourceKeyWord;
  }

  public void setSourceKeyWord(String sourceKeyWord) {
    this.sourceKeyWord = sourceKeyWord;
  }


  public String getAddress() {
    return address;
  }

  public void setAddress(String address) {
    this.address = address;
  }


  public String getNetPusherId() {
    return netPusherId;
  }

  public void setNetPusherId(String netPusherId) {
    this.netPusherId = netPusherId;
  }


  public String getAskerId() {
    return askerId;
  }

  public void setAskerId(String askerId) {
    this.askerId = askerId;
  }


  public String getQq() {
    return qq;
  }

  public void setQq(String qq) {
    this.qq = qq;
  }


  public String getWeiXin() {
    return weiXin;
  }

  public void setWeiXin(String weiXin) {
    this.weiXin = weiXin;
  }


  public String getContent() {
    return content;
  }

  public void setContent(String content) {
    this.content = content;
  }


  public java.sql.Timestamp getCreateTime() {
    return createTime;
  }

  public void setCreateTime(java.sql.Timestamp createTime) {
    this.createTime = createTime;
  }


  public String getLearnForward() {
    return learnForward;
  }

  public void setLearnForward(String learnForward) {
    this.learnForward = learnForward;
  }


  public String getIsValid() {
    return isValid;
  }

  public void setIsValid(String isValid) {
    this.isValid = isValid;
  }


  public String getRecord() {
    return record;
  }

  public void setRecord(String record) {
    this.record = record;
  }


  public String getIsReturnVist() {
    return isReturnVist;
  }

  public void setIsReturnVist(String isReturnVist) {
    this.isReturnVist = isReturnVist;
  }


  public java.sql.Timestamp getFirstVisitTime() {
    return firstVisitTime;
  }

  public void setFirstVisitTime(java.sql.Timestamp firstVisitTime) {
    this.firstVisitTime = firstVisitTime;
  }


  public String getIsHome() {
    return isHome;
  }

  public void setIsHome(String isHome) {
    this.isHome = isHome;
  }


  public java.sql.Timestamp getHomeTime() {
    return homeTime;
  }

  public void setHomeTime(java.sql.Timestamp homeTime) {
    this.homeTime = homeTime;
  }


  public String getLostValid() {
    return lostValid;
  }

  public void setLostValid(String lostValid) {
    this.lostValid = lostValid;
  }


  public String getIsPay() {
    return isPay;
  }

  public void setIsPay(String isPay) {
    this.isPay = isPay;
  }


  public java.sql.Timestamp getPayTime() {
    return payTime;
  }

  public void setPayTime(java.sql.Timestamp payTime) {
    this.payTime = payTime;
  }


  public double getMoney() {
    return money;
  }

  public void setMoney(double money) {
    this.money = money;
  }


  public String getIsReturnMoney() {
    return isReturnMoney;
  }

  public void setIsReturnMoney(String isReturnMoney) {
    this.isReturnMoney = isReturnMoney;
  }


  public String getIsInClass() {
    return isInClass;
  }

  public void setIsInClass(String isInClass) {
    this.isInClass = isInClass;
  }


  public java.sql.Timestamp getInClassTime() {
    return inClassTime;
  }

  public void setInClassTime(java.sql.Timestamp inClassTime) {
    this.inClassTime = inClassTime;
  }


  public String getInClassContent() {
    return inClassContent;
  }

  public void setInClassContent(String inClassContent) {
    this.inClassContent = inClassContent;
  }


  public String getAskerContent() {
    return askerContent;
  }

  public void setAskerContent(String askerContent) {
    this.askerContent = askerContent;
  }


  public String getIsDel() {
    return isDel;
  }

  public void setIsDel(String isDel) {
    this.isDel = isDel;
  }


  public String getFromPart() {
    return fromPart;
  }

  public void setFromPart(String fromPart) {
    this.fromPart = fromPart;
  }


  public String getStuConcern() {
    return stuConcern;
  }

  public void setStuConcern(String stuConcern) {
    this.stuConcern = stuConcern;
  }


  public String getIsBaoBei() {
    return isBaoBei;
  }

  public void setIsBaoBei(String isBaoBei) {
    this.isBaoBei = isBaoBei;
  }


  public String getZiXunName() {
    return ziXunName;
  }

  public void setZiXunName(String ziXunName) {
    this.ziXunName = ziXunName;
  }


  public String getCreateUser() {
    return createUser;
  }

  public void setCreateUser(String createUser) {
    this.createUser = createUser;
  }


  public String getReturnMoneyReason() {
    return returnMoneyReason;
  }

  public void setReturnMoneyReason(String returnMoneyReason) {
    this.returnMoneyReason = returnMoneyReason;
  }


  public double getPreMoney() {
    return preMoney;
  }

  public void setPreMoney(double preMoney) {
    this.preMoney = preMoney;
  }


  public java.sql.Timestamp getPreMoneyTime() {
    return preMoneyTime;
  }

  public void setPreMoneyTime(java.sql.Timestamp preMoneyTime) {
    this.preMoneyTime = preMoneyTime;
  }

  @Override
  public String toString() {
    return "Students{" +
            "id=" + id +
            ", name='" + name + '\'' +
            ", age=" + age +
            ", sex='" + sex + '\'' +
            ", phone='" + phone + '\'' +
            ", stuStatus='" + stuStatus + '\'' +
            ", perState='" + perState + '\'' +
            ", msgSource='" + msgSource + '\'' +
            ", sourceUrl='" + sourceUrl + '\'' +
            ", sourceKeyWord='" + sourceKeyWord + '\'' +
            ", address='" + address + '\'' +
            ", netPusherId='" + netPusherId + '\'' +
            ", askerId='" + askerId + '\'' +
            ", qq='" + qq + '\'' +
            ", weiXin='" + weiXin + '\'' +
            ", content='" + content + '\'' +
            ", createTime=" + createTime +
            ", learnForward='" + learnForward + '\'' +
            ", isValid='" + isValid + '\'' +
            ", record='" + record + '\'' +
            ", isReturnVist='" + isReturnVist + '\'' +
            ", firstVisitTime=" + firstVisitTime +
            ", isHome='" + isHome + '\'' +
            ", homeTime=" + homeTime +
            ", lostValid='" + lostValid + '\'' +
            ", isPay='" + isPay + '\'' +
            ", payTime=" + payTime +
            ", money=" + money +
            ", isReturnMoney='" + isReturnMoney + '\'' +
            ", isInClass='" + isInClass + '\'' +
            ", inClassTime=" + inClassTime +
            ", inClassContent='" + inClassContent + '\'' +
            ", askerContent='" + askerContent + '\'' +
            ", isDel='" + isDel + '\'' +
            ", fromPart='" + fromPart + '\'' +
            ", stuConcern='" + stuConcern + '\'' +
            ", isBaoBei='" + isBaoBei + '\'' +
            ", ziXunName='" + ziXunName + '\'' +
            ", createUser='" + createUser + '\'' +
            ", returnMoneyReason='" + returnMoneyReason + '\'' +
            ", preMoney=" + preMoney +
            ", preMoneyTime=" + preMoneyTime +
            '}';
  }
}
