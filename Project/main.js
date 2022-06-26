$('.center-slide').slick({
  infinite: true,
  slidesToShow: 5,
  slidesToScroll: 3,
});

let cartBtn = document.querySelector('.cart-btn');
let cartWrapper = document.querySelector('.cart-wrapper');
cartBtn.addEventListener("click", ()=> cartWrapper.classList.toggle("cart-on"));