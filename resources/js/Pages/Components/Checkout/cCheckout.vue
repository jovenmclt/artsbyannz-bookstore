<template>
    <div class="container-xxl">
        <div class="row px-xl-4 px-2">
            <main class="col-xl-8 col-md-7 justify-content-center align-items-center me-auto">
                <section id="sec1">
                    <div class="row justify-content-center">
                        <div class="col-md-12 justify-content-center">
                            <div class="text-center mt-4">
                                <img src="./Assets/logo.png" alt="" class="w-50">
                            </div>
                            <form class="mt-5 pe-md-5">
                                <label for="" class="form-label text-white h5">CONTACT</label>
                                <div class="input-group">
                                    <input type="text" class="form-control shadow-none" placeholder="E-mail address" v-model="emailAddress">
                                </div>
                                <div v-if="errors.Emailadd" class="bg-transparent text-danger mt-1">The email address is required.</div>
                                <div class="d-flex mt-3">
                                    <input type="checkbox" class="form-check-input shadow-none py-2 px-2" id="email"
                                        checked>
                                    <label for="email" class="form-label text-secondary ms-2 ">Email me latest release for
                                        premade covers and other digital art products</label>
                                </div>
                                <br>
                                <label for="" class="form-label text-white h5">BILLING ADDRESS</label>
                                <div class="input-group gap-2">
                                    <select v-model="selectedCountry" class="form-select shadow-none w-25">
                                        <option value="" disabled>Select a country</option>
                                        <option class="text-white" v-for="country in countries" :key="country"
                                            :value="country">
                                            {{ country }}
                                        </option>
                                    </select>
                                    <input type="text" class="form-control shadow-none" placeholder="Postal code" v-model="postalCode">
                                </div>
                                <div v-if="errors.country || errors.postalCode" class="bg-transparent text-danger mt-1">Billing address is required.</div>
                                <br>
                                <label for="" class="form-label text-white h5">LEAVE A MESSAGE | OPTIONAL</label>
                                <p class="fw-light text-secondary">For premade book covers, please include the following
                                    as
                                    needed: title, author's name, quote, other changes.</p>
                                <div class="input-group">
                                    <input type="text" class="form-control shadow-none"
                                        placeholder="Your name or nickname" v-model="clientName">
                                </div>
                                <div class="input-group mt-3">
                                    <textarea class="form-control shadow-none" placeholder="Leave a message here"
                                        id="floatingTextarea" v-model="clientMess"></textarea>
                                </div>
                            </form>
                            <div class="text-start pe-md-5">
                                <br>
                                <label for="" class="form-label text-white h5">PAYMENT</label>
                                <div class="text-start">
                                    <button id="btnpaypal" @click="btnshowPayment" class="btn btn-outline-secondary w-100 text-start py-2">
                                        <img src="./Assets/Paypal-Logo-2007.png" alt="" width="70" class="bg-white px-2 rounded">
                                        <span class="fw-light text-white ms-2 fs-5 bg-transparent ">Paypal</span>
                                    </button>
                                    <button id="btnstripes" @click="btnshowPaymentStipe" class="btn btn-outline-secondary w-100 text-start py-2 mt-3">
                                        <img src="./Assets/stripe2.png" alt="" width="70" class="bg-transparent rounded">
                                        <span class="fw-light text-white ms-2 fs-5 bg-transparent ">Stripe</span>
                                    </button>
                                    <button @click="paywithPaypal" v-if="btn_showpayment" class="btn mt-3 w-100" style="background-color: #FFB22C;">
                                        <span class="fw-light text-dark fs-5 bg-transparent ">Pay with </span>
                                        <img src="./Assets/Paypal-Logo-2007.png" alt="" width="70" class="bg-transparent">
                                    </button>
                                    <button @click="stripePayment" v-if="btn_showpaymentStripe" class="btn mt-3 w-100" style="background-color: #3674B5;">
                                        <span class="fw-light text-dark ms-dark fs-5 bg-transparent "> Pay with </span>
                                        <img src="./Assets/ss.png" alt="" width="70" class="bg-transparent rounded">
                                    </button>
                                </div>
                                <br>
                                <p class="fw-light text-secondary" style="font-size: 12px;">This order is handled by our Merchant of Record and merchandising partner, Fourthwall.com, who handle order-related inquiries and returns. <a href="" class="text-secondary">Privacy Policy Terms of Service</a>  <br><br>
                                This site is protected by reCAPTCHA and the Google <a href="" class="text-secondary">Privacy Policy</a> and <a href="" class="text-secondary">Terms of Service</a>  apply.</p>
                                <br>
                                <h6 class="fw-light text-secondary d-none d-xl-block">Developed By jovenmiclatt.</h6>
                            </div>
                        </div>
                    </div>
                </section>
            </main>
            <div class="col-xl-4 col-md-5 custom-fixed bg-dark border border-secondary py-4 rounded-4 mx-md-4 my-md-5 my-2">
                <div class="d-flex gap-3 justify-content-center rounded bg-transparent">
                    <div class="text-start bg-transparent position-relative">
                        <img :src="`/storage/${itemCheckouts.Item_image}`" alt="" width="60" class="rounded">
                    </div>
                    <div class="text-start mt-3 bg-transparent ms-2 w-50">
                        <span class="fw-light text-white bg-transparent" style="font-size: 14px;">{{ itemCheckouts.Title
                            }}</span>
                    </div>
                    <div class="text-end mt-4 bg-transparent">
                        <span class="fw-bold text-white ms-2 bg-transparent" style="font-size: 12px;">${{
                            itemCheckouts.Price }}</span>
                    </div>
                </div>
                <div class="d-flex justify-content-between border-top border-white mt-3 bg-transparent">
                    <div class="text-start mt-3 bg-transparent ms-2">
                        <span class="fw-light text-white bg-transparent" style="font-size: 14px;">Quantity ({{
                            itemCheckouts.Quantity }} Items)</span>
                    </div>
                    <div class="text-start mt-3 bg-transparent ms-2">
                        <span class="fw-semibold text-white bg-transparent" style="font-size: 14px;">${{ rsubtotal
                            }}</span>
                    </div>
                </div>
                <div class="d-flex justify-content-between bg-transparent">
                    <div class="text-start mt-3 bg-transparent ms-2">
                        <span class="fw-light text-white bg-transparent" style="font-size: 14px;">TAXES / VAT</span>
                    </div>
                    <div class="text-start mt-3 bg-transparent ms-2">
                        <span class="fw-semibold text-white bg-transparent" style="font-size: 14px;">--</span>
                    </div>
                </div>
                <div class="d-flex justify-content-between bg-transparent">
                    <div class="text-start mt-3 bg-transparent ms-2">
                        <span class="fw-semibold text-white bg-transparent" style="font-size: 14px;">Total</span>
                    </div>
                    <div class="text-start mt-3 bg-transparent ms-2">
                        <span class="fw-semibold text-white bg-transparent" style="font-size: 14px;">USD ${{ rsubtotal
                            }}</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import axios from "axios";
import { Link as inertiaLink } from '@inertiajs/vue3'
import {router} from '@inertiajs/vue3'
export default {
    name: 'cCheckout',
    props: { itemCheckouts: Object, errors:Object },
    components: { inertiaLink },
    data() {
        return {
            rsubtotal: 0,
            countries: [],
            selectedCountry: '',
            postalCode: '',
            emailAddress: '',
            clientName: '',
            clientMess: '',
            btn_showpayment: false,
            btn_showpaymentStripe: false
        }
    },
    methods: {
        btnshowPayment(){
            this.btn_showpayment = true
            this.btn_showpaymentStripe =  false
            if(this.btn_showpayment){
                document.getElementById('btnpaypal').classList.remove('btn-outline-secondary');
                document.getElementById('btnpaypal').classList.add('btn-secondary');

                document.getElementById('btnstripes').classList.add('btn-outline-secondary');
                document.getElementById('btnstripes').classList.remove('btn-secondary');
            }
        },
        btnshowPaymentStipe(){
            this.btn_showpaymentStripe = true
            this.btn_showpayment = false
            if(this.btn_showpaymentStripe){
                document.getElementById('btnstripes').classList.remove('btn-outline-secondary');
                document.getElementById('btnstripes').classList.add('btn-secondary');

                document.getElementById('btnpaypal').classList.add('btn-outline-secondary');
                document.getElementById('btnpaypal').classList.remove('btn-secondary');
            }
        },
        getSubtotal() {
            let sum = 0;
            let item_quantity = this.itemCheckouts.Quantity;
            let item_price = this.itemCheckouts.Price;

            sum = item_quantity * item_price

            this.rsubtotal = sum.toFixed(2);
        },
        paywithPaypal(){
            const data = {
                subtotal: this.rsubtotal,
                itemId: this.itemCheckouts.Item_id,
                itemTitle: this.itemCheckouts.Title,
                itemFile: this.itemCheckouts.Item_image,
                quantity: this.itemCheckouts.Quantity,
                itemType: this.itemCheckouts.Type,
                country: this.selectedCountry,
                postalCode:this.postalCode,
                Emailadd: this.emailAddress,
                clientName: this.clientName,
                clientMessage: this.clientMess,
            }
            router.post('/storePaypal', data);
        },
        stripePayment(){
            const data  = {
                Emailadd: this.emailAddress,
                country: this.selectedCountry,
                postalCode:this.postalCode,
                itemType: this.itemCheckouts.Type,
                itemId: this.itemCheckouts.Item_id,
                itemTitle: this.itemCheckouts.Title,
                subtotal: this.itemCheckouts.Price,
                quantity: this.itemCheckouts.Quantity,
                itemFile: this.itemCheckouts.Item_image,
            }
            router.post('/storeStripe', data);
        }
    },
    mounted() {
        this.getSubtotal();
        axios.get("https://restcountries.com/v3.1/all")
            .then(response => {
                this.countries = response.data.map(c => c.name.common).sort();
            })
            .catch(error => console.error("Error fetching countries:", error));
    }
}
</script>

<style scoped>
@import url('https://fonts.googleapis.com/css2?family=Josefin+Sans:ital,wght@0,100..700;1,100..700&family=League+Spartan:wght@100..900&family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Roboto:ital,wght@0,100;0,300;0,400;0,500;0,700;0,900;1,100;1,300;1,400;1,500;1,700;1,900&display=swap');

section {
    font-family: "Poppins", serif;
    padding: calc(20px + 1rem) 0;
}

@media (min-width: 768px) {
    .custom-fixed {
        position: fixed;
        right: 0;
        top: 30px;
    }
}
</style>
