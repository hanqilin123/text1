<!Doctype html><html>
<head>
    <title>24点终结者</title>
    <meta name="viewport" content="initial-scale=1" />
    <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=utf-8">
    <SCRIPT LANGUAGE="javaScript" >

        var O=[
            {name:"-",f:function(m,n){return m-n}}
            ,{name:"+",f:function(m,n){return m+n}}
            ,{name:"/",f:function(m,n){return m/n}}
            ,{name:"*",f:function(m,n){return m*n}}
        ]

        function valid(F){
            var s=F.a.value.replace(/^\D+|\D+$/g,"").split(/\D+/g)
            if (s.length!=4){alert("必须输入4个整数！");    F.a.focus();    return false}
            //格式化输入
            if (s.join(" ")!=F.a.value) F.a.value=s.join(" ")

            var b=[] //四个数字保存在b[1] b[2] b[4] b[8]中
            for(var i in s)
                b[1<<i]=parseInt(s[i])

            var n=F.count1.options[F.count1.selectedIndex].value; //需要计算的答案数
            var	k=0 //已经算出的答案数
            var	result={} //保存已经算出的答案,去掉重复
            F.text.value="";

//输出结果,找满答案返回true
            var writeResult=function (s){
                //按顺序替换符号与数字
                s=s.replace("%",O[f1].name).replace("%",O[f2].name).replace("%",O[f3].name)
                s=s.replace("N",b[i1]).replace("N",b[i2]).replace("N",b[i3]).replace("N",b[i4])
                if(result[s]) return //已经重复了
                result[s]=1 //记录
                F.text.value+=s+"\n";

                return ++k>=n
            }


            for (var i1=1;i1<=8;i1<<=1)
                for (var i2=1;i2<=8;i2<<=1)
                    for (var i3=1;i3<=8;i3<<=1)
                        for (var i4=1;i4<=8;i4<<=1){
                            //所有数字排列组合，简单去掉重复数字
                            if ((i1|i2|i3|i4)!=0xf) continue;
                            for (var f1=0;f1<=3;f1++)
                                for (var f2=0;f2<=3;f2++)
                                    for (var f3=0;f3<=3;f3++){
                                        var of1=O[f1],of2=O[f2],of3=O[f3];
                                        // ((1,2)3)4
                                        var m=of3.f(of2.f(of1.f(b[i1],b[i2]) ,b[i3] ) ,b[i4]);
                                        if (Math.abs(m-24)<1e-5 )
                                            if(writeResult("((N%N)%N)%N"))  return false


                                        // 1((2,3)4)
                                        m=of1.f(b[i1], of3.f(of2.f(b[i2],b[i3]) ,b[i4]) );
                                        if (Math.abs(m-24)<1e-5)
                                            if(writeResult("N%((N%N)%N)"))   return false


                                        //  (1(2,3))4
                                        m=of3.f(of1.f(b[i1], of2.f(b[i2],b[i3]) ),b[i4]);
                                        if (Math.abs(m-24)<1e-5)
                                            if(writeResult("(N%(N%N))%N"))     return false

                                        //1(2(3,4))
                                        m=of1.f(b[i1], of2.f(b[i2], of3.f( b[i3], b[i4]) ) );
                                        if (Math.abs(m-24)<1e-5)
                                            if(writeResult("N%(N%(N%N))"))     return false


                                        //(1,2)(3,4)
                                        m=of2.f(of1.f(b[i1],b[i2]), of3.f(b[i3],b[i4]) );
                                        if (Math.abs(m-24)<1e-5)
                                            if(writeResult("(N%N)%(N%N)"))     return false


                                    }
                        }
            F.text.value+="----END----\n"
            return false
        }

    </SCRIPT>
</head>
<BODY bgcolor=#D5E6E1 LINK="#0000ff" VLINK="#0000FF" >
<font color=red size=+3>24点终结者</font>
<HR>
<FORM>

    请输入四个整数空格分开：<BR>
    <INPUT TYPE="text" NAME="a"  size=20 value="3 3 8 8">


    <SELECT NAME="count1" >
        <OPTION VALUE="1" selected=on> 只找一个答案
        <OPTION VALUE="5" > 最多找5个
        <OPTION VALUE=10 > 最多找10个
        <OPTION VALUE=999 > 找全部答案
    </select>
    <BR>
    <INPUT TYPE="button"  VALUE="计算24点" onclick='return valid(this.form)'><BR>
    <HR>
    <TEXTAREA NAME="text" ROWS="15" COLS="30"></TEXTAREA>
</FORM>
<HR>
<FORM><INPUT TYPE="button"  VALUE="返回" onClick="history.back()"></FORM>

</body>
</html>
