<header class="main-header">
    <!-- 企业LOGO -->
    <a href="/" class="logo"><b>${admin_logo_name}</b>管理程序</a>
    <!-- ${admin_logo_name}导航栏开始 -->
    <nav class="navbar navbar-static-top" role="navigation">
          <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">头部栏 触发</span>
          </a>
          <!-- 右部菜单开始  -->
          <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
              <#include "a-message.ftl"/>
              <#include "a-notifications.ftl"/>
              <!-- 放弃task任务 a-task.ftl -->
              <#include "a-user.ftl"/>
            </ul>
          </div>
          <!-- 右部菜单结束  -->
    </nav>
    <!-- ${admin_logo_name}导航栏结束-->
</header>