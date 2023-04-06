<!-- 左侧边栏. 包括用户的LOGO以及侧边菜单  -->
<aside class="main-sidebar">
     <!-- 侧边菜单: 样式参考 sidebar.less -->
     <section class="sidebar">
         <!-- 用户信息面板开始 -->
         <div class="user-panel">
            <div class="pull-left image">
              <img src="" class="img-circle" alt="User Image" />
            </div>
            <div class="pull-left info">
              <p></p>
              <a href="#"><i class="fa fa-circle text-success"></i> 在线</a>
            </div>
         </div>
         <!-- 用户信息面板结束  -->
         
         <!-- 快捷功能搜索开始   -->
         <form id="quick-menu-search" action="/program/admin/news" method="get" class="sidebar-form">
            <div class="input-group">
               <input type="text" name="re_name" value="" class="form-control" placeholder="搜索资讯..."/>
               <span class="input-group-btn">
                   <a href="javascript:$('#quick-menu-search')[0].submit();" id='search-btn' class="btn btn-flat"><i class="fa fa-search"></i></a>
               </span>
            </div>
         </form>
         <!-- 快捷功能搜索结束   -->
         
         <!-- 侧边菜单: 样式参考 sidebar.less -->
         <ul class="sidebar-menu">
             <li class="header">主菜单</li>
             <!-- 主页 -->
             <li class="<#if sidebar_active == 'index'>active </#if>treeview">
                 <a href="/program/admin/index">
                    <i class="fa fa-dashboard"></i> <span>主页</span>
                 </a>
             </li>
             
             <!-- 新闻资讯 -->
             <li class="<#if sidebar_active == 'news'>active </#if>treeview">
                 <a href="#">
                    <i class="fa fa-files-o"></i>
                    <span>新闻资讯</span>
                    <i class="fa fa-angle-left pull-right"></i>
                 </a>
                 <ul class="treeview-menu">
                     <li class="<#if sidebar2_active == 'news'>active </#if>"><a href="/program/admin/news?type=1"><i class="fa fa-circle-o"></i> 象网新闻</a></li>
                     <li class="<#if sidebar2_active == 'news'>active </#if>"><a href="/program/admin/news?type=2"><i class="fa fa-circle-o"></i> 行业动态</a></li>
                     <li class="<#if sidebar2_active == 'news'>active </#if>"><a href="/program/admin/news?type=3"><i class="fa fa-circle-o"></i> 修车养车</a></li>
                     
                 </ul>
             </li>
             
             <!-- 商家指南 -->
             <li class="<#if sidebar_active == 'trade'>active </#if>treeview">
                 <a href="#">
                    <i class="fa fa-edit"></i>
                    <span>商家指南</span>
                    <i class="fa fa-angle-left pull-right"></i>
                 </a>
                 <ul class="treeview-menu">
                    <li class="<#if sidebar2_active == 'trade'>active </#if>"><a href="#"><i class="fa fa-circle-o"></i> 入驻指南</a></li>
                 </ul>
             </li>
             
             <!-- 问卷调查  -->
             <li class="<#if sidebar_active == 'member'>active </#if>treeview">
                 <a href="#">
                    <i class="fa fa-table"></i>
                    <span>问卷调查 </span>
                    <i class="fa fa-angle-left pull-right"></i>
                 </a>
                 <ul class="treeview-menu">
                    <li class="<#if sidebar2_active == 'info'>active </#if>"><a href="#"><i class="fa fa-circle-o"></i> 车主调查</a></li>
                    <li><a href="#" style="display: none;"><i class="fa fa-circle-o"></i> 商家调查</a></li>
                 </ul>
             </li>
             
            <li class="treeview" style="display: none;">
                <a href="#">
                   <i class="fa fa-laptop"></i>
                   <span>权限设置</span>
                   <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                   <li><a href="#"><i class="fa fa-circle-o"></i> 菜单权限</a></li>
                   <li><a href="#"><i class="fa fa-circle-o"></i> 查看权限</a></li>
                   <li><a href="#"><i class="fa fa-circle-o"></i> 管理权限</a></li>
                   <li><a href="#"><i class="fa fa-circle-o"></i> 订单权限</a></li>
                </ul>
            </li>
            
            <li class="treeview" style="display: none;">
              <a href="#">
                <i class="fa fa-calendar"></i>
                <span>任务定制</span>
                <i class="fa fa-angle-left pull-right"></i>
              </a>
              <ul class="treeview-menu">
                  <li><a href="#"><i class="fa fa-circle-o"></i> 备份任务</a></li>
                  <li><a href="#"><i class="fa fa-circle-o"></i> 清空任务</a></li>
              </ul>
            </li>
            
            <!--
            <li class="treeview">
              <a href="/program/admin/mail">
                <i class="fa fa-envelope"></i> <span>我的信箱</span>
                <small class="label pull-right bg-yellow">12</small>
              </a>
            </li>
            -->
            <li class="<#if sidebar_active == 'sys'>active </#if>treeview">
                <a href="documentation/index.html">
                   <i class="fa fa-book"></i>
                   <span>系统设置</span>
                   <i class="fa fa-angle-left pull-right"></i>
                </a>
                <ul class="treeview-menu">
                    <li class="<#if sidebar2_active == 'clear_cache'>active </#if>"><a href="/program/admin/clear_cache"><i class="fa fa-circle-o"></i> 清空缓存</a></li>
                    
                </ul>
            </li>
            <li class="header">其他</li>
            <li class="<#if sidebar_active == 'version'>active </#if>treeview"><a href="/program/admin/version"><i class="fa fa-circle-o text-info"></i> 版本跟踪</a></li>
            <li class="<#if sidebar_active == 'operation'>active </#if>treeview"><a href="#"><i class="fa fa-circle-o text-info"></i> 操作指南</a></li>
          </ul>
        </section>
        
</aside>
<!-- 左侧边栏结束   -->