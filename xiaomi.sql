SET NAMES UTF8;
DROP DATABASE IF EXISTS xiaomi;
CREATE DATABASE xiaomi CHARSET=UTF8;
USE xiaomi;

/**购物车条目**/
CREATE TABLE xiaomi_shoppingcart_item(
  iid INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT,      #用户编号
  product_id INT,   #商品编号
  count INT,        #购买数量
  is_checked BOOLEAN #是否已勾选，确定购买
);

/*用户列表*/
#创建保存用户的表
CREATE TABLE xiaomi_user(
  uid INT PRIMARY KEY AUTO_INCREMENT ,
  uname VARCHAR(8),
  birthday DATE,
  upwd VARCHAR(32),
  email VARCHAR(16),
  phone VARCHAR(11),
  gender INT,#0-女  1-男
  user_name VARCHAR(8)#真实姓名
  
);
/*用户地址表*/
CREATE TABLE xiaomi_receiver_address(
  aid INT PRIMARY KEY AUTO_INCREMENT,#编号
  user_id INT,                #用户编号
  receiver VARCHAR(16),       #接收人姓名
  province VARCHAR(16),       #省
  city VARCHAR(16),           #市
  county VARCHAR(16),         #县
  address VARCHAR(128),       #详细地址
  cellphone VARCHAR(16),      #手机号码
  fixedphone VARCHAR(16),     #固定电话
  postcode VARCHAR(6),        #邮编
  tag VARCHAR(16),            #标签名
  is_default BOOLEAN          #是否为当前用户的默认收货地址

);
/** xiaomi商品表 **/
CREATE TABLE xiaomi_commodity(
  lid INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(128) ,      #主标题
  subtitle VARCHAR(128),    #副标题
  price DECIMAL(7,2),       #价格
  promise VARCHAR(64),      #服务承诺
  spec VARCHAR(64) ,        #规格号
  details VARCHAR(1024),    #产品详细说明
  shelf_time DATE,         #上架时间
  sold_count INT ,         #已售出的数量
  is_onsale BOOLEAN        #是否促销中
);
/**xiaomi商品类型**/
CREATE TABLE xiaomi_commodity_type(
  fid INT PRIMARY KEY AUTO_INCREMENT,
  fname VARCHAR(32)
);
#商品图片表
CREATE TABLE xiaomi_makeup_pic(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  makeup_id INT,              #商品编号
  sm VARCHAR(128),            #小图片路径
  md VARCHAR(128),            #中图片路径
  lg VARCHAR(128)             #大图片路径
);

#插入用户列表数据
INSERT INTO xiaomi_user VALUES(1,'dingding','1999-2-1','123123123','dingding@qq.com','11111111111',0,'丁丁');
INSERT INTO xiaomi_user VALUES(2,'mike','1998-3-1','234234234','mike@qq.com','22222222222',1,'尼克');
INSERT INTO xiaomi_user VALUES(3,'luxi','1995-4-2','345345345','luxi@qq.com','33333333333',0,'露西');
INSERT INTO xiaomi_user VALUES(4,'xixi','2000-9-7','567567567','xixi@qq.com','444444444444',0,'嘻嘻');
INSERT INTO xiaomi_user VALUES(5,'root','1998-12-2','678678678','root@qq.com','55555555555',1,'鲁特');
INSERT INTO xiaomi_user VALUES(6,'hello','2000-7-8','789789789','hello@qq.com','66666666666',1,'哈喽');

/**xiaomi商品类型添加数据**/
INSERT INTO xiaomi_commodity_type VALUES
(NULL,'小米10 Pro'),
(NULL,'Redmi K30 Pro'),
(NULL,'小米MIX Alpha'),
(NULL,'小米10'),
(NULL,'小米CC9'),
(NULL,'小米CC9 美图版'),
(NULL,'Redmi Note 8 Pro'),
(NULL,'小米平板4'),
(NULL,'Redmi K30 5G');

/** xiaomi商品表添加数据 **/
INSERT INTO xiaomi_commodity VALUES
(1,'小米10 Pro','骁龙865处理器 / 1亿像素8K电影相机',330.00,'分期享6期免息','小米手机','双模5G / 新一代LPDDR5内存 / 50W极速闪充+30W无线闪充+10W无线反充 / 对称式立体声 / 90Hz刷新率+180Hz采样率 / UFS 3.0高速存储 / 全面适配WiFi 6 / 超强VC液冷散热 / 4500mAh大电量 / 多功能NFC。','2019-9-24',520,true),
(2,'Redmi K30 Pro','双模5G',330.00,'分期享6期免息','小米手机','弹出式超光感全面屏 /索尼 6400万高清四摄 / 8K视频拍摄 / 超大面积VC立体散热 / 4700mAh+33W疾速闪充 / 多功能NFC / 红外遥控','2019-8-3',300,true),
(3,'小米MIX Alpha','环绕屏概念手机',330.00,'分期享6期免息','小米手机','创新环绕屏，极具未来感的智能交互体验 / 1亿像素超高清相机，超大感光元件 / 5G双卡全网通超高速网络 / 骁龙855Plus旗舰处理器 / 纳米硅基锂离子4050mAh电池，40W超级快充 / 钛合金+精密陶瓷+蓝宝石镜片前沿工艺。','2019-4-8',120,true),
(4,'小米10','1亿像素8K电影相机 / 双模5G / 新一代LPDDR5内存',330.00,'分期享6期免息','小米手机','对称式立体声 / 90Hz刷新率+180Hz采样率 / UFS 3.0高速存储 / 全面适配Wi-Fi 6 / 超强VC液冷散热 / 30W极速闪充+30W无线闪充+10W无线反充 / 4780mAh大电量 / 多功能NFC','2019-3-6',100,true),
(5,'小米CC9','前置3200万自拍 / 索尼4800万超广角三摄',330.00,'分期享6期免息','小米手机','多色炫彩轻薄机身 / 6.39英寸三星 AMOLED水滴屏 /4030mAh大电量 / 骁龙710处理器 / 屏幕指纹 / NFC功能 / 红外遥控功能 / Game Turbo2.0游戏加速','2019-2-6',230,true),
(6,'小米CC9 美图版','100%美图相机，前置3200万，自拍美得更自然',330.00,'分期享6期免息','小米手机','AI弱光人像，暗光环境也能拍出水光肌 / 全身美型，变美不变形 / 4030mAh大电量，足够尽兴玩一天 / 美图定制仙女配色、轻薄机身 / 6.39英寸三星 AMOLED水滴屏。','2020-3-6',88,true),
(7,'Redmi Note 8 Pro','6400万旗舰级全场景四摄 / 前置2000万 AI美颜相机',330.00,'分期享6期免息','小米手机','G90T专业游戏芯片，液冷散热 / 6.53英寸水滴全面屏 / 4500mAh大电量 / 标配18W快充 / 康宁大猩猩保护玻璃 / 多功能NFC / 红外遥控功能 / Game Turbo2.0游戏加速','2018-3-6',230,true),
(8,'小米平板4','8" 屏幕，单手可握的追剧神器',330.00,'分期享6期免息','小米手机','6000mAh大容量电池 / 支持AI人脸识别 / 后置1300万，前置500万摄像头 / 金属机身，超窄边框 / 骁龙660八核处理器',190,true),
(9,'Redmi K30 5G','双模5G / 三路并发 / 高通骁龙765G',330.00,'分期享6期免息','小米手机','7nm 5G低功耗处理器 / 120Hz高帧率流速屏 / 6.67''小孔径全面屏 / 索尼6400万前后六摄 / 最高可选8GB+256GB大存储 / 4500mAh+30W快充 / 3D四曲面玻璃机身 / 多功能NFC','220-4-20',188,true);

#插入数据商品图片表
INSERT INTO xiaomi_makeup_pic VALUES
(NULL, 1, 'img/product/sm/horizon%2Fcovers%2FY0028808_F002880877_E01_GHC.jpg','img/product/md/horizon%2Fcovers%2FY0028808_F002880877_E01_GHC.jpg','img/product/lg/2FY0028808_F002880877_E01_ZHC.jpg'),
(NULL, 2, 'img/product/sm/2FY0027830_F042783999_E01_GHC.jpg','img/product/md/2FY0027830_F042783999_E01_GHC.jpg','img/product/lg/1.jpg'),
(NULL, 3, 'img/product/sm/%2FY0112000%2FY0112000_C011200066_E01_GHC.jpg','img/product/md/C011200066_E01_GHC.jpg','img/product/lg/%2FY0112000%2FY0112000_C011200066_E01_ZHC.jpg')

