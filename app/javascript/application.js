document.addEventListener("DOMContentLoaded", function() {
  var openMenu = document.getElementById("open-menu");
  var closeMenu = document.getElementById("close-menu");
  var slideMenu = document.getElementById("slide-menu");
  
  closeMenu.addEventListener("click", function() {
    slideMenu.style.display = "none";
  });

  openMenu.addEventListener("click", function() {
    slideMenu.style.display = "flex";
  });
});
