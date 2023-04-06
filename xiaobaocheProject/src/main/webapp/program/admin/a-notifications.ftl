<!-- Notifications: style can be found in dropdown.less -->
<li class="dropdown notifications-menu">
    <a href="#" class="dropdown-toggle" data-toggle="dropdown">
       <i class="fa fa-bell-o"></i>
          <span class="label label-warning"><#if lte_notifications?exists>${lte_notifications?size}</#if></span>
    </a>
    <#if lte_notifications?exists>
    <ul class="dropdown-menu">
        <li class="header">您有  ${lte_notifications?size} 条通知</li>
        <li>
            <!-- inner menu: contains the actual data -->
            <ul class="menu">
                <#list lte_notifications as notif>
                <li>
                    <a href="${notif.url?if_exists}">
                         <i class="fa ${notif.logo?if_exists}"></i>${notif.content?if_exists}
                    </a>
                </li>
                </#list>
             </ul>
        </li>
        <li class="footer"><a href="${lte_all_notifications?if_exists}">查看全部</a></li>
    </ul>
    </#if>
 </li>