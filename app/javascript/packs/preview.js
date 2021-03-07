if (document.URL.match( /new/) || document.URL.match( /edit/)) {
document.addEventListener('DOMContentLoaded',function(){
  const ImageList = document.getElementById('image-list');

  const createImageHTML = (blob) => {
    const imageElement = document.createElement('div');

    const blobImage = document.createElement('img');
    blobImage.className = 'illust-image'
    blobImage.setAttribute('src',blob);

    imageElement.appendChild(blobImage);
    ImageList.appendChild(imageElement)
  }

  document.getElementById('illust_image').addEventListener('change',function(e){
   const imageContent = document.querySelector('illust-image');
   if (imageContent){
     imageContent.remove();
   }
   const file=e.target.files[0];
   const blob= window.URL.createObjectURL(file);

   createImageHTML(blob);
  });
});
}