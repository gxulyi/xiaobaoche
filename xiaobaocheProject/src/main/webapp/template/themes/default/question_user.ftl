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
					<div class="radio-group">3、您主要通过哪些渠道购买汽车配件？（可多选）&nbsp;<span style="color: red;">*</span></div>
					<div class="quest-option">
						<label class="option-form-control">
							<input type="checkbox" name="method" value="man" />大型汽配城
						</label>
						<label class="option-form-control">
							<input type="checkbox" name="method" value="woman"/>4S店
						</label>
						<label class="option-form-control">
							<input type="checkbox" name="method" value="woman"/>网上商城
						</label>
						<label class="option-form-control">
							<input type="checkbox" name="method" value="woman"/>汽车改装店
						</label>
						<label class="option-form-control">
							<input type="checkbox" name="method" value="woman"/>汽车美容装饰店
						</label>
					</div>
					<hr class="text-center cut-line" />
				</div><!-- /form-group -->
				
				<div class="form-group">
					<div class="radio-group">4、影响您选择汽车配件店的因素？（可多选）&nbsp;<span style="color: red;">*</span></div>
					<div class="quest-option">
						<label class="option-form-control">
							<input type="checkbox" name="influ-select" value="man" />品牌知名度
						</label>
						<label class="option-form-control">
							<input type="checkbox" name="influ-select" value="woman"/>价格合理
						</label>
						<label class="option-form-control">
							<input type="checkbox" name="influ-select" value="woman"/>产品质量
						</label>
						<label class="option-form-control">
							<input type="checkbox" name="influ-select" value="woman"/>朋友推荐
						</label>
					</div>
					<hr class="text-center cut-line" />
				</div><!-- /form-group -->
				
				<div class="form-group">
					<div class="radio-group">5、购买汽车配件用品您更注重因素是什么？&nbsp;<span style="color: red;">*</span></div>
					<div class="quest-option">
						<label class="option-form-control">
							<input type="radio" name="buy" value="man" />品牌质量
						</label>
						<label class="option-form-control">
							<input type="radio" name="buy" value="woman"/>安全性
						</label>
						<label class="option-form-control">
							<input type="radio" name="buy" value="woman"/>价格
						</label>
						<label class="option-form-control">
							<input type="radio" name="buy" value="woman"/>售后保障
						</label>
					</div>
					<hr class="text-center cut-line" />
				</div><!-- /form-group -->
				
				<div class="form-group">
					<div class="radio-group">6、您是否有过网购买汽车配件和汽车用品的经历？&nbsp;<span style="color: red;">*</span></div>
					<div class="quest-option">
						<label class="option-form-control">
							<input type="radio" name="ol-experience" value="man" />有
						</label>
						<label class="option-form-control">
							<input type="radio" name="ol-experience" value="woman"/>偶尔
						</label>
						<label class="option-form-control">
							<input type="radio" name="ol-experience" value="woman"/>没有
						</label>
					</div>
					<hr class="text-center cut-line" />
				</div><!-- /form-group -->
				
				<div class="form-group">
					<div class="radio-group">7、您认为网上购买汽车配件有哪些优势？（可多选）&nbsp;<span style="color: red;">*</span></div>
					<div class="quest-option">
						<label class="option-form-control">
							<input type="checkbox" name="ol-advantage" value="man" />方便快捷
						</label>
						<label class="option-form-control">
							<input type="checkbox" name="ol-advantage" value="woman"/>商品选择多样
						</label>
						<label class="option-form-control">
							<input type="checkbox" name="ol-advantage" value="woman"/>可对比性
						</label>
						<label class="option-form-control">
							<input type="checkbox" name="ol-advantage" value="woman"/>价格比实体店低
						</label>
					</div>
					<hr class="text-center cut-line" />
				</div><!-- /form-group -->
				
				<div class="form-group">
					<div class="radio-group">8、若在网上购买汽车用品及配件，您更看中哪方面的因素？&nbsp;<span style="color: red;">*</span></div>
					<div class="quest-option">
						<label class="option-form-control">
							<input type="radio" name="ol-important" value="man" />价格
						</label>
						<label class="option-form-control">
							<input type="radio" name="ol-important" value="woman"/>配送速度
						</label>
						<label class="option-form-control">
							<input type="radio" name="ol-important" value="woman"/>质量
						</label>
						<label class="option-form-control">
							<input type="radio" name="ol-important" value="woman"/>售后服务
						</label>
					</div>
					<hr class="text-center cut-line" />
				</div><!-- /form-group -->
				
				<div class="form-group">
					<div class="radio-group">9、您一般到哪些网站购买汽车用品？（可多选）&nbsp;<span style="color: red;">*</span></div>
					<div class="quest-option">
						<label class="option-form-control">
							<input type="checkbox" name="website" value="man" />汇集多类产品的纯网络运营商
						</label>
						<label class="option-form-control">
							<input type="checkbox" name="website" value="woman"/>汽车用品专业网站
						</label>
						<label class="option-form-control">
							<input type="checkbox" name="website" value="woman"/>有实体经营店的网络商城
						</label>
						<label class="option-form-control">
							<input type="checkbox" name="website" value="woman"/>提供网络平台的网络中介商
						</label>
					</div>
					<hr class="text-center cut-line" />
				</div><!-- /form-group -->
				
				<div class="form-group">
					<div class="radio-group">10、您一般会在网上购买哪类汽车用品？（可多选）&nbsp;<span style="color: red;">*</span></div>
					<div class="quest-option">
						<label class="option-form-control">
							<input type="checkbox" name="buy-type" value="man" />汽车外饰用品
						</label>
						<label class="option-form-control">
							<input type="checkbox" name="buy-type" value="woman"/>车内用品
						</label>
						<label class="option-form-control">
							<input type="checkbox" name="buy-type" value="woman"/>配件/车载通讯
						</label>
						<label class="option-form-control">
							<input type="checkbox" name="buy-type" value="woman"/>汽车保养品
						</label>
					</div>
					<hr class="text-center cut-line" />
				</div><!-- /form-group -->
				
				<div class="form-group">
					<div class="radio-group">11、若您不喜欢在网上购买汽车配件用品，原因是什么？（可多选） &nbsp;<span style="color: red;">*</span></div>
					<div class="quest-option">
						<label class="option-form-control">
							<input type="checkbox" name="dis-ol-reason" value="man" />对网购不了解
						</label>
						<label class="option-form-control">
							<input type="checkbox" name="dis-ol-reason" value="woman"/>担心质量存在问题
						</label>
						<label class="option-form-control">
							<input type="checkbox" name="dis-ol-reason" value="woman"/>交易不安全
						</label>
						<label class="option-form-control">
							<input type="checkbox" name="dis-ol-reason" value="woman"/>物流慢
						</label>
						<label class="option-form-control">
							<input type="checkbox" name="dis-ol-reason" value="woman"/>售后存在问题
						</label>
					</div>
					<hr class="text-center cut-line" />
				</div><!-- /form-group -->
				
				<div class="form-group">
					<div class="radio-group">12、您会参与汽配用品店网站举行的线上线下促销活动吗？&nbsp;<span style="color: red;">*</span></div>
					<div class="quest-option">
						<label class="option-form-control">
							<input type="radio" name="join-promote" value="man" />会
						</label>
						<label class="option-form-control">
							<input type="radio" name="join-promote" value="woman"/>不会
						</label>
						<label class="option-form-control">
							<input type="radio" name="join-promote" value="woman"/>依活动内容而定
						</label>
					</div>
					<hr class="text-center cut-line" />
				</div><!-- /form-group -->
				
				<div class="form-group">
					<div class="radio-group">13、对于以下促销方式，最能吸引您眼球的是？&nbsp;<span style="color: red;">*</span></div>
					<div class="quest-option">
						<label class="option-form-control">
							<input type="radio" name="promote-way" value="man" />买产品加送汽车保养
						</label>
						<label class="option-form-control">
							<input type="radio" name="promote-way" value="woman"/>有奖活动
						</label>
						<label class="option-form-control">
							<input type="radio" name="promote-way" value="woman"/>套餐包
						</label>
						<label class="option-form-control">
							<input type="radio" name="promote-way" value="woman"/>其他
						</label>
					</div>
					<hr class="text-center cut-line" />
				</div><!-- /form-group -->
				
				<div class="form-group">
					<div class="radio-group">14、您对微信公众号的认知程度？&nbsp;<span style="color: red;">*</span></div>
					<div class="quest-option">
						<label class="option-form-control">
							<input type="radio" name="wechat" value="man" />常关注
						</label>
						<label class="option-form-control">
							<input type="radio" name="wechat" value="woman"/>了解，但未关注过
						</label>
						<label class="option-form-control">
							<input type="radio" name="wechat" value="woman"/>不了解
						</label>
					</div>
					<hr class="text-center cut-line" />
				</div><!-- /form-group -->
				
				<div class="form-group">
					<div class="radio-group">15、您期待微信公众号推送的内容有哪些？（可多选） &nbsp;<span style="color: red;">*</span></div>
					<div class="quest-option">
						<label class="option-form-control">
							<input type="checkbox" name="push-content" value="man" />行业、品牌新闻
						</label>
						<label class="option-form-control">
							<input type="checkbox" name="push-content" value="woman"/>企业文化信息
						</label>
						<label class="option-form-control">
							<input type="checkbox" name="push-content" value="woman"/>促销活动信息
						</label>
						<label class="option-form-control">
							<input type="checkbox" name="push-content" value="woman"/>其他信息(汽车小贴士、用车手册)
						</label>
						<label class="option-form-control">
							<input type="checkbox" name="push-content" value="woman"/>其他
						</label>
					</div>
					<hr class="text-center cut-line" />
				</div><!-- /form-group -->
				<input class="btn btn-default btn-lg" type="submit" value="提交">
			</form>
			
			
		</div>
		
	</body>
</html>
