window.addEventListener('load',function(){
  const pullDownButton = document.getElementById("lists")
  const pullDownParents = document.getElementById("pull-down")
  
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