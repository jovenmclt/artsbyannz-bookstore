<template>
    <div class="container-xxl">
        <div class="row px-xl-4 px-2">
            <main class="col-xl-8 col-md-7 justify-content-center align-items-center me-auto">
                <section id="sec1" class="fade-in-div">
                    <div class="row justify-content-center">
                        <div class="col-md-12 justify-content-center">
                            <div class="text-center mt-4">
                                <img src="./Assets/logo.png" alt="" class="w-50">
                            </div>
                            <form class="mt-5 pe-md-5">
                                <label for="" class="form-label text-white h5">CONTACT</label>
                                <div class="input-group">
                                    <input type="text" class="form-control shadow-none" placeholder="E-mail address" v-model="remail">
                                </div>
                                <div v-if="errors.email" class="mt-1">
                                    <p class="fw-light text-danger">{{ errors.email }}</p>
                                </div>
                                <div class="d-flex mt-3">
                                    <input type="checkbox" class="form-check-input shadow-none py-2 px-2" id="email"
                                        checked>
                                    <label for="email" class="form-label text-secondary ms-2 ">Email me latest release for
                                        premade covers and other digital art products</label>
                                </div>
                                <br>
                                <label for="" class="form-label text-white h5">LEAVE A MESSAGE | OPTIONAL</label>
                                <div class="input-group">
                                    <input type="text" class="form-control shadow-none"
                                        placeholder="Your name or nickname" v-model="rname">
                                </div>
                                <div v-if="errors.name" class="mt-1">
                                    <p class="fw-light text-danger">{{ errors.name }}</p>
                                </div>
                                <div class="input-group mt-3">
                                    <textarea class="form-control shadow-none" placeholder="Leave a message here"
                                        id="floatingTextarea" v-model="rmessage"></textarea>
                                </div>
                                <br>
                                <label for="" class="form-label text-white h5">AMOUNT</label>
                                <div class="input-group w-25">
                                    <input type="text" class="form-control shadow-none" placeholder="Custom" v-model="ramount">
                                </div>
                                <div v-if="errors.amount" class="mt-1">
                                    <p class="fw-light text-danger">{{ errors.amount }}</p>
                                </div>
                            </form>
                            <div class="text-start pe-md-5">
                                <br>
                                <label for="" class="form-label text-white h5">PAYMENT DETAILS</label>
                                <div class="text-start">
                                    <button id="btnpaypal" @click="btnshowPayment" class="btn btn-outline-secondary w-100 text-start py-2">
                                        <img src="./Assets/Paypal-Logo-2007.png" alt="" width="70" class="bg-white px-2 rounded">
                                        <span class="fw-light text-white ms-2 fs-5 bg-transparent ">Paypal</span>
                                    </button>
                                    <button id="btnstripes" @click="btnshowPaymentStipe" class="btn btn-outline-secondary w-100 text-start py-2 mt-3">
                                        <img src="./Assets/stripe2.png" alt="" width="70" class="bg-transparent rounded">
                                        <span class="fw-light text-white ms-2 fs-5 bg-transparent ">Stripe</span>
                                    </button>
                                    <button v-if="btn_showpayment" @click="btnPaypal_payment" class="btn mt-3 w-100" style="background-color: #FFB22C;">
                                        <span class="fw-light text-white fs-5 bg-transparent ">Pay with </span>
                                        <img src="./Assets/Paypal-Logo-2007.png" alt="" width="70" class="bg-transparent">
                                    </button>
                                    <button v-if="btn_showpaymentStripe" @click="btnStripe_payment" class="btn mt-3 w-100" style="background-color: #3674B5;">
                                        <span class="fw-light text-white ms-dark fs-5 bg-transparent "> Pay with </span>
                                        <img src="./Assets/ss.png" alt="" width="70" class="bg-transparent rounded">
                                    </button>
                                    <br><br>
                                    <inertiaLink href="/" class="text-secondary">Cancel</inertiaLink>
                                </div>
                                <br>
                                <h6 class="fw-semibold text-secondary d-none d-xl-block">Developed By jovenmiclatt.</h6>
                            </div>
                        </div>
                    </div>
                </section>
            </main>
            <div class="col-xl-4 col-md-5 custom-fixed bg-dark border border-secondary py-4 rounded-4 mx-md-4 my-md-5 my-2">
                <div class="d-flex gap-3 justify-content-center rounded bg-transparent">
                    <div class="text-start bg-transparent position-relative">
                        <i class="bi bi-currency-dollar text-white rounded fs-1 py-2 px-2"></i>
                    </div>
                    <div class="text-start mt-3 bg-transparent ms-2 w-50">
                        <span class="fw-light text-white bg-transparent" style="font-size: 14px;">Donation</span>
                    </div>
                    <div class="text-end mt-3 bg-transparent">
                        <span class="fw-bold text-white ms-2 bg-transparent" style="font-size: 12px;">${{ ramount }}</span>
                    </div>
                </div>
                <div class="d-flex justify-content-between border-top border-white mt-3 bg-transparent">
                    <div class="text-start mt-3 bg-transparent ms-2">
                        <span class="fw-light text-white bg-transparent" style="font-size: 14px;">Subtotal (1 Item)</span>
                    </div>
                    <div class="text-start mt-3 bg-transparent ms-2">
                        <span class="fw-semibold text-white bg-transparent" style="font-size: 14px;">${{ ramount }}</span>
                    </div>
                </div>
                <div class="d-flex justify-content-between bg-transparent">
                    <div class="text-start mt-3 bg-transparent ms-2">
                        <span class="fw-semibold text-white bg-transparent" style="font-size: 14px;">Total</span>
                    </div>
                    <div class="text-start mt-3 bg-transparent ms-2">
                        <span class="fw-semibold text-white bg-transparent" style="font-size: 14px;">USD ${{ ramount }}</span>
                    </div>
                </div>
            </div>
        </div>
    </div>
</template>

<script>
import { Link as inertiaLink } from '@inertiajs/vue3'
import {router} from '@inertiajs/vue3'
export default {
    name: 'cCheckout',
    props: { names:String, messages:String, errors:Object },
    components: { inertiaLink },
    data(){
        return{
            remail: '',
            rname: this.names ? this.names : '',
            rmessage: this.messages ? this.messages : '',
            ramount: '',
            btn_showpayment: false,
            btn_showpaymentStripe: false
        }
    },
    methods:{
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
        btnPaypal_payment(){
            const data = {
                email: this.remail,
                name: this.rname,
                message: this.rmessage,
                amount: this.ramount
            }
            router.post('storePaypal_donation', data);
        },
        btnStripe_payment(){
            const data = {
                email: this.remail,
                name: this.rname,
                message: this.rmessage,
                amount: this.ramount
            }
            router.post('/storeStripe_donation', data);
        }
    },
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

.fade-in-div{
    animation: fadein 1s ease-in-out;
}

@keyframes fadein {
  0%   {opacity: 0%;}

  100% {opacity: 100%;}
}
</style>
