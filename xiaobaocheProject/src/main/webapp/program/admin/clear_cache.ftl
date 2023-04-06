<!DOCTYPE html>
<html class='default' dir='ltr'>
<head>
<#include "header.ftl"/>
</head>

<body class="skin-blue">
    <div class="wrapper">
      <#include "a-header.ftl"/>
      <#include "left-aside.ftl"/>

      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
          <h1>清空缓存
            <small>版本  ${admin_version}</small>
          </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> 主页</a></li>
            <li class="active">清空缓存</li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">
            
        </section><!-- /.content -->
      </div><!-- /.content-wrapper -->

      <#include "p-footer.ftl"/>

    </div><!-- ./wrapper -->
    <#include "footer.ftl"/>
</body>

</html>