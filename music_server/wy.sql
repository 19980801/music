SET names UTF8;
DROP DATABASE IF EXISTS wy;
CREATE DATABASE wy CHARSET=UTF8;
USE wy;

#用户表
CREATE TABLE wy_user(
    uid INT PRIMARY KEY AUTO_INCREMENT,
    uname VARCHAR(32),
    upwd VARCHAR(128),
    upwd2 VARCHAR(128),
    email VARCHAR(32),
    phone CHAR(11),
    img_url VARCHAR(128)
);

INSERT INTO wy_user VALUES
(1,"tom",md5("123456"),md5("123456"),"123456@qq.com","18224565842","http://127.0.0.1:3001/imgs/user1.png"),
(3,"tom11",'123456',"123456","123456@qq.com","11111111111","http://127.0.0.1:3001/imgs/user1.png"),
(2,"jerry",md5("123456"),md5("123456"),"123456@qq.com","15936577674","http://127.0.0.1:3001/imgs/user2.png"); 

#index数据f1  
CREATE TABLE wy_play_list(
  pid INT PRIMARY KEY AUTO_INCREMENT,
  point VARCHAR(32),
  img_url VARCHAR(128),
  msg VARCHAR(128), 
  a_href VARCHAR(128)
);

INSERT INTO wy_play_list VALUES
(null,45335,"http://127.0.0.1:3001/imgs/f1-1.jpg","想哭哭不出来听这些","musicList?mid=1"),
(null,63,"http://127.0.0.1:3001/imgs/f1-2.jpg","夏日倾听","musicList?mid=2"),
(null,2309,"http://127.0.0.1:3001/imgs/f1-3.jpg","试着做个善良的人","musicList?mid=3"),
(null,372,"http://127.0.0.1:3001/imgs/f1-4.jpg","世界音乐","musicList?mid=4"),
(null,8328,"http://127.0.0.1:3001/imgs/f1-5.jpg","这个世界不会好了","musicList?mid=5"),
(null,91,"http://127.0.0.1:3001/imgs/f1-6.jpg","民谣","musicList?mid=6"),
(null,707,"http://127.0.0.1:3001/imgs/f1-7.jpg","经典老歌，久听不厌","musicList?mid=7"),
(null,45,"http://127.0.0.1:3001/imgs/f1-8.jpg","七里香 ","musicList?mid=8"),
(null,435,"http://127.0.0.1:3001/imgs/f1-9.jpg","华语速爆新歌","musicList?mid=9"),
(null,5335,"http://127.0.0.1:3001/imgs/f1-10.jpg","女声live|诉说惆怅之中的一抹温柔","musicList?mid=10"),
(null,1208,"http://127.0.0.1:3001/imgs/f1-11.jpg","【神仙翻唱】好听的翻唱Cover集","musicList?mid=11"),
(null,7621,"http://127.0.0.1:3001/imgs/f1-12.jpg","比爱自己还更爱你","musicList?mid=12");

#首页轮播图
CREATE TABLE wy_bannerlist(
  bid INT PRIMARY KEY AUTO_INCREMENT,
  img_url VARCHAR(128),
  a_href VARCHAR(128)
);

INSERT INTO wy_bannerlist VALUES
(1,"http://127.0.0.1:3001/imgs/banner1.jpg","javascript:;"),
(2,"http://127.0.0.1:3001/imgs/banner2.jpg","javascript:;"),
(3,"http://127.0.0.1:3001/imgs/banner3.jpg","javascript:;"),
(4,"http://127.0.0.1:3001/imgs/banner4.jpg","javascript:;"),
(5,"http://127.0.0.1:3001/imgs/banner5.jpg","javascript:;"),
(6,"http://127.0.0.1:3001/imgs/banner6.jpg","javascript:;"),
(7,"http://127.0.0.1:3001/imgs/banner7.jpg","javascript:;"),
(8,"http://127.0.0.1:3001/imgs/banner8.jpg","javascript:;");

#首页f2数据
CREATE TABLE wy_readlist(
  rid INT PRIMARY KEY AUTO_INCREMENT,
  img_url VARCHAR(128),
  a_href VARCHAR(128),
  title VARCHAR(64),
  content VARCHAR(512),
  point VARCHAR(32)
);

INSERT INTO wy_readlist VALUES
(1,"background-image:url(http://127.0.0.1:3001/imgs/banner1.jpg)","javascript:;","这里显示文章摘要，让读者对文章内容有个粗略的概念","文章内容",1247),
(null,"background-image:url(http://127.0.0.1:3001/imgs/banner2.jpg)","javascript:;","这里显示文章摘要，让读者对文章内容有个粗略的概念","文章内容",147),
(null,"background-image:url(http://127.0.0.1:3001/imgs/banner3.jpg)","javascript:;","这里显示文章摘要，让读者对文章内容有个粗略的概念","文章内容",526),
(null,"background-image:url(http://127.0.0.1:3001/imgs/banner4.jpg)","javascript:;","这里显示文章摘要，让读者对文章内容有个粗略的概念","文章内容",201);

#我创建的歌单表
CREATE TABLE wy_mymusiclist(
  mid INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(128),
  uid INT
);
INSERT INTO wy_mymusiclist VALUES
(1,"我喜欢的歌单","1"),
(null,"随便听的","1"),
(null,"经常听的","2"),
(null,"还可以吧","2");

#我收藏的歌单
CREATE TABLE wy_mylikelist(
  lid INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(128),
  author VARCHAR(64),
  uid INT 
);

INSERT INTO wy_mylikelist VALUES
(1,"民谣200首【精选】","秋白DW",1),
(null,"【吴青峰】惊艳了时光的主唱大人","Carol骨头",1),
(null,"女声live|诉说惆怅之中的一抹温柔","慢门先生",2);

#歌单类别
CREATE TABLE wy_musiclist(
  tid INT PRIMARY KEY AUTO_INCREMENT,
  msg VARCHAR(128),
  point VARCHAR(64),
  a_href VARCHAR(128),
  img_url VARCHAR(128),
  family VARCHAR(64)
);

INSERT INTO wy_musiclist VALUES
(1,"我的主要成分2%的可爱+98%的单身",241,"javascript:;","http://127.0.0.1:3001/imgs/nav1.jpg","热门推荐"),
(2,"听点不一样的·舔狗舔到最后一无所有",218,"javascript:;","http://127.0.0.1:3001/imgs/nav2.jpg","热门推荐"),
(3,"陈粒，敬你是条汉子",53,"javascript:;","http://127.0.0.1:3001/imgs/nav3.jpg","热门推荐"),
(4,"我愿意平凡的陪在你身旁（皮一下很开心版）",21,"javascript:;","http://127.0.0.1:3001/imgs/nav4.jpg","热门推荐"),
(5,"陈奕迅·薛之谦·李荣浩",223,"javascript:;","http://127.0.0.1:3001/imgs/nav5.jpg","热门推荐"),
(6,"Vike - 烟火里的尘埃",6236,"javascript:;","http://127.0.0.1:3001/imgs/nav6.jpg","热门推荐"),
(7,"再低微的骨子里也有山河",31,"javascript:;","http://127.0.0.1:3001/imgs/nav7.jpg","热门推荐"),
(8,"红色高跟鞋",61,"javascript:;","http://127.0.0.1:3001/imgs/nav8.jpg","热门推荐"),
(null,"谁说翻唱不好听",2429,"javascript:;","http://127.0.0.1:3001/imgs/nav9.jpg","热门推荐"),
(null,"华语｜心情过境，情怀释放",44,"javascript:;","http://127.0.0.1:3001/imgs/nav10.jpg","华语"),
(null,"我多么希望，我心里的歌你能听到",658,"javascript:;","http://127.0.0.1:3001/imgs/nav11.jpg","华语"),
(null,"每天都很晚睡的你",36,"javascript:;","http://127.0.0.1:3001/imgs/nav12.jpg","华语"),
(null,"每个人心中都有座室外桃园",24,"javascript:;","http://127.0.0.1:3001/imgs/nav13.jpg","华语"),
(null,"精选 | 网络热歌分享",9896,"javascript:;","http://127.0.0.1:3001/imgs/nav14.jpg","华语"),
(null,"孤独患者",1282,"javascript:;","http://127.0.0.1:3001/imgs/nav15.jpg","华语"),
(null,"转瞬即逝校园时光",284,"javascript:;","http://127.0.0.1:3001/imgs/nav16.jpg","华语"),
(null,"一个晚上睡觉听的歌单",93,"javascript:;","http://127.0.0.1:3001/imgs/nav17.jpg","华语"),
(null,"陈旧的车厢摇摇晃晃",238,"javascript:;","http://127.0.0.1:3001/imgs/nav18.jpg","华语"),
(null,"男生的温柔侵入心底",336,"javascript:;","http://127.0.0.1:3001/imgs/nav19.jpg","流行"),
(null,"轻吟浅唱，去拥抱一夏天的风",238,"javascript:;","http://127.0.0.1:3001/imgs/nav20.jpg","流行"),
(null,"「毕业将至」在校园谈场甜甜的恋爱吧",238,"javascript:;","http://127.0.0.1:3001/imgs/nav21.jpg","流行"),
(null,"时间会治愈一切，请给时间一点时间",382,"javascript:;","http://127.0.0.1:3001/imgs/nav22.jpg","流行"),
(null,"异地恋莫过于：我想见你 不远万里",238,"javascript:;","http://127.0.0.1:3001/imgs/nav23.jpg","流行"),
(null,"后来你哭了，想安慰却忘了早已换了身份",2518,"javascript:;","http://127.0.0.1:3001/imgs/nav24.jpg","流行"),
(null,"以前喜欢一个人，现在喜欢一个人",1407,"javascript:;","http://127.0.0.1:3001/imgs/nav25.jpg","流行"),
(null,"我的心上人 Ta有意中人",332,"javascript:;","http://127.0.0.1:3001/imgs/nav26.jpg","流行"),
(null,"独享音乐|耳机线是现代年轻人的输氧管",622,"javascript:;","http://127.0.0.1:3001/imgs/nav27.jpg","流行"),
(null,"午夜拥抱计划",529,"javascript:;","http://127.0.0.1:3001/imgs/nav28.jpg","摇滚"),
(null,"唤醒冬眠的熊和春天",62,"javascript:;","http://127.0.0.1:3001/imgs/nav29.jpg","摇滚"),
(null,"好听音乐咚鼓版本",123,"javascript:;","http://127.0.0.1:3001/imgs/nav30.jpg","摇滚"),
(null,"嗨爆全场的电音",22,"javascript:;","http://127.0.0.1:3001/imgs/nav31.jpg","摇滚"),
(null,"拯救坏情绪",225,"javascript:;","http://127.0.0.1:3001/imgs/nav32.jpg","摇滚"),
(null,"蹦迪取暖丨再冷也不能忘了摇滚",124,"javascript:;","http://127.0.0.1:3001/imgs/nav33.jpg","摇滚"),
(null,"我的车载音乐中文",42,"javascript:;","http://127.0.0.1:3001/imgs/nav34.jpg","摇滚"),
(null,"耳机专用9D环绕音",68,"javascript:;","http://127.0.0.1:3001/imgs/nav35.jpg","摇滚"),
(null,"【买了否冷咚鼓版】",102,"javascript:;","http://127.0.0.1:3001/imgs/nav36.jpg","摇滚"), 
(null,"烟酒嗓与民谣儿",2411,"javascript:;","http://127.0.0.1:3001/imgs/nav37.jpg","民谣"),
(null,"民谣歌单",102,"javascript:;","http://127.0.0.1:3001/imgs/nav38.jpg","民谣"),
(null,"【买了否冷咚鼓版】",91,"javascript:;","http://127.0.0.1:3001/imgs/nav39.jpg","民谣"),
(null,"房东的猫/谢春花",428,"javascript:;","http://127.0.0.1:3001/imgs/nav40.jpg","民谣"),
(null,"一个孤独患者的民谣歌单",29,"javascript:;","http://127.0.0.1:3001/imgs/nav41.jpg","民谣"),
(null,"一个双子座的民谣列表",545,"javascript:;","http://127.0.0.1:3001/imgs/nav42.jpg","民谣"),
(null,"吟游歌者，句句成诗",1258,"javascript:;","http://127.0.0.1:3001/imgs/nav43.jpg","民谣"),
(null,"一个比较走心的民谣",258,"javascript:;","http://127.0.0.1:3001/imgs/nav44.jpg","民谣"),
(null,"「民谣」民谣是唱给自己的歌",472,"javascript:;","http://127.0.0.1:3001/imgs/nav45.jpg","民谣"),
(null,"国风悠扬 | 温澜潮生",47,"javascript:;","http://127.0.0.1:3001/imgs/nav46.jpg","电子"),
(null,"全球总决赛bp音乐",33,"javascript:;","http://127.0.0.1:3001/imgs/nav47.jpg","电子"),
(null,"嗨爆全场的电音",472,"javascript:;","http://127.0.0.1:3001/imgs/nav48.jpg","电子"),
(null,"「民谣」民谣是唱给自己的歌",42,"javascript:;","http://127.0.0.1:3001/imgs/nav49.jpg","电子"),
(null,"失落少年孤独心俱乐部",805,"javascript:;","http://127.0.0.1:3001/imgs/nav50.jpg","电子"),
(null,"『电音✘动漫日语对白』 二次元の感动",472,"javascript:;","http://127.0.0.1:3001/imgs/nav51.jpg","电子"),
(null,"你的精神可有道",1254,"javascript:;","http://127.0.0.1:3001/imgs/nav52.jpg","电子"),
(null,"（DJ）咚鼓版也很炸♡",492,"javascript:;","http://127.0.0.1:3001/imgs/nav53.jpg","电子"),
(null,"特别关心声音很好听 红色感叹号也很好看",72,"javascript:;","http://127.0.0.1:3001/imgs/nav54.jpg","电子");

#歌曲表
CREATE TABLE wy_music(
  cid INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(128),
  author VARCHAR(64),
  a_href VARCHAR(128),
  img_url VARCHAR(128),
  family VARCHAR(64)
);

INSERT INTO wy_music VALUES
(1,"路过人间","郁可唯","javascript:;","http://127.0.0.1:3001/imgs/new1.jpg","新歌,华语"),
(null,"ME! (feat. Brendon Urie of Panic! At The Disco)","Taylor Swift","javascript:;","http://127.0.0.1:3001/imgs/new2.jpg","新歌,欧美"),
(null,"Dream Visit","李易峰","javascript:;","http://127.0.0.1:3001/imgs/new3.jpg","新歌,华语"),
(null,"孤单心事","颜在中","javascript:;","http://127.0.0.1:3001/imgs/new4.jpg","新歌,华语"),
(null,"末日青春：补完计划","F.I.R.","javascript:;","http://127.0.0.1:3001/imgs/new5.jpg","新歌,华语"),
(null,"Avengers: Endgame (Original Motion Picture Soundtrack)","Alan Silvestri","javascript:;","http://127.0.0.1:3001/imgs/new6.jpg","新歌,华语"),
(null,"Liar","黄明昊","javascript:;","http://127.0.0.1:3001/imgs/new7.jpg","新歌,欧美"),
(null,"For The Throne (Music Inspired by the HBO Series Game of Thrones)","Various Artists","javascript:;","http://127.0.0.1:3001/imgs/new8.jpg","新歌,欧美"),
(null,"Paint the Clouds","Far East Movement","javascript:;","http://127.0.0.1:3001/imgs/new9.jpg","新歌,欧美"),
(null,"Firework","J.Fla","javascript:;","http://127.0.0.1:3001/imgs/new10.jpg","新歌,欧美");

INSERT INTO wy_music VALUES
(11,"心跳的证明-(电影《一吻定情》心 动版主题曲)","刘人语","javascript:;","http://127.0.0.1:3001/imgs/day1.jpg","华语"),
(null,"相信","谢安琪","javascript:;","http://127.0.0.1:3001/imgs/day2.jpg","华语,女声"),
(null,"想自由","彭佳慧","javascript:;","http://127.0.0.1:3001/imgs/day3.jpg","华语,女声"),
(null,"你(Live)","田馥甄","javascript:;","http://127.0.0.1:3001/imgs/day4.jpg","华语,女声"),
(null,"天天想你","陈绮贞","javascript:;","http://127.0.0.1:3001/imgs/day5.jpg","华语,女声"),
(null,"怀念(Live)","王菲","javascript:;","http://127.0.0.1:3001/imgs/day6.jpg","华语,女声"),
(null,"你就不要想起我","田馥甄","javascript:;","http://127.0.0.1:3001/imgs/day7.jpg","华语,女声"),
(null,"下个路口见","李宇春","javascript:;","http://127.0.0.1:3001/imgs/day8.jpg","华语,女声"),
(null,"后来(Live)","刘若英","javascript:;","http://127.0.0.1:3001/imgs/day9.jpg","华语,女声"),
(null,"花心","张碧晨","javascript:;","http://127.0.0.1:3001/imgs/day10.jpg","华语,女声"),
(null,"离歌","张靓颖","javascript:;","http://127.0.0.1:3001/imgs/day11.jpg","华语,女声"),
(null,"爆炸的沉默","郭采洁","javascript:;","http://127.0.0.1:3001/imgs/day12.jpg","华语,女声"),
(null,"好久不见","蔡依林","javascript:;","http://127.0.0.1:3001/imgs/day13.jpg","华语,女声"),
(null,"城里的月光","SHE","javascript:;","http://127.0.0.1:3001/imgs/day14.jpg","华语,女声"),
(null,"征服","那英","javascript:;","http://127.0.0.1:3001/imgs/day15.jpg","华语,女声"),
(null,"囚鸟(Live)","田馥甄","javascript:;","http://127.0.0.1:3001/imgs/day16.jpg","华语,女声"),
(null,"浪费","徐佳莹","javascript:;","http://127.0.0.1:3001/imgs/day17.jpg","华语,女声"),
(null,"笔记","周笔畅","javascript:;","http://127.0.0.1:3001/imgs/day18.jpg","华语,女声"),
(null,"贝加尔湖畔 ","姚晨","javascript:;","http://127.0.0.1:3001/imgs/day19.jpg","华语,女声"),
(null,"也许明天","林忆莲/张惠妹","javascript:;","http://127.0.0.1:3001/imgs/day20.jpg","华语,女声");

#歌手表
CREATE TABLE wy_singer(
  sid INT PRIMARY KEY AUTO_INCREMENT,
  author VARCHAR(64),
  a_href VARCHAR(128),
  img_url VARCHAR(128)
);

INSERT INTO wy_singer VALUES 
(1,"张惠妹","javascript:;","http://127.0.0.1:3001/imgs/singer1.jpg"),
(null,"Fine乐团","javascript:;","http://127.0.0.1:3001/imgs/singer2.jpg"),
(null,"万晓利","javascript:;","http://127.0.0.1:3001/imgs/singer3.jpg"),
(null,"赵雷","javascript:;","http://127.0.0.1:3001/imgs/singer4.jpg"),
(null,"王三溥","javascript:;","http://127.0.0.1:3001/imgs/singer5.jpg"),
(null,"吴莫愁","javascript:;","http://127.0.0.1:3001/imgs/singer6.jpg"),
(null,"洪启","javascript:;","http://127.0.0.1:3001/imgs/singer7.jpg"),
(null,"李霄云","javascript:;","http://127.0.0.1:3001/imgs/singer8.jpg"),
(null,"孙楠","javascript:;","http://127.0.0.1:3001/imgs/singer9.jpg"),
(null,"老狼","javascript:;","http://127.0.0.1:3001/imgs/singer10.jpg"),
(null,"陈楚生","javascript:;","http://127.0.0.1:3001/imgs/singer11.jpg"),
(null,"陶喆","javascript:;","http://127.0.0.1:3001/imgs/singer12.jpg"),
(null,"蔡健雅","javascript:;","http://127.0.0.1:3001/imgs/singer13.jpg"),
(null,"黄小琥","javascript:;","http://127.0.0.1:3001/imgs/singer14.jpg"),
(null,"胡海泉","javascript:;","http://127.0.0.1:3001/imgs/singer15.jpg"),
(null,"杨宗纬","javascript:;","http://127.0.0.1:3001/imgs/singer16.jpg"),
(null,"胜娚（王胜男）","javascript:;","http://127.0.0.1:3001/imgs/singer17.jpg"),
(null,"薛之谦","javascript:;","http://127.0.0.1:3001/imgs/singer18.jpg"),
(null,"花粥","javascript:;","http://127.0.0.1:3001/imgs/singer19.jpg"),
(null,"G.E.M.邓紫棋","javascript:;","http://127.0.0.1:3001/imgs/singer20.jpg"),
(null,"Alan Walker","javascript:;","http://127.0.0.1:3001/imgs/singer21.jpg"),
(null,"林宥嘉","javascript:;","http://127.0.0.1:3001/imgs/singer22.jpg"),
(null,"王贰浪","javascript:;","http://127.0.0.1:3001/imgs/singer23.jpg"),
(null,"陈粒","javascript:;","http://127.0.0.1:3001/imgs/singer24.jpg"),
(null,"李荣浩","javascript:;","http://127.0.0.1:3001/imgs/singer25.jpg"),
(null,"华晨宇","javascript:;","http://127.0.0.1:3001/imgs/singer26.jpg"),
(null,"王以太","javascript:;","http://127.0.0.1:3001/imgs/singer27.jpg"),
(null,"田馥甄","javascript:;","http://127.0.0.1:3001/imgs/singer28.jpg"),
(null,"李宇春","javascript:;","http://127.0.0.1:3001/imgs/singer29.jpg"),
(null,"陈奕迅","javascript:;","http://127.0.0.1:3001/imgs/singer30.jpg");

#电台表
CREATE TABLE wy_radio(
  oid INT PRIMARY KEY AUTO_INCREMENT,
  author VARCHAR(64),
  title VARCHAR(128),
  a_href VARCHAR(128),
  img_url VARCHAR(128),
  family VARCHAR(128)
);

INSERT INTO wy_radio VALUES
(1,"庞宁","万能青年的家","javascript:;","http://127.0.0.1:3001/imgs/radio1.jpg","精品推荐"),
(null,"猫王早班车","猫王音乐台","javascript:;","http://127.0.0.1:3001/imgs/radio2.jpg","精品推荐"),
(null,"云音乐客服","云间浅音","javascript:;","http://127.0.0.1:3001/imgs/radio3.jpg","精品推荐"),
(null,"李俊毅JUNI22_大舅","大舅的毅期一会","javascript:;","http://127.0.0.1:3001/imgs/radio4.jpg","精品推荐"),
(null,"24FINN","Osshun Gum / killer whale","javascript:;","http://127.0.0.1:3001/imgs/radio5.jpg","创作|翻唱"),
(null,"穿山甲爱喝水","穿山甲爱喝水","javascript:;","http://127.0.0.1:3001/imgs/radio6.jpg","创作|翻唱"),
(null,"SUN小洁","SUN孙小洁","javascript:;","http://127.0.0.1:3001/imgs/radio7.jpg","创作|翻唱"),
(null,"浆糊人士","岳家别院","javascript:;","http://127.0.0.1:3001/imgs/radio8.jpg","创作|翻唱"),
(null,"Naruto615","第七班i","javascript:;","http://127.0.0.1:3001/imgs/radio9.jpg","电子|3D"),
(null,"大娱乐家ch","听风念旧人","javascript:;","http://127.0.0.1:3001/imgs/radio10.jpg","电子|3D"),
(null,"橙小羊","Beat Saber VR","javascript:;","http://127.0.0.1:3001/imgs/radio11.jpg","电子|3D"),
(null,"帐号已注销","迷幻beat","javascript:;","http://127.0.0.1:3001/imgs/radio12.jpg","电子|3D"),
(null,"解忧大白","解忧大白","javascript:;","http://127.0.0.1:3001/imgs/radio13.jpg","情感调频"),
(null,"VICE中国","相怼论","javascript:;","http://127.0.0.1:3001/imgs/radio14.jpg","情感调频"),
(null,"一禅小和尚","有问题，找一禅","javascript:;","http://127.0.0.1:3001/imgs/radio15.jpg","情感调频"),
(null,"久别今梦","久别今梦","javascript:;","http://127.0.0.1:3001/imgs/radio16.jpg","情感调频"),
(null,"今夕几何","十二的小电台","javascript:;","http://127.0.0.1:3001/imgs/radio17.jpg","音乐故事"),
(null,"馥甄的小鱼仔","ONLY FOR HEBE TIEN","javascript:;","http://127.0.0.1:3001/imgs/radio18.jpg","音乐故事"),
(null,"书生sy","书生很努力","javascript:;","http://127.0.0.1:3001/imgs/radio19.jpg","音乐故事"),
(null,"电子音乐资讯电台","电子音乐资讯电台","javascript:;","http://127.0.0.1:3001/imgs/radio20.jpg","音乐故事"),
(null,"动漫唯美风","动漫唯美风","javascript:;","http://127.0.0.1:3001/imgs/radio21.jpg","二次元"),
(null,"吱吱小精灵","小吱吱韵律敲击同人音声","javascript:;","http://127.0.0.1:3001/imgs/radio22.jpg","二次元"),
(null,"馋音FM","馋音FM","javascript:;","http://127.0.0.1:3001/imgs/radio23.jpg","二次元"),
(null,"冷水先森","冷水先森の助眠电台","javascript:;","http://127.0.0.1:3001/imgs/radio24.jpg","二次元"),
(null,"伴笙入睡","伴笙入睡","javascript:;","http://127.0.0.1:3001/imgs/radio25.jpg","美文读物"),
(null,"逍遥散人","散人时间","javascript:;","http://127.0.0.1:3001/imgs/radio26.jpg","美文读物"),
(null,"闻瑄姑娘","《洗脑术》怎样有逻辑的说服他人——高德","javascript:;","http://127.0.0.1:3001/imgs/radio27.jpg","美文读物"),
(null,"呆唯yuki","英语有声读物","javascript:;","http://127.0.0.1:3001/imgs/radio28.jpg","美文读物 "),
(null,"柠檬心理学","5分钟心理学","javascript:;","http://127.0.0.1:3001/imgs/radio29.jpg","知识技能"),
(null,"造就Talk","造就Talk","javascript:;","http://127.0.0.1:3001/imgs/radio30.jpg","知识技能"),
(null,"个人发展学会","超级思维：怎样成为很厉害的人","javascript:;","http://127.0.0.1:3001/imgs/radio31.jpg","知识技能"),
(null,"一刻talks","一刻talks","javascript:;","http://127.0.0.1:3001/imgs/radio32.jpg","知识技能"),
(null,"股票小生黄的的","股票入门基础知识","javascript:;","http://127.0.0.1:3001/imgs/radio33.jpg","商业财经"),
(null,"面膜财经","面膜财经","javascript:;","http://127.0.0.1:3001/imgs/radio34.jpg","商业财经"),
(null,"刘兴亮","亮三点","javascript:;","http://127.0.0.1:3001/imgs/radio35.jpg","商业财经"),
(null,"小赵说金融","职场金融说","javascript:;","http://127.0.0.1:3001/imgs/radio36.jpg","商业财经"),
(null,"笑果FM","笑果FM","javascript:;","http://127.0.0.1:3001/imgs/radio37.jpg","脱口秀"),
(null,"国民老岳父公","三人行不行","javascript:;","http://127.0.0.1:3001/imgs/radio38.jpg","脱口秀"),
(null,"塑料姐妹狗","塑料姐妹狗","javascript:;","http://127.0.0.1:3001/imgs/radio39.jpg","脱口秀"),
(null,"杨舟就是杨小船儿","小船说","javascript:;","http://127.0.0.1:3001/imgs/radio40.jpg","脱口秀"),

(null,"最有态度的嘻哈电台","嘻哈公园thePark","javascript:;","http://127.0.0.1:3001/imgs/radio41.jpg","精品推荐"),
(null,"WILLIAMISM MIXTAPE","陈伟霆WIL","javascript:;","http://127.0.0.1:3001/imgs/radio42.jpg","精品推荐"),
(null,"翊个人的江湖","翊","javascript:;","http://127.0.0.1:3001/imgs/radio43.jpg","创作|翻唱"),
(null,"祸祸民谣的咖啡馆","祸祸民谣的咖啡馆","javascript:;","http://127.0.0.1:3001/imgs/radio44.jpg","创作|翻唱"),
(null,"洞见官方播客","洞见官方播客","javascript:;","http://127.0.0.1:3001/imgs/radio45.jpg","3D|电子"),
(null,"轻课朗读","轻课朗读","javascript:;","http://127.0.0.1:3001/imgs/radio46.jpg","3D|电子"),
(null,"有一间电台","认真聆听你我都是故事的主角","javascript:;","http://127.0.0.1:3001/imgs/radio47.jpg","情感调频"),
(null,"郑老师的话","用一篇美文扫清一周的疲惫","javascript:;","http://127.0.0.1:3001/imgs/radio48.jpg","情感调频"),
(null,"杉果电台","杉果电台","javascript:;","http://127.0.0.1:3001/imgs/radio49.jpg","音乐故事"),
(null,"粤知一二官方电台","粤知"," javascript:;","http://127.0.0.1:3001/imgs/radio50.jpg","音乐故事"),
(null,"南木大叔","放下防备，治愈你的不安与疲惫","javascript:;","http://127.0.0.1:3001/imgs/radio51.jpg","二次元"),
(null,"一星期一本书","为你读一本书，叫做“感动","javascript:;","http://127.0.0.1:3001/imgs/radio52.jpg","二次元"),
(null,"勿先生电台","听见“我”，温暖“你”","javascript:;","http://127.0.0.1:3001/imgs/radio53.jpg","美文读物"),
(null,"听读电台","听读电台","javascript:;","http://127.0.0.1:3001/imgs/radio54.jpg","美文读物"),
(null,"解忧小房间","解忧","javascript:;","http://127.0.0.1:3001/imgs/radio55.jpg","知识技能"),
(null,"肥宅李","肥宅李的美好生活","javascript:;","http://127.0.0.1:3001/imgs/radio56.jpg","知识技能"),
(null,"陈立","山水有相逢","javascript:;","http://127.0.0.1:3001/imgs/radio57.jpg","商业财经"),
(null,"名校大师课","名校大师课","javascript:;","http://127.0.0.1:3001/imgs/radio58.jpg","商业财经"),
(null,"爱晒太阳的张张","爱晒太阳的张张","javascript:;","http://127.0.0.1:3001/imgs/radio59.jpg","脱口秀"),
(null,"星星","星星是谁撒在夜空的盐","javascript:;","http://127.0.0.1:3001/imgs/radio60.jpg","脱口秀");