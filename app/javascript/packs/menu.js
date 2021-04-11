window.addEventListener('load',function(){
  const pullDownButton = document.getElementById("lists")
  const pullDownParents = document.getElementById("pull-down")
  
  pullDownButton.addEventListener('mouseover',function(){
    this.setAttribute("style","background-color:gray;")
  })
  pullDownButton.addEventListener('mouseout',function(){
    this.removeAttribute("style","background-color:gray;")
  })
  pullDownButton.addEventListener('click',function(){
    pullDownParents.setAttribute("style","display:block;")
  })
})