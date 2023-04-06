<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
			
		<!--Bootstrap 不支持 IE 古老的兼容模式。为了让 IE浏览器运行最新的渲染模式-->
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
			
		<!--为了确保适当的绘制和触屏缩放-->
    	<meta name="viewport" content="width=device-width, initial-scale=1">
    		
		<title>车主调查问卷</title>
		
		<!--Bootstrap 核心 CSS 文件 -->
		<link rel="stylesheet" href="//cdn.bootcss.com/bootstrap/3.3.5/css/bootstrap.min.css">
		
		<!--为支持IE8之下-->
		<!--[if lt IE 9]>
			<script src="//cdn.bootcss.com/respond.js/1.4.2/respond.min.js"></script>
		<![endif]-->
		<style type="text/css">
			body{
				background-color: #F8F8F8;
			}
			h2{
				font-size: 24px;
				margin-bottom: 30px;
			}
			.option-form-control{
				display: block;
				width: 100%;
				height: auto;
				padding: 10px 12px;
				font-size: 14px;
				border-bottom: 1px solid #CCCCCC;
				background-clip: padding-box;
				margin: 0;
			}
			.option-form-control:last-child{
				border: none;
			}
			.option-form-control input{
				margin-right: 8px;
				
			}
			.quest-option{
				border: 1px solid #CCCCCC;
				background: #FFFFFF;
				border-radius: 8px;
				margin-top: 10px;
			}
			.cut-line{
				width: 100%;
				height:2px;
				border:none;
				border-top:2px solid #E7E6EC;
				margin-top: 30px;
			}
			.btn{
				width: 100%;
				margin-top: 10px;
				margin-bottom: 30px;
				font-weight: bold;
				color: #000000;
				border-radius: 18px;
				
			}
			.btn:focus,
			.btn:active:focus,
			.btn.active:focus,
			.btn.focus,
			.btn:active.focus,
			.btn.active.focus {
			  	outline: none;
			}
			
		</style>
	</head>
	<body>
		<div class="container-fluid" style="min-width: 225px;">
			<h2 class="text-center">车主调查问卷</h2>
			<form action="" method="get" onsubmit="">
				<div class="form-group">
					<div class="radio-group">1、您的性别？&nbsp;<span style="color: red;">*</span></div>
					<div class="quest-option">
						<label class="option-form-control">
							<input type="radio" name="sex" value="man" />男
						</label>
						<label class="option-form-control">
							<input type="radio" name="sex" value="woman"/>女
						</label>
					</div>
					<hr class="text-center cut-line" />
				</div><!-- /form-group -->
				
				<div class="form-group">
					<div class="radio-group">2、您的年龄？&nbsp;<span style="color: red;">*</span></div>
					<div class="quest-option">
						<label class="option-form-control">
							<input type="radio" name="age" value="man" />18-25岁
						</label>
						<label class="option-form-control">
							<input type="radio" name="age" value="woman"/>26-35岁
						</label>
						<label class="option-form-control">
							<input type="radio" name="age" value="woman"/>36-45岁
						</label>
						<label class="option-form-control">
							<input type="radio" name="age" value="woman"/>45以上
						</label>
					</div>
					<hr class="text-center cut-line" />
				</div><!-- /form-group -->
				
				<div class="form-group">
					<div class="radio-group">3、您是否有过网上采购汽车配件、用品的经历？&nbsp;<span style="color: red;">*</span></div>
					<div class="quest-option">
						<label class="option-form-control">
							<input type="radio" name="ol-buy" value="man" />有
						</label>
						<label class="option-form-control">
							<input type="radio" name="ol-buy" value="woman"/>偶尔
						</label>
						<label class="option-form-control">
							<input type="radio" name="ol-buy" value="woman"/>没有
						</label>
					</div>
					<hr class="text-center cut-line" />
				</div><!-- /form-group -->
				
				<div class="form-group">
					<div class="radio-group">4、您最担心购买汽车配件、用品后会出现什么问题？&nbsp;<span style="color: red;">*</span></div>
					<div class="quest-option">
						<label class="option-form-control">
							<input type="radio" name="buy-prob" value="man" />质量
						</label>
						<label class="option-form-control">
							<input type="radio" name="buy-prob" value="woman"/>售后服务
						</label>
						<label class="option-form-control">
							<input type="radio" name="buy-prob" value="woman"/>安全性
						</label>
					</div>
					<hr class="text-center cut-line" />
				</div><!-- /form-group -->
				
				<div class="form-group">
					<div class="radio-group">5、在产品营销方面，您会选择那些网络营销推广方式？&nbsp;<span style="color: red;">*</span></div>
					<div class="quest-option">
						<label class="option-form-control">
							<input type="radio" name="market-way" value="man" />微信推广
						</label>
						<label class="option-form-control">
							<input type="radio" name="market-way" value="woman"/>微博推广
						</label>
						<label class="option-form-control">
							<input type="radio" name="market-way" value="woman"/>论坛网站
						</label>
						<label class="option-form-control">
							<input type="radio" name="market-way" value="woman"/>同盟网站推广
						</label>
					</div>
					<hr class="text-center cut-line" />
				</div><!-- /form-group -->
				
				<div class="form-group">
					<div class="radio-group">6、您对微公众号信营销有哪些认识？（可多选）&nbsp;<span style="color: red;">*</span></div>
					<div class="quest-option">
						<label class="option-form-control">
							<input type="checkbox" name="thinking" value="man" />助力思维：病毒式传播，全民嗨
						</label>
						<label class="option-form-control">
							<input type="checkbox" name="thinking" value="woman"/>抢红包思维：精众传播，立竿见影
						</label>
						<label class="option-form-control">
							<input type="checkbox" name="thinking" value="woman"/>大奖思维：高转发率，广参与性
						</label>
						<label class="option-form-control">
							<input type="checkbox" name="thinking" value="woman"/>节日思维：传递的是温情，传播的是品牌
						</label>
					</div>
					<hr class="text-center cut-line" />
				</div><!-- /form-group -->
				
				<div class="form-group">
					<div class="radio-group">7、针对汽配微信公众号营销，您期待哪些功能？（可多选）&nbsp;<span style="color: red;">*</span></div>
					<div class="quest-option">
						<label class="option-form-control">
							<input type="checkbox" name="function" value="man" />营销推送
						</label>
						<label class="option-form-control">
							<input type="checkbox" name="function" value="woman"/>行业资讯
						</label>
						<label class="option-form-control">
							<input type="checkbox" name="function" value="woman"/>交互论坛
						</label>
						<label class="option-form-control">
							<input type="checkbox" name="function" value="woman"/>一站式的服务
						</label>
					</div>
					<hr class="text-center cut-line" />
				</div><!-- /form-group -->
				
				<div class="form-group">
					<div class="radio-group">8、您期待一站式个性化服务具体包括哪些？（可多选）&nbsp;<span style="color: red;">*</span></div>
					<div class="quest-option">
						<label class="option-form-control">
							<input type="checkbox" name="one-stop" value="man" />保险服务
						</label>
						<label class="option-form-control">
							<input type="checkbox" name="one-stop" value="woman"/>保养服务
						</label>
						<label class="option-form-control">
							<input type="checkbox" name="one-stop" value="woman"/>代审车
						</label>
						<label class="option-form-control">
							<input type="checkbox" name="one-stop" value="woman"/>代办牌照
						</label>
					</div>
					<hr class="text-center cut-line" />
				</div><!-- /form-group -->
				
				<div class="form-group">
					<div class="radio-group">9、您认为什么价位的汽车配件更新频率快？&nbsp;<span style="color: red;">*</span></div>
					<div class="quest-option">
						<label class="option-form-control">
							<input type="radio" name="update" value="man" />低档车
						</label>
						<label class="option-form-control">
							<input type="radio" name="update" value="woman"/>中档车
						</label>
						<label class="option-form-control">
							<input type="radio" name="update" value="woman"/>高档车
						</label>
					</div>
					<hr class="text-center cut-line" />
				</div><!-- /form-group -->
				
				<div class="form-group">
					<div class="radio-group">10、您认为现有的汽车零配件销售行业在哪些方面有待改善？（可多选）&nbsp;<span style="color: red;">*</span></div>
					<div class="quest-option">
						<label class="option-form-control">
							<input type="checkbox" name="improve" value="man" />价格合理性
						</label>
						<label class="option-form-control">
							<input type="checkbox" name="improve" value="woman"/>增加销售渠道
						</label>
						<label class="option-form-control">
							<input type="checkbox" name="improve" value="woman"/>提高销售员素质
						</label>
						<label class="option-form-control">
							<input type="checkbox" name="improve" value="woman"/>其他
						</label>
					</div>
					<hr class="text-center cut-line" />
				</div><!-- /form-group -->
				
				<div class="form-group">
					<div class="radio-group">11、您认为汽配经销商或者汽修厂要有更好的发展，应注重哪些方面？（可多选） &nbsp;<span style="color: red;">*</span></div>
					<div class="quest-option">
						<label class="option-form-control">
							<input type="checkbox" name="develop-em" value="man" />服务质量
						</label>
						<label class="option-form-control">
							<input type="checkbox" name="develop-em" value="woman"/>技术方面
						</label>
						<label class="option-form-control">
							<input type="checkbox" name="develop-em" value="woman"/>服务种类的增加  
						</label>
						<label class="option-form-control">
							<input type="checkbox" name="develop-em" value="woman"/>配套设施
						</label>
					</div>
					<hr class="text-center cut-line" />
				</div><!-- /form-group -->
				
				<div class="form-group">
					<div class="radio-group">12、您认为目前经销商面临的困局？ （可多选）&nbsp;<span style="color: red;">*</span></div>
					<div class="quest-option">
						<label class="option-form-control">
							<input type="checkbox" name="trouble" value="man" />汽配城和店铺位置的两级分化
						</label>
						<label class="option-form-control">
							<input type="checkbox" name="trouble" value="woman"/>配件生产企业上游渗透，侵蚀市场份额
						</label>
						<label class="option-form-control">
							<input type="checkbox" name="trouble" value="woman"/>同业竞争激烈，利润空间被压缩
						</label>
						<label class="option-form-control">
							<input type="checkbox" name="trouble" value="woman"/>下游汽修厂赊欠严重，资金压力大
						</label>
						<label class="option-form-control">
							<input type="checkbox" name="trouble" value="woman"/>经销上个人能力有限
						</label>
					</div>
					<hr class="text-center cut-line" />
				</div><!-- /form-group -->
				
				<div class="form-group">
					<div class="radio-group">13、您认为汽修厂急切想要解决问题的需求？（可多选）&nbsp;<span style="color: red;">*</span></div>
					<div class="quest-option">
						<label class="option-form-control">
							<input type="checkbox" name="need" value="man" />配件知识培训
						</label>
						<label class="option-form-control">
							<input type="checkbox" name="need" value="woman"/>明确配件品牌及原副厂件规格
						</label>
						<label class="option-form-control">
							<input type="checkbox" name="need" value="woman"/>经销商发货速度
						</label>
						<label class="option-form-control">
							<input type="checkbox" name="need" value="woman"/>其他
						</label>
					</div>
					<hr class="text-center cut-line" />
				</div><!-- /form-group -->
				
				<div class="form-group">
					<div class="radio-group">14、您认为商家在产品环节更看重那些方面？（可多选）&nbsp;<span style="color: red;">*</span></div>
					<div class="quest-option">
						<label class="option-form-control">
							<input type="checkbox" name="product-em" value="man" />初始质量
						</label>
						<label class="option-form-control">
							<input type="checkbox" name="product-em" value="woman"/>耐久质量
						</label>
						<label class="option-form-control">
							<input type="checkbox" name="product-em" value="woman"/>售后承诺
						</label>
						<label class="option-form-control">
							<input type="checkbox" name="product-em" value="woman"/>客户满足度
						</label>
					</div>
					<hr class="text-center cut-line" />
				</div><!-- /form-group -->
				
				<div class="form-group">
					<div class="radio-group">15、就经销商的意见反馈，您更偏向于哪些方面进行处理？（可多选） &nbsp;<span style="color: red;">*</span></div>
					<div class="quest-option">
						<label class="option-form-control">
							<input type="checkbox" name="handle" value="man" />产品意见
						</label>
						<label class="option-form-control">
							<input type="checkbox" name="handle" value="woman"/>产品质量
						</label>
						<label class="option-form-control">
							<input type="checkbox" name="handle" value="woman"/>产品广告设计满意度
						</label>
						<label class="option-form-control">
							<input type="checkbox" name="handle" value="woman"/>客户满意度
						</label>
					</div>
					<hr class="text-center cut-line" />
				</div><!-- /form-group -->
				
				<div class="form-group">
					<div class="radio-group">16、作为经销商，你会通过什么手段促销？（可多选） &nbsp;<span style="color: red;">*</span></div>
					<div class="quest-option">
						<label class="option-form-control">
							<input type="checkbox" name="promotion-means" value="man" />让利消费者
						</label>
						<label class="option-form-control">
							<input type="checkbox" name="promotion-means" value="woman"/>增加消费渠道
						</label>
						<label class="option-form-control">
							<input type="checkbox" name="promotion-means" value="woman"/>增加促销活动
						</label>
						<label class="option-form-control">
							<input type="checkbox" name="promotion-means" value="woman"/>其他
						</label>
					</div>
					<hr class="text-center cut-line" />
				</div><!-- /form-group -->
				
				<input class="btn btn-default btn-lg" type="submit" value="提交">
			</form>
			
			
		</div>
		
	</body>
</html>
