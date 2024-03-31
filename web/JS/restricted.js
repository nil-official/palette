let left_btn = document.getElementsByClassName('bi-chevron-left')[0];
let right_btn = document.getElementsByClassName('bi-chevron-right')[0];
let cards = document.getElementsByClassName('cards')[0];
let cards_2 = document.getElementsByClassName('cards_2')[0];
let cards_3 = document.getElementsByClassName('cards_3')[0];
let search = document.getElementsByClassName('search')[0];
let search_input = document.getElementById('search_input');

left_btn.addEventListener('click',()=>{
    cards.scrollLeft-=140;
})

right_btn.addEventListener('click',()=>{
    cards.scrollLeft+=140;
})
// test2 
document.getElementById('left_button').addEventListener('click',()=>{
    cards_2.scrollLeft-=140;
})

document.getElementById('right_button').addEventListener('click',()=>{
    cards_2.scrollLeft+=140;
})
// test3 
document.getElementById('l_button').addEventListener('click',()=>{
    cards_3.scrollLeft-=140;
})

document.getElementById('r_button').addEventListener('click',()=>{
    cards_3.scrollLeft+=140;
})

let json_url = "JS/home.json";
fetch(json_url).then(Response => Response.json())
    .then((data) => {
        data.forEach((ele,i) => {
            let{name,imdb,date,sposter,bposter,genre,url,status}=ele;
            let card = document.createElement('a');
            let card_2 = document.createElement('a');
            let card_3 = document.createElement('a');
            
            if(status=="trending"){
                card.innerHTML=`
                <img  src="${sposter}" alt=""${name}" class="poster">
                <div class="rest_card">
                    <img src="${bposter}" alt="">
                        <div class="cont">
                            <h4>${name}</h4>
                            <div class="sub">
                                <p>${genre},${date}</p>
                                <h3><span class="span">IMDB</span><i class="bi bi-star-fill"></i> ${imdb}</h3>
                                </div>
                        </div>
                </div>
                `
                card.classList.add('card');
//                card.href=url;
            }

            if(status=="top 10"){
                card_2.innerHTML=`
                <img  src="${sposter}" alt=""${name}" class="poster_2">
                <div class="rest_card_2">
                    <img src="${bposter}" alt="">
                        <div class="cont_2">
                            <h4>${name}</h4>
                            <div class="sub_2">
                                <p>${genre},${date}</p>
                                <h3><span class="span_2">IMDB</span><i class="bi bi-star-fill"></i> ${imdb}</h3>
                                </div>
                        </div>
                </div>
                `

                card_2.classList.add('card_2');
//                card_2.href=url;
            }
            if(status=="latest release"){
                card_3.innerHTML=`
                <img  src="${sposter}" alt=""${name}" class="poster_3">
                <div class="rest_card_3">
                    <img src="${bposter}" alt="">
                        <div class="cont_3">
                            <h4>${name}</h4>
                            <div class="sub_3">
                                <p>${genre},${date}</p>
                                <h3><span class="span_3">IMDB</span><i class="bi bi-star-fill"></i> ${imdb}</h3>
                            </div>
                        </div>
                </div>
                `
                card_3.classList.add('card_3');
//                card_3.href=url;
            }
            cards.appendChild(card);
            cards_2.appendChild(card_2);
            cards_3.appendChild(card_3);


            
            
        });
        //search data load
        data.forEach(element=>{
            let{name,imdb,date,sposter,genre,url}=element;
            let card = document.createElement('a');
            card.classList.add('card');
//            card.href=url;
            card.innerHTML=`
            <img src="${sposter}" alt="">
            <div class="cont">
                <h3>${name}</h3>
                <p>${genre},${date}<span>IMDB</span><i class="bi bi-star-fill"></i>${imdb}</p>
            </div>
            `
            search.appendChild(card);
        });

       //search filter
        search_input.addEventListener('keyup',()=>{
            let filter=search_input.value.toUpperCase();
            let a=search.getElementsByTagName('a');
            for (let index = 0; index < a.length; index++) {
                let b = a[index].getElementsByClassName('cont')[0]; 
                let TextValue=b.textContent || b.innerText;
                if(TextValue.toUpperCase().indexOf(filter)>-1){
                    a[index].style.display="flex";
                    search.style.visibility="visible";
                    search.style.opacity=1;
                }else{
                    a[index].style.display="none";
                }
            }
            if(search_input.value==0){
                search.style.visibility="hidden";
                search.style.opacity=0;
            }
        })
    });





