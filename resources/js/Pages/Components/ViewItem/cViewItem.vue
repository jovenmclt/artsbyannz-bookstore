<template>
    <div class="container-xxl">
        <div class="row justify-content-center">
            <Navbar :userCarts="userCarts" />
            <main class="col-12 justify-content-center align-items-center">
                <section id="sec1" class="fade-in-div">
                    <div class="row justify-content-center">
                        <div class="col-xl-5 col-md-6">
                            <div class="text-center">
                                <img :src="`/storage/${rfile_image}`" class="w-100 h-100 rounded-4" alt="">
                                <div class="d-flex mt-3">
                                    <div class="position-relative " style="width: 120px;">
                                        <input type="text" class="form-control shadow-none px-4 py-2 rounded-4 fs-2"
                                            v-model="rquantity">
                                        <button @click="increase_quantity"
                                            class="btn position-absolute top-0 end-0 me-3 bg-transparent">
                                            <i class="bi bi-caret-up-fill bg-transparent"></i>
                                        </button>
                                        <button @click="decrease_quantity"
                                            class="btn position-absolute top-50 end-0 me-3 bg-transparent">
                                            <i class="bi bi-caret-down-fill bg-transparent"></i>
                                        </button>
                                    </div>
                                    <button @click="addtoCart" class="btn shadow-none ms-2 rounded-5 text-white px-4" style="background-color: #B38ED1;">Add to Cart</button>
                                </div>
                            </div>
                        </div>
                        <div class="col-xl-5 col-md-6 mt-md-0 mt-4">
                            <div class="text-start">
                                <h2 class="fw-semibold text-white">{{ rtitle }}</h2>
                                <div class="d-flex gap-2">
                                    <h4 class="fw-light text-secondary"><del>${{ rorigPrice }}</del></h4>
                                    <h4 class="fw-light text-white">${{ rdiscountPrice }}</h4>
                                </div>
                                <p class="fw-light text-white" style="font-size: 15px;" v-html="rdescription"></p>
                            </div>
                        </div>
                    </div>
                </section>
                <section id="sec2" class="fade-in-div">
                    <div class="row justify-content-center">
                        <div class="text-md-start text-center px-md-5">
                            <h1 class="fw-light text-white">YOU MAY ALSO LIKE</h1>
                        </div>
                        <div class="col-xl-4 col-md-6" v-for="(getLatest, index) in get_latestItems" :key="index">
                            <div class="text-center mt-4">
                                <inertiaLink :href="`/viewitem/${getLatest.id}`" class="text-decoration-none">
                                    <img :src="`/storage/${getLatest.file_image}`" class="rounded-3" alt="" width="350"
                                        height="410">
                                    <h6 class="fw-light text-white mt-3" style="font-size: 14px;">{{ getLatest.title }}
                                    </h6>
                                    <span class="fw-light text-secondary mt-3" style="font-size: 14px;"><del>${{
                                        getLatest.original_price }}</del></span>
                                    <span class="fw-light text-white mt-3" style="font-size: 14px;"> ${{
                                        getLatest.discount_price }}</span>
                                </inertiaLink>
                            </div>
                        </div>
                    </div>
                </section>
                <footerVue />
            </main>
        </div>
    </div>
</template>

<script>
import Navbar from '../Navbar/Navigation.vue'
import footerVue from '../Footer/footer.vue'
import {Link as inertiaLink} from '@inertiajs/vue3'
import {router} from '@inertiajs/vue3'
export default {
    name: 'cViewItem',
    components: { Navbar, footerVue, inertiaLink },
    props: { get_viewItems: Object, get_latestItems: Object, userCarts:Object},
    data() {
        return {
            ritemId: this.get_viewItems ? this.get_viewItems.id : '',
            rfile_image: this.get_viewItems ? this.get_viewItems.file_image : '',
            rtype: this.get_viewItems ? this.get_viewItems.type : '',
            rtitle: this.get_viewItems ? this.get_viewItems.title : '',
            rorigPrice: this.get_viewItems ? this.get_viewItems.original_price : '',
            rdiscountPrice: this.get_viewItems ? this.get_viewItems.discount_price : '',
            rdescription: this.get_viewItems ? this.get_viewItems.description.replace(/(\r\n|\n|\r)/g, '<br>') : '',
            rquantity: 1
        }
    },
    methods: {
        increase_quantity() {
            this.rquantity = Number(this.rquantity) + 1;
        },
        decrease_quantity() {
            let quantity = this.rquantity;
            if (quantity <= 1) {
                this.rquantity = 1
            } else {
                this.rquantity = this.rquantity - 1;
            }
        },
        addtoCart(){
            const data = {
                Item_id: this.ritemId,
                Item_image: this.rfile_image,
                Title: this.rtitle,
                Quantity: this.rquantity,
                Price: this.rdiscountPrice,
                Type: this.rtype
            }
            router.post('/storeCart', data);
        }
    }
}
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Josefin+Sans:ital,wght@0,100..700;1,100..700&family=League+Spartan:wght@100..900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap');

section {
    font-family: "Poppins", serif;
    padding: calc(60px + 1rem) 0;
}
img:hover{
    opacity: 50%;
    transition: 0.5s;
}

.fade-in-div{
    animation: fadein 1s ease-in-out;
}

@keyframes fadein {
  0%   {opacity: 0%;}

  100% {opacity: 100%;}
}
</style>
