// 引入第三方模块
const mysql=require("mysql");
const express=require("express");
// 引入跨域模块
const cors=require("cors");
// 创建连接池
const pool=mysql.createPool({
  host:"127.0.0.1",
  user:"root",
  password:"",
  database:"wy"
})
// 创建express对象
var server=express();

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
  var mid=req.query.mid;
  if(!title){
    res.send({code:-1,msg:"标题不能为空!"});
    return;
  }
  var sql="INSERT INTO wy_mymusiclist VALUES(null,?)";
  pool.query(sql,[title],(err,result)=>{
    if(err) throw err;
    if(result.affectedRows==0){
      res.send({code:-1,msg:"添加失败!"});
    }else{
      res.send({code:1,msg:"添加成功!"});
    }
  })
});

//查询创建的歌单
server.get("/musiclist",(req,res)=>{
  var sql="SELECT mid,title FROM wy_mymusiclist";
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:result});
  })
});

// 删除创建的歌单
server.get("/delmusiclist",(req,res)=>{
  var mid=req.query.mid;
  console.log(mid);
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
  var sql="SELECT lid,title,author FROM wy_mylikelist";
  pool.query(sql,(err,result)=>{
    if(err) throw err;
    res.send({code:1,data:result});
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