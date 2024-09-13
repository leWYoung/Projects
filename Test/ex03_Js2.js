let num = document.getElementById('num');
let plus = document.getElementById('plus');
let minus = document.getElementById('minus');
let reset = document.getElementById('reset');

plus.onclick=()=>{
    num.innerText++;
}
minus.onclick=function(){
    if(num.innerText>0){
        num.innerText--;
    }
}
reset.onclick = ()=>{
        num.innerText = 0 ;
}



















