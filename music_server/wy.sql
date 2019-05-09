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
    phone CHAR(11)
);

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
  title VARCHAR(128)
);
INSERT INTO wy_mymusiclist VALUES
(1,"我喜欢的歌单"),
(null,"随便听的"),
(null,"经常听的"),
(null,"还可以吧");

#我收藏的歌单
CREATE TABLE wy_mylikelist(
  lid INT PRIMARY KEY AUTO_INCREMENT,
  title VARCHAR(128),
  author VARCHAR(64)
);

INSERT INTO wy_mylikelist VALUES
(1,"民谣200首【精选】","秋白DW"),
(null,"【吴青峰】惊艳了时光的主唱大人","Carol骨头"),
(null,"女声live|诉说惆怅之中的一抹温柔","慢门先生");

#歌单类别
CREATE TABLE wy_musiclist(
  id INT PRIMARY KEY AUTO_INCREMENT,
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
  id INT PRIMARY KEY AUTO_INCREMENT,
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
