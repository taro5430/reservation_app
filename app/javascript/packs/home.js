document.addEventListener('DOMContentLoaded', function(){
  let switchBtn= document.getElementById('nav-trigger');
  let box= document.getElementById('header-nav-menu');

  let changeElemnt = (el) => {
    if(el.style.display == 'block'){
      el.style.display = 'none';
    }else{
      el.style.display ='block';
    }
  }

  switchBtn.addEventListener('click', () => {
    changeElemnt(box);
  }, false);
});
