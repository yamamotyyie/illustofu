window.addEventListener('load',function(){
  const pullDownButton = document.getElementById("lists")
  
  pullDownButton.addEventListener('mouseover',function(){
    pullDownButton.setAttribute("style","background-color:gray;")
  })
  pullDownButton.addEventListener('mouseout',function(){
    pullDownButton.removeAttribute("style","background-color:gray;")
  })
  pullDownButton.addEventListener('click',function(){
    console.log("click OK");
  })
})