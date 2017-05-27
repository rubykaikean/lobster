//弹出遮罩层
function openMask(maskID,bMask,aBtn,bBtn){
    //获取页面的高度和宽度
    var sWidth=document.body.clientWidth ;
    var sHeight=document.body.scrollHeight;

    //获取页面的可视区域高度和宽度
    var wHeight=document.documentElement.clientHeight;

    /*
    var oMask=document.createElement("div");
    oMask.id="mask";
    oMask.style.height=sHeight+"px";
    oMask.style.width=sWidth+"px";
    document.body.appendChild(oMask);
     */

    var oMask = document.getElementById("mask");
    oMask.style.height=sHeight+"px";
    oMask.style.width=sWidth+"px";
    oMask.style.display = "block";


    var oBox = document.getElementById(maskID);

    oBox.style.display = "block";

    //获取登陆框的宽和高
    var dHeight=oBox.offsetHeight;
    var dWidth=oBox.offsetWidth;

    //设置登陆框的left和top
    oBox.style.left=sWidth/2-dWidth/2+"px";
    oBox.style.top=wHeight/2-dHeight/2+"px";

    if (aBtn != null){
        var oAbtn=document.getElementById(aBtn);
        oAbtn.onclick = function(){
            oBox.style.display = "none";
            //document.body.removeChild(oMask);
            oMask.style.display = "none";
        };
    }
    if (bBtn != null){
        var oBbtn=document.getElementById(bBtn);
        oBbtn.onclick = function(){
            oBox.style.display = "none";
            //document.body.removeChild(oMask);
            oMask.style.display = "none";
        };
    }
    if (bMask == "1"){
        //点击登陆框以外的区域也可以关闭登陆框
        oMask.onclick=function(){
            oBox.style.display = "none";
            //document.body.removeChild(oMask);
            oMask.style.display = "none";
        };
    }
}








