// 引入第三方模块
const mysql=require("mysql");
const express=require("express");
// 引入跨域模块
const cors=require("cors");
const bodyparser=require("body-parser");
// 引入session模块
const session=require("express-session");
const multer=require("multer");
// 完成把文件移动到指定目录
const fs=require("fs");
var upload=multer({dest:"upload/"});
// 创建连接池
const pool=mysql.createPool({
  host:"127.0.0.1",
  user:"root",
  password:"",
  database:"wy"
})
// 创建express对象
var server=express();

//配置session
server.use(session({
  // 配置密钥
  secret:"128位字符串",
  // 每次请求是否更新数据
  // resave:true;加路由后该为true
  resave:false,
  // 保存初始化数据
  saveUninitialized:true, 

}));

// 绑定监听端口
server.listen(3001,()=>{
  console.log("服务器成功");
});

// 指定静态目录
server.use(express.static("public"));
// 配置cors跨域允许访问列表
server.use(cors({
  origin:["http://127.0.0.1:8080","http://localhost:8080"],
  // 提高安全性，每次访问都会验证
  credentials:true
}));

// 使用
server.use(bodyparser.urlencoded({extended:false}));

// 轮播图
server.get("/banner",(req,res)=>{
  var sql="SELECT bid,img_url,a_href FROM wy_bannerlist";
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:result});
  })
});

// 首页数据 f1
server.get("/playlist",(req,res)=>{
  var sql="SELECT pid,point,img_url,msg,a_href FROM wy_play_list";
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:result});
  })
});

// 首页数据f2
server.get("/readlist",(req,res)=>{
  var sql="SELECT rid,img_url,a_href,title,content,point FROM wy_readlist";
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:result});
  })
});

// 创建歌单
server.get("/createmuscilist",(req,res)=>{
  var title=req.query.title;
  var uid=req.query.uid;
  if(!title){
    res.send({code:-1,msg:"标题不能为空!"});
    return;
  }
  var sql="INSERT INTO wy_mymusiclist VALUES(null,?,?)";
  pool.query(sql,[title,uid],(err,result)=>{
    if(err) throw err;
    if(result.affectedRows==0){
      res.send({code:-1,msg:"添加失败!"});
    }else{
      res.send({code:1,msg:"添加成功!"});
    }
  })
});

// 歌单分类  
// 全部,分页
server.get("/listall",(req,res)=>{
  var pno=req.query.pno;
  var pageSize=req.query.pageSize;
  if(!pno) pno=1;
  if(!pageSize) pageSize=9;
  // 创建变量保存发送给客户端数据
  var obj={code:1};
  // 创建变量保存进度
  var progress=0;
  var sql="SELECT tid,msg,point,a_href,img_url,family FROM wy_musiclist LIMIT ?,?";
  var count=(pno-1)*pageSize;
  pageSize=parseInt(pageSize);
  pool.query(sql,[count,pageSize],(err,result)=>{
    if(err) throw err;
    progress+=5;
    obj.data=result;
    if(progress==10)
    // 查询结果
    res.send(obj);
  });
  // 计算总页数
  pool.query("SELECT count(tid) AS c FROM wy_musiclist",(err,result)=>{
    if(err) throw err;
    progress+=5;
    var pc=Math.ceil(result[0].c/pageSize);
    obj.pageCount=pc;
    if(progress==10)
    res.send(obj);
  }) 
});



// 热门推荐
server.get("/list1",(req,res)=>{
  var sql=`SELECT tid,msg,point,a_href,img_url,family FROM wy_musiclist WHERE family='热门推荐'`;
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:result});
  })
});
// 华语
server.get("/list2",(req,res)=>{
  var sql=`SELECT tid,msg,point,a_href,img_url,family FROM wy_musiclist WHERE family='华语'`;
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:result});
  })
});
// 流行
server.get("/list3",(req,res)=>{
  var sql=`SELECT tid,msg,point,a_href,img_url,family FROM wy_musiclist WHERE family='流行'`;
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:result});
  })
});
// 摇滚
server.get("/list4",(req,res)=>{
  var sql=`SELECT tid,msg,point,a_href,img_url,family FROM wy_musiclist WHERE family='摇滚'`;
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:result});
  })
});
// 民谣
server.get("/list5",(req,res)=>{
  var sql=`SELECT tid,msg,point,a_href,img_url,family FROM wy_musiclist WHERE family='民谣'`;
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:result});
  })
});
// 电子
server.get("/list6",(req,res)=>{
  var sql=`SELECT tid,msg,point,a_href,img_url,family FROM wy_musiclist WHERE family='电子'`;
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:result});
  })
});

// 个性推荐随机取9条数据
server.get("/rand",(req,res)=>{
  var sql="SELECT tid,msg,point,a_href,img_url,family FROM wy_musiclist order by rand() LIMIT 6";
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:result});
  })
});

// 新歌查询
server.get("/newlist",(req,res)=>{
  var sql="SELECT cid,title,author,a_href,img_url FROM wy_music WHERE family LIKE '%新歌%'";
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:result});
  })
});

//每日推荐30首歌
server.get("/daylist",(req,res)=>{
  var sql="SELECT cid,title,author,a_href,img_url FROM wy_music order by rand() LIMIT 30";
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:result});
  })
});

// 歌手列表 随机
server.get("/singer",(req,res)=>{
  var sql="SELECT sid,author,a_href,img_url FROM wy_singer order by rand() LIMIT 12";
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:result});
  })
});

// 歌手列表 全部
server.get("/singerlist",(req,res)=>{
  var sql="SELECT sid,author,a_href,img_url FROM wy_singer";
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:result});
  })
});

//电台
server.get("/radio1",(req,res)=>{
  var sql="SELECT oid,author,title,a_href,img_url FROM wy_radio WHERE family LIKE '%推荐%'";
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:result})
  })
});
server.get("/radio2",(req,res)=>{
  var sql="SELECT oid,author,title,a_href,img_url FROM wy_radio WHERE family LIKE '%创作%'";
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:result})
  })
});
server.get("/radio3",(req,res)=>{
  var sql="SELECT oid,author,title,a_href,img_url FROM wy_radio WHERE family LIKE '%电子%'";
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:result})
  })
});
server.get("/radio4",(req,res)=>{
  var sql="SELECT oid,author,title,a_href,img_url FROM wy_radio WHERE family LIKE '%情感%'";
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:result})
  })
});
server.get("/radio5",(req,res)=>{
  var sql="SELECT oid,author,title,a_href,img_url FROM wy_radio WHERE family LIKE '%音乐故事%'";
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:result})
  })
});
server.get("/radio6",(req,res)=>{
  var sql="SELECT oid,author,title,a_href,img_url FROM wy_radio WHERE family LIKE '%二次元%'";
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:result})
  })
});
server.get("/radio7",(req,res)=>{
  var sql="SELECT oid,author,title,a_href,img_url FROM wy_radio WHERE family LIKE '%美文读物%'";
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:result})
  })
});
server.get("/radio8",(req,res)=>{
  var sql="SELECT oid,author,title,a_href,img_url FROM wy_radio WHERE family LIKE '%知识技能%'";
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:result})
  })
});
server.get("/radio9",(req,res)=>{
  var sql="SELECT oid,author,title,a_href,img_url FROM wy_radio WHERE family LIKE '%商业财经%'";
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:result})
  })
});
server.get("/radio10",(req,res)=>{
  var sql="SELECT oid,author,title,a_href,img_url FROM wy_radio WHERE family LIKE '%脱口秀%'";
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:result})
  })
});

// 用户登录
server.get("/login",(req,res)=>{
  var phone=req.query.phone;
  var upwd=req.query.upwd;
  var sql="SELECT uid,uname,img_url FROM wy_user WHERE phone=? AND upwd=md5(?)";
  pool.query(sql,[phone,upwd],(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      var uid=result[0].uid;
      console.log(uid);
      req.session.uid=uid;
      console.log(req.session.uid);
      res.send({code:1,data:result});
    }else{
     res.send({code:-1,msg:"登录失败"});
    }
  })
});
// 用户注册
server.post("/reg",(req,res)=>{
  var phone=req.body.phone;
  var upwd=req.body.upwd;
  var upwd2=req.body.upwd2;
  var uname=req.body.uname;
  var email=req.body.email;
  var img_url="http://127.0.0.1:3001/imgs/user.jpg";
  var sql="INSERT INTO wy_user VALUES(null,?,md5(?),md5(?),?,?,?)";
  pool.query(sql,[uname,upwd,upwd2,email,phone,img_url],(err,result)=>{
    if(err) throw err;
    if(result.affectedRows>0){
      res.write(JSON.stringify({code:1,msg:"注册成功"}));
    }else{
      res.write(JSON.stringify({code:0,msg:"注册失败"}));
    }
    res.end();
  })
});

// 用户搜索
server.get("/search",(req,res)=>{
  var family=req.query.family;
  var sql=`SELECT tid,msg,point,a_href,img_url FROM wy_musiclist WHERE family LIKE '%${family}%'`; 
  pool.query(sql,[family],(err,result)=>{
    if(err) throw err;
    if(result.length>0){
      res.send({code:1,data:result});
    }else{
      res.send({code:-1,msg:"查询失败"});
    }
  })
}); 

//查询创建的歌单
server.get("/musiclist",(req,res)=>{
  var uid=req.session.uid;
  console.log(uid);
  if(!uid){
    res.send({code:-1,msg:"请登录",data:[]});
    return;
  }
  var sql="SELECT mid,title FROM wy_mymusiclist WHERE uid=?";
  pool.query(sql,[uid],(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:result});
  })
});

// 删除创建的歌单
server.get("/delmusiclist",(req,res)=>{
  var mid=req.query.mid;
  var sql="DELETE FROM wy_mymusiclist WHERE mid=?";
  pool.query(sql,[mid],(err,result)=>{
    if(err) throw err;
    if(result.affectedRows==0){
      res.send({code:-1,msg:"删除失败!"});
    }else{
      res.send({code:1,msg:"删除成功!"});
    }
  })
});

// 查询收藏的歌单
server.get("/likelist",(req,res)=>{
  var uid=req.session.uid;
  var sql="SELECT lid,title,author FROM wy_mylikelist WHERE uid=?";
  pool.query(sql,[uid],(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:result});
  })
});

// 修改密码
server.post("/updata",(req,res)=>{
  var phone=req.body.phone;
  var upwd=req.body.upwd;
  var upwd2=req.body.upwd2;
  var sql="UPDATE wy_user SET upwd=md5(?),upwd2=md5(?) WHERE phone=?";
  pool.query(sql,[upwd,upwd2,phone],(err,result)=>{
    if(err) throw err;
    if(result.affectedRows>0){
      res.write(JSON.stringify({code:1,msg:"修改成功"}));
    }else{
      res.write(JSON.stringify({code:0,msg:"修改失败"}));
    }
    res.end();
  })
});

//修改头像
server.post("/uploadFile",upload.single("mypic"),(req,res)=>{
  // 获取原文件名
  var src=req.file.originalname;
  console.log(src);
  // 创建新文件名
  var t=new Date().getTime();
  var tn=Math.floor(Math.random()*9999);
  // 查找后缀下标
  var i3=src.lastIndexOf(".");
  // 从i3位置开始截取
  var suff=src.substring(i3);
  var des=__dirname+"/upload/"+t+tn+suff;
  console.log(des);
  // 将临时文件移动到upload目录下  fs.renameSynv(临时文件,新文件)
  fs.renameSync(req.file.path,des);
  res.send({code:1,msg:"上传成功"});
});