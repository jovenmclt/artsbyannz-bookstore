<template>
    <div class="container-xxl">
        <div class="row justify-content-center px-md-5 px-2">
            <Navbar :userCarts="userCarts"/>
            <main class="col-12 justify-content-center align-items-center">
                <section id="sec1" v-if="userCarts.length > 0" class="fade-in-div">
                    <div class="row justify-content-center">
                        <div class="text-start">
                            <h5 class="fw-light text-white">{{ userCarts.length }} item in your cart for ${{ rsubtotal }}</h5>
                        </div>
                        <div class="col-md-12 mt-3">
                            <div class="table-responsive rounded  " style="max-height: 500px; overflow-y: auto;  scrollbar-width: none; ">
                                <table class="table caption-top table-hover table-borderless table-dark text-start">
                                    <thead class="position-sticky top-0 z-1 border-bottom border-secondary">
                                        <tr>
                                            <th scope="col">Item</th>
                                            <th scope="col"></th>
                                            <th scope="col">Price</th>
                                            <th scope="col">Quantity</th>
                                            <th scope="col">Total Price</th>
                                            <th scope="col"></th>
                                            <th scope="col"></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr v-for="(getitem, index) in userCarts" :key="index">
                                            <td class="fw-light" style="font-size: 13px;">
                                                <inertiaLink :href="`/viewitem/${getitem.Item_id}`">
                                                    <img :src="`/storage/${getitem.Item_image}`" alt="" width="90" class="rounded">
                                                </inertiaLink>
                                            </td>
                                            <td class="fw-light pt-5" style="font-size: 13px;">{{ getitem.Title }}</td>
                                            <td class="fw-light pt-5" style="font-size: 13px;">${{ getitem.Price }}</td>
                                            <td class="fw-light  pt-4" style="font-size: 13px;">
                                                <div class="position-relative bg-transparent mt-2" style="width: 100px;">
                                                    <input type="text" class="form-control shadow-none px-4 rounded-4 fs-5 py-2" v-model="itemQuantity[index]" readonly>
                                                    <i @click="incrementQuantity(index)"  @change="updateQuantity(getitem.Item_id)" style="cursor: pointer;" class="bi bi-caret-up-fill position-absolute top-0 end-0 me-3 mt-1 bg-transparent text-dark"></i>
                                                    <i @click="decrementQuantity(index)" style="cursor: pointer;" class="bi bi-caret-down-fill position-absolute top-50 end-0 me-3 bg-transparent text-dark"></i>
                                                </div>
                                            </td>
                                            <td class="fw-bold pt-5" style="font-size: 13px;">${{rtotalPrice[index] }}</td>
                                            <td class="fw-light pt-5" style="font-size: 13px;">
                                                <inertiaLink :href="`/checkout/${getitem.Item_id}`" class="bg-transparent text-success fw-bold">
                                                   Checkout
                                                </inertiaLink>
                                            </td>
                                            <td class="fw-light pt-5" style="font-size: 13px;">
                                                <inertiaLink :href="`/delCart/${getitem.Item_id}`" class="bg-transparent text-danger fw-bold">
                                                   Cancel
                                                </inertiaLink>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                            <div class="d-md-flex justify-content-between mt-4">
                                <div class="text-start d-md-none d-block">
                                    <h5 class="fw-bold text-white">Subtotal ${{ rsubtotal }}</h5>
                                </div>
                                <div class="text-start">
                                    <inertiaLink href="/allproducts">
                                        <button class="btn rounded-5 text-white py-2 px-3" style="background-color: #B38ED1;">Back to Shopping</button>
                                    </inertiaLink>
                                </div>
                                <div class="text-start d-md-block d-none">
                                    <h5 class="fw-bold text-white">Subtotal ${{ rsubtotal }}</h5>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <section id="sec2" v-else class="fade-in-div">
                    <div class="row justify-content-center">
                        <div class="col-md-8">
                            <div class="text-center mt-5">
                                <h2 class="fw-light text-white">YOUR SHOPPING CART IS EMPTY</h2>
                                <br>
                                <inertiaLink href="/allproducts" class="text-decodation-none">
                                    <button class="btn rounded-5 text-white py-2 px-5" style="background-color: #B38ED1;">Start Shopping</button>
                                </inertiaLink>
                            </div>
                        </div>
                    </div>
                </section>
                <section id="sec3" class="fade-in-div">
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
                <footervue />
            </main>
        </div>
    </div>
</template>

<script>
import {Link as inertiaLink} from '@inertiajs/vue3'
import Navbar from '../Navbar/Navigation.vue'
import footervue from '../Footer/footer.vue'
import {router} from '@inertiajs/vue3'
export default {
    name: 'cCart',
    components: {Navbar, footervue, inertiaLink},
    props:{userCarts:Object, get_latestItems:Array},
    data(){
        return{
            rsubtotal: 0,
            rtotalPrice: [],
            itemQuantity: [],
        }
    },
    methods:{
        totalItemincart() {
            if (this.itemQuantity && this.itemQuantity.length > 0) {
                let Subtotal_sum = 0;
                for (let i = 0; i < this.itemQuantity.length; i++) {
                    let currQuantity = this.itemQuantity[i] || 0;
                    let currPrice = Number(this.userCarts[i].Price) || 0;

                    Subtotal_sum += currQuantity * currPrice;
                    this.rtotalPrice[i] = currQuantity * currPrice;
                }
                this.rsubtotal = Subtotal_sum.toFixed(2);
            }
        },
        getQuantity(){
            if(this.userCarts && this.userCarts.length > 0){
                for(let i = 0; i < this.userCarts.length; i++){
                    this.itemQuantity.push(this.userCarts[i].Quantity);
                }
            }
        },
        incrementQuantity(index){
            this.itemQuantity[index]++;
            const data = {
                updateQuantity: this.itemQuantity[index]
            }
            router.post(`/storeQupdate/${this.userCarts[index].Item_id}`, data);
            this.totalItemincart();
        },
        decrementQuantity(index){
            if(this.itemQuantity[index] <= 1){
                this.itemQuantity[index] = 1;
            }else{
                this.itemQuantity[index]-=1;
            }
            const data = {
                updateQuantity: this.itemQuantity[index]
            }
            router.post(`/storeQupdate/${this.userCarts[index].Item_id}`, data);
            this.totalItemincart();
        },
    },
    mounted(){
        this.getQuantity();
        this.totalItemincart();
    }
}
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Josefin+Sans:ital,wght@0,100..700;1,100..700&family=League+Spartan:wght@100..900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap');

section {
    font-family: "Poppins", serif;
    padding: calc(60px + 1rem) 0;
}

table th{
    padding: 30px 20px;
}
table td {
    white-space: nowrap;
    padding: 10px 20px;
}

.fade-in-div{
    animation: fadein 1s ease-in-out;
}

@keyframes fadein {
  0%   {opacity: 0%;}

  100% {opacity: 100%;}
}
</style>
