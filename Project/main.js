$('.center-slide').slick({
  infinite: true,
  slidesToShow: 5,
  slidesToScroll: 3,
  autoplay: true,
  centermode: true,
  autoplaySpeed: 2000,
  // prevArrow: $('.prev'),
  // nextArrow: $('.next'),
});

function createPager(num) {
  let pageNum = Math.ceil(num / 12);
  let output = "";
  for (let i = 0; i < pageNum; i++) {
      let active = "";
      if(i == 0) {
          active = "active";
      }
      output += `<li class="page-item ${active}"><a class="page-link" href="${i * 12}">${i + 1}</a></li>`;
  }
  let ul = document.querySelector("ul.pagination")
  ul.firstElementChild.insertAdjacentHTML("afterend", output);
};

createPager(200);

let cartBtn = document.querySelector('.cart-btn');
let cartWrapper = document.querySelector('.cart-wrapper');
cartBtn.addEventListener("click", () => cartWrapper.classList.toggle("cart-on"));
function init() {
  if (!localStorage.hasOwnProperty("cart")) {
    let cart = [];
    localStorage.setItem("cart", JSON.stringify(cart));
    console.log(localStorage.getItem("cart"));
  }
}

function addBtnGroupEventListener() {
  let productCounter = document.querySelectorAll('.add-group-btn');
  productCounter.forEach(function (counter) {
    counter.addEventListener("click", function (event) {
      addToCart(event.target);
    })
  })
}

addBtnGroupEventListener();

function addToCart(el) {
  let product = {
    "id": el.getAttribute("data-id"),
    "title": el.getAttribute("data-title"),
    "price": el.getAttribute("data-price"),
  }
  let cart = [];
  if (localStorage.getItem("cart").length > 0) {
    cart = JSON.parse(localStorage.getItem('cart'));
  }
  let count = product.count
  let existingItem = false;
  cart.forEach((item) => {
    if (item.id == product.id) {
      item.count++;
      count = item.count;
      existingItem = true;
    }
  })
  if (!existingItem) {
    cart.push(product);
  }
  // update card on page
  updateCart(cart);
  // send cart back to local storage
  localStorage.setItem('cart', JSON.stringify(cart));
}

function updateCart(cart) {
  let cartBtn = document.querySelector('.cart-btn .badge');
  cartBtn.innerText = cart.length;
  if (cart.length > 0) {
    cart.forEach((item) => {
      let itemBadge = document.querySelector(`.product-${item.id} .badge`);
      let itemAlert = document.querySelector(`.product-${item.id} .bought`);
      itemAlert.style.display = "block";
      itemBadge.innerText = item.count;
    })
  }
  let tbody = document.querySelector('tbody');
  let tfooter = document.querySelector('tfoot .total');
  let output = '';
  let total = 0;
  cart.forEach((item, i) => {
    total += (item.price * item.count);
    output += `<tr>
      <th scope="row">${i + 1}</th>
      <td>${item.title}</td>
      <td>${item.price}</td>
      <td>${item.count} <i class="fa fa-trash"></i></td>
    </tr>`;
  })
  tbody.innerHTML = output;
  tfooter.innerText = total.toLocaleString();
}