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

let cartBtn = document.querySelector('.cart-btn');
let cartWrapper = document.querySelector('.cart-wrapper');
let movieTrailerBtn = document.querySelector('.trailer-btn');
cartBtn.addEventListener("click", () => cartWrapper.classList.toggle("cart-on"));



function init() {
  if (!localStorage.hasOwnProperty("cart")) {
    let cart = [];
    localStorage.setItem("cart", JSON.stringify(cart));
    console.log(localStorage.getItem("cart"));
  }
}




init();

function init() {
  if (!localStorage.hasOwnProperty("cart")) {
    let cart = [];
    localStorage.setItem("cart", JSON.stringify(cart));
    console.log(localStorage.getItem("cart"));
  }
}

addBtnGroupEventListener();

function addBtnGroupEventListener() {
  let productCounter = document.querySelectorAll('.add-group-btn');
  productCounter.forEach(function (counter) {
    counter.addEventListener("click", function (event) {
      console.log(event.target.classList);
      console.log(event.target);
      if (event.target.classList.contains("add-cart-btn")) {
        addToCart(event.target);

      }
    })
  })
}

function addToCart(el) {
  let product = {
    "id": el.getAttribute("data-id"),
    "title": el.getAttribute("data-title"),
    "price": el.getAttribute("data-price"),
    "count": 1
  }
  console.log(product);
  let cart = [];
  if (localStorage.getItem("cart").length > 0) {
    cart = JSON.parse(localStorage.getItem('cart'));
  }
  let count = product.count
  let existingItem = false;
  cart.forEach((item) => {
    if (item.id == product.id) {
      item.count += product.count;
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

updateCart(JSON.parse(localStorage.getItem("cart")));

function updateCart(cart) {
  let cartBtn = document.querySelector('.cart-btn .badge');
  cartBtn.innerText = cart.length;
  let tbody = document.querySelector('tbody');
  let tfooter = document.querySelector('tfoot .total');
  let output = '';
  let total = 0;
  cart.forEach((item, i) => {
    total += (item.price * item.count);
    output += `<tr>
      <th scope="row" movie-id="${item.id}">${i + 1}</th>
      <td>${item.title}</td>
      <td>$${item.price}</td>
      <td> <button type="button" class="trash">${item.count} <i class="fa fa-trash"></i></button></td>
    </tr>`;
  })
  tbody.innerHTML = output;
  total = total.toFixed(2);
  tfooter.innerText = total.toLocaleString();
  RemoveBtnListner();
}


function RemoveBtnListner() {
  let removeBtns = document.querySelectorAll('.trash');
  console.log(removeBtns);
  removeBtns.forEach(function (button) {
    button.addEventListener("click", (event) => {
      let cart = [];
      let productId = event.target.closest("tr").querySelector("th").getAttribute("movie-id");
      cart = JSON.parse(localStorage.getItem('cart'));


      index = cart.findIndex(product => product.id === productId);

      if (index > -1) {
        cart.splice(index, 1);
      }

      event.target.closest("tr").remove();

      // update card on page
      updateCart(cart);
      // send cart back to local storage
      localStorage.setItem('cart', JSON.stringify(cart));
    });
  });
}

// function GenreDrop() {
//   document.getElementById("myGenre").classList.toggle("show");
// }

// function BrandDrop() {
//   document.getElementById("myBrand").classList.toggle("show");
// }

// // Close the dropdown menu if the user clicks outside of it
// window.onclick = function(event) {
//   console.log(event.target.closest("aside"));
//   if (!event.target.closest("aside").matches('.filter-box')) {
//     var dropdowns = document.getElementsByClassName("dropdown-content");
//     var i;
//     for (i = 0; i < dropdowns.length; i++) {
//       var openDropdown = dropdowns[i];
//       if (openDropdown.classList.contains('show')) {
//         openDropdown.classList.remove('show');
//       }
//     }
//   }
// } 

var acc = document.getElementsByClassName("accordion");
var i;

console.log(acc);

for (i = 0; i < acc.length; i++) {
  acc[i].addEventListener("click", function() {
    /* Toggle between adding and removing the "active" class,
    to highlight the button that controls the panel */
    this.classList.toggle("active");
    console.log("clickded");
    /* Toggle between hiding and showing the active panel */
    var panel = this.nextElementSibling;
    if (panel.style.display === "block") {
      panel.style.display = "none";
    } else {
      panel.style.display = "block";
    }
  });
} 

movieTrailerBtn.addEventListener("click", () => document.querySelector('.movie-trailer').classList.toggle("d-none"));

$('.star-rating input').click( function(){
  starvalue = $(this).attr('value');

  for(i=0; i<=10; i++){
      if (i <= starvalue){
          $("#radio" + i).prop('checked', true);
      } else {
          $("#radio" + i).prop('checked', false);
      }
  }
});