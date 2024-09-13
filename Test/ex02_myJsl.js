const margin = ()=>{
    document.getElementById("green").style.marginLeft = '100px';
    document.getElementById("blue").style.marginLeft = '200px';
    document.getElementById("gray").style.marginLeft = '300px';
    document.getElementById("red").style.borderBottomLeftRadius = '0px';
    document.getElementById("red").style.borderTopRightRadius = '0px';
    document.getElementById("green").style.borderBottomLeftRadius = '0px';
    document.getElementById("green").style.borderTopRightRadius = '0px';
    document.getElementById("blue").style.borderBottomLeftRadius = '0px';
    document.getElementById("blue").style.borderTopRightRadius = '0px';
    document.getElementById("gray").style.borderBottomLeftRadius = '0px';
    document.getElementById("gray").style.borderTopRightRadius = '0px';
}

let marginBt = document.getElementById('bt1');
marginBt.addEventListener('click',margin);

const radius = ()=>{
    document.getElementById("green").style.marginLeft = '100px';
    document.getElementById("blue").style.marginLeft = '200px';
    document.getElementById("gray").style.marginLeft = '300px';
    document.getElementById("red").style.borderBottomLeftRadius = '50px';
    document.getElementById("red").style.borderTopRightRadius = '50px';
    document.getElementById("green").style.borderBottomLeftRadius = '50px';
    document.getElementById("green").style.borderTopRightRadius = '50px';
    document.getElementById("blue").style.borderBottomLeftRadius = '50px';
    document.getElementById("blue").style.borderTopRightRadius = '50px';
    document.getElementById("gray").style.borderBottomLeftRadius = '50px';
    document.getElementById("gray").style.borderTopRightRadius = '50px';
}

let radiusBt = document.getElementById('bt2');
radiusBt.addEventListener('click',radius);