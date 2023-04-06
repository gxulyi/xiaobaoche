<!-- 信息栏: style can be found in dropdown.less-->
<li class="dropdown messages-menu">
    <!-- 消息数目提醒 -->
    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
       <i class="fa fa-envelope-o"></i>
       <span class="label label-success"><#if lte_messages?exists>${lte_messages?size}</#if></span>
    </a>
    <!-- 消息数目提醒结束 -->
    
    <!-- 信息列表-->
    <ul class="dropdown-menu">
        <li class="header">您有  <#if lte_messages?exists>${lte_messages?size}<#else>0</#if> 条信息</li>
        <#if lte_messages?exists>
        <li>
           <!-- 信息容器: contains the actual data -->
           <ul class="menu">
               <#list lte_messages as msg>
               <!-- 消息体开始 -->
               <li>
                   <a href="${msg.url?if_exists}">
                      <div class="pull-left">
                           <img src="${msg.logo?if_exists}" class="img-circle" alt="${msg.title?if_exists}"/>
                      </div>
                      <h4> ${msg.title?if_exists}
                           <small><i class="fa fa-clock-o"></i>  ${msg.timestamp?if_exists}</small>
                      </h4>
                      <p>消息内容</p>
                   </a>
               </li>
               <!-- 消息体结束 -->
               </#list>
            </ul>
          </li>
          <li class="footer"><a href="${lte_all_msg?if_exists}">查看全部信息</a></li>
      </#if>
  </ul>
</li>
<!-- 信息栏结束  -->